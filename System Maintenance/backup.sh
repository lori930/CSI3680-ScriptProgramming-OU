#!/bin/bash
# backup -- Creates either a full or incremental backup of a set of defined directories on the system.
# By default, the output file is compressed and saved in /tmp with a timestamped filename. Otherwise, specify an output device (another disk, a removable storage device, or whatever else floats your boat).

compress="bzip2" # change to your favorite compression app.
inclist="/tmp/backup.inclist.$(date +%d%m%y)"
output="/tmp/backup.$(date +%d%m%y).bz2"
tsfile="$HOME/.backup.timestamp"
btype="incremental" # Default to an incremental backup
noinc=0 # And here's an update of the timestamp

trap "/bin/rm -f $inclist" EXIT 

usageQuit(){
    cat << "EOF" >&2
Usage: $0 [-o output] [-i|-f] [-n]
    -o lets you specify an alternative backup file/device,
    -i is an incremental, -f is a full backup,
    -n prevents updating the timestamp when an incremental backup is done.
EOF
    exit 1
}


#####  Main code section begins here ######
while getopts o:ifn opt; do
    case $opt in
    o) output="$OPTARG";
    ;;
    i) btype="incremental";
    ;;
    f) btype="full";
    ;;
    n) noinc=1;
    ;;
    ?) usageQuit
    esac
done 

shift $(($OPTIND - 1))

echo "Doing $btype backup, saving output to $output"

timestamp="$(date +%m%d%I%M)" #Grab month, day, hour, minute from date. man strftime for more info.

if [ "$btype" = "incremental" ] ; then 
    if [ ! -f $tsfile ] ; then 
        echo "Error: Can't do an incremental backup: no timestamp file" >&2 
        exit 1
    fi 
    find $HOME -depth -type f -size -50M -newer $tsfile -user ${USER:-LOGNAME} | pax -w -x tar | $compress > $output # :- https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
    failure="$?"
else 
    find $HOME -depth -type f -size -50M -user ${USER:-LOGNAME} | pax -w -x tar | $compress > $output 
    failure="$?"
fi 

if [ "$noinc" = "0" -a "$failure" = "0" ] ; then
    touch -t $timestamp $tsfile 
fi
exit 0
