#!/bin/bash
# aceydeucey -- Dealer flips over two cards, and you guess whether the next card from the deck will rank between the two. 
# For example, with a 6 and an 8, a 7 is between the two, but a 9 is not. A 6 is also a loss.

function initializeDeck
{
    # start by creating the deck of cards

    card=1
    while [ $card -lt 52 ] ; do # 52 cards in a deck.
        deck[$card]=$card
        card=$(( $card + 1))
    done
}

function pickCard
{
    # This is the most interesting function: pick a random card from the deck. Uses the deck[] array to find an available card slot.

    local errcount randomcard 
    threshold=10 # Mac guesses for a card before we fall through
    errcount=0

    # Randomly pick a card that hasn't already been pulled from the deck a max of $threshold times. Fall through on fail (to avoid a possible infinite loop where it keeps guessing the same already dealt card)
    while [ $errcount -lt $threshold ] ; do
        randomcard=$(( $RANDOM%52 + 1))
        errcount=$(( $errcount + 1 ))
        # echo ${deck[$randomcard]}
        if [ ! "${deck[$randomcard]}" = "0" ] ;  then 
            picked=${deck[$randomcard]} 
            deck[$randomcard]=0 # Picked -- remove it.
            return $picked 
        fi 
    done

    # If we get here, we've been unable to randomly pick a card, so we'll just step through the array until we find an available card.
    randomcard=1

    while [ "${deck[$randomcard]}" = "0" ] ; do 
        randomcard=$(( $randomcard + 1 ))
    done 
    picked=${deck[$randomcard]}
    deck[$randomcard]=0

    return $picked
}


function shuffleDeck
{
    # It's not really a shuffle. It's a random extraction of card values from the 'deck' array, creating newdeck[] as the "shuffled" deck.
    count=1
    while [ $count != 53 ] ; do 
        pickCard 
        newdeck[$count]=$picked
        count=$(( $count + 1))
    done 
}


function showCard
{
    # Uses a div and a mod to figure out suit and rank, though in this game, only rank matters. Still, presentation is important, so this helps make things pretty.

    card=$1
    if [ $card -lt 1 -o $card -gt 52 ] ; then 
        echo "Bad card value: $card"
        exit 1
    fi 

    # div and mode

    suit=$(( (($card-1)/13)+1 ))
    rank=$(( $card%13 ))

    case $suit in 
        1) suit="Hearts"
        ;;
        2) suit="Clubs"
        ;;
        3) suit="Spades"
        ;;
        4) suit="Diamonds"
        ;;
        *) echo "Bad suit value: $suit"; exit 1
        ;;
    esac

    case $rank in 
        0) rank="King"
        ;;
        1) rank="Ace"
        ;;
        11) rank="Jack"
        ;;
        12) rank="Queen"
        ;;
    esac
    cardname="$rank of $suit"
}

function dealCards
{
    # Acey Deucey has two cards flipped up 

    # Since deck is shuffled, we take the top two cards from the deck to be card1 and card2, card #3 is the one to be flipped up.
    card1=${newdeck[1]}
    card2=${newdeck[2]}
    card3=${newdeck[3]}

    # Let's get the rank values to make subsequent calculations easy
    rank1=$(( ${newdeck[1]} % 13 ))
    rank2=$(( ${newdeck[2]} % 13 ))
    rank3=$(( ${newdeck[3]} % 13 ))

    # Fix to make the king: default rank = 0, make rank = 13
    if [ $rank1 -eq 0 ] ; then
        rank1=13
    fi 

    if [ $rank2 -eq 0 ] ; then
        rank2=13
    fi 

    if [ $rank3 -eq 0 ] ; then
        rank3=13
    fi 

    # Organize them so that card1 is always lower than card2 
    # if [ $card1 -gt $card2 ] ; then
    if [ $rank1 -gt $rank2 ] ; then
        tmp=$card1
        card1=$card2
        card2=$tmp
        tmp=$rank1
        rank1=$rank2
        rank2=$tmp
    fi 

    showCard $card1
    cardname1=$cardname 
    showCard $card2
    cardname2=$cardname 
    showCard $card3
    cardname3=$cardname 

    echo ""
    echo "I've dealt: "
    echo "$cardname1"
    echo "$cardname2"
}

function intro
{
    echo "Welcome to Acey Deucey. "
    echo "The goal of this game is for you to correctly guess whether the third card is going to be between the two cards I'll pull from the deck. "
    echo "For example, if I flip up a 5 of hearts and a jack of diamonds, you'd bet on wehther the next card will have a higher rank than a 5 AND a lower rank than a jack (that is, a 6, 7, 8, 9, or 10 of any suit)."
    echo "Ready? Let's go!"
}

games=0
won=0

if [ $# -gt 0 ] ; then 
    # helpful info if a parameter is specified 
    intro 
fi 

while [ /bin/true ] ; do 
    initializeDeck
    shuffleDeck
    dealCards 

    splitValue=$(( $rank2 - $rank1 ))
    
    if [ $splitValue -eq 0 ] ; then 
        echo "No point in betting when they're the same rank!"
        continue 
    fi 

    echo -n "The spread is $splitValue. Do you think the next card will be between them? (y/n/q) "
    read answer 

    if [ "$answer" = "q" ] ; then 
        echo "You played $games games and won $won times."
        exit 0 
    fi 

    echo "I picked: $cardname3"

    # Test whether cardname3 is between the value. A tie = loss
    if [ $rank3 -gt $rank1 -a $rank3 -lt $rank2 ] ; then # win 
        winner=1
    else 
        winner=0
    fi  
    
    if [ $winner -eq 1 -a "$answer" = "y" ] ; then 
        echo "You bet that it would be between the two, and it is. WIN!"
        won=$(( $won + 1))
    elif [ $winner -eq 0 -a "$answer" = "n" ] ; then 
        echo "You bet that it would not be between the two, and it isn't. WIN!"
        won=$(( $won + 1))
    else
        echo "Bad betting strategy. You lose."
    fi 

    games=$(( $games + 1)) 
done 
exit 0 