function fnc() {
    local var1='local_var1'
    echo "Inside fnc: var1 is $var1, var2 is $var2"
    var1='local_var1_updated'
    var2='var2_updated'
}
var1='GLOBAL_1'
var2='GLOBAL_2'
echo "Before fnc: var1 is $var1, var2 is $var2"
fnc
echo "After fnc: var1 is $var1, var2 is $var2"