#!/bin/bash

arguments_checker() {
    echo -e "Write the arguments in the correct format like this way: \n  $0 <log_file> <keyword1> <keyword2> ... <keywordn>"
    exit 1
}

if [ $# -lt 2 ]; then
    arguments_checker
fi

logfile=$1
shift
keywords=$@

if [ ! -f "$logfile" ]; then
    echo "Log file $logfile does not exist."
    exit 1
fi

declare -A keyword_counts

declare -A keyword_lines

for keyword in $keywords; do
    keyword_counts["$keyword"]=0
    keyword_lines["$keyword"]=""
done


while read -r line; do
    for keyword in $keywords; do
        if echo "$line" | grep -q "$keyword"; then
            keyword_counts["$keyword"]=$((keyword_counts["$keyword"] + 1))
            keyword_lines["$keyword"]+="$line\n"
        fi
    done
done < "$logfile"


echo "Keyword occurrences in $logfile:"
for keyword in "${!keyword_counts[@]}"; do
    echo "$keyword: ${keyword_counts[$keyword]}"
done

for keyword in "${!keyword_lines[@]}"; do
    echo -e "\nLines containing \"$keyword\":"
    echo -e "${keyword_lines[$keyword]}"
done
