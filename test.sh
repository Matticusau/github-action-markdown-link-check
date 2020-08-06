#!/usr/bin/env bash
PATH_COUNT="0"
variable="abcm,sda"
final=""
output=""
declare -a ARRAY2
if [ "${variable: -1}" = "," ]; then
    final=${variable::${#variable}-1}
    PATH_COUNT=$(grep -o "," <<<"$final" | wc -l)
else
    final="${variable}"
    PATH_COUNT=$(grep -o "," <<<"$variable" | wc -l)
fi

#echo "$PATH_COUNT"
if [ "$PATH_COUNT" != "0" ]; then 
    for i in $(echo $final | sed "s/,/ /g")
    do
        ARRAY2+="${i} "
    done
    output="${ARRAY2}"
else
    output+="${final}"
fi

if (( ${#ARRAY2[@]} )); then
    echo not empty
else
    echo $output
fi