#!/usr/bin/env bash
# PATH_COUNT="0"
# variable="abcm,sda,more"
# final=""
# declare -a output
# if [ "${variable: -1}" = "," ]; then
#     final=${variable::${#variable}-1}
#     PATH_COUNT=$(grep -o "," <<<"$final" | wc -l)
# else
#     final="${variable}"
#     PATH_COUNT=$(grep -o "," <<<"$variable" | wc -l)
# fi

# echo "$PATH_COUNT"
# if [ "$PATH_COUNT" != "0" ]; then 
#     for i in $(echo $final | sed "s/,/ /g")
#     do
#         output+=("${i}")
#     done
# else
#     output+=("${final}")
# fi

# echo $output

FOLDER_PATH="dir1"
FILE_PATH="file1, file2, file3"
declare -a COMMAND_DIRS

IFS=', ' read -r -a DIRLIST <<< "$FOLDER_PATH"

for index in "${!DIRLIST[@]}"
do
    # if [ $index == 0 ]; then
    #     echo "$index ${DIRLIST[index]}"
    # else
    #     echo "$index A${DIRLIST[index]}"
    # fi
    COMMAND_DIRS+=("${DIRLIST[index]}")
done

echo "DIR: ${COMMAND_DIRS[*]}"

IFS=', ' read -r -a FILELIST <<< "$FILE_PATH"

for index in "${!FILELIST[@]}"
do
    if [ $index == 0 ]; then
        #echo "$index ${DIRLIST[index]}"
        COMMAND_FILES+=("-iwholename ${FILELIST[index]}")
    else
        #echo "$index A${DIRLIST[index]}"
        COMMAND_FILES+=("-o -iwholename${FILELIST[index]}")
    fi
done

echo "FILE: ${COMMAND_FILES[*]}"