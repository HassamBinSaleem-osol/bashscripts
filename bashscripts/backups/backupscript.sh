#!/bin/bash
source_destination_argument() {
 echo -e "Please enter the arguments of source directory  and destination directory in the correct format like this way: \n $0 <sourcedirectory> <destination directory>"
 exit 1
}

if [ $# -ne 2 ]; then
 source_destination_argument
 exit 1
fi

source=$1
destination=$2

if [ ! -d "$source" ]; then
 echo "Source directory $source  not exist"
 exit 1
fi

if [ ! -d "$destination" ]; then
 echo "Destination directory $directory not exist"
 exit 1
fi

rsync -av --log-file=backuplog.log "$source" "$destination"

echo "Backup of $source to $destination is compeleted on $(date)" >> backuplog.log
