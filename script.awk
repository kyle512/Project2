BEGIN {
    FS = ","
    total_multiple=0
    total_FebJan=0
    total_MI=0
    total_MI_Multiple=0
    total_MI_FebJan=0
}
$3 >= 2 && NR>1 { 
    total_multiple+=1 
}
$13 == 1 || $13 == 2 && NR>1 {
    total_FebJan+=1
}
$1 == 26 && NR>1 {
    total_MI+=1
}
$1 == 26 && $3>=2 && NR>1 {
    total_MI_Multiple+=1
}
$1 == 26 && ($13 == 1 || $13 ==2) && NR>1 {
    total_MI_FebJan+=1
}
NR>1 {state[$1] += $52}
END{
    print ("Multiple Vehicles Proportion:", total_multiple / (NR-1))
    print ("Jan/Feb Proportion:", total_FebJan / (NR-1))
    print ("MI Multiple Vehicles Proportion:", total_MI_Multiple / total_MI)
    print ("MI Jan/Feb Proportion:", total_MI_FebJan / total_MI)
    print ("State Code,# DD")
    for (key in state) print key","state[key]
}
