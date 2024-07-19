#!/bin/bash
echo -e "Enter your number:\c"
read number
r=$(expr $number % 2)
if [ $r -eq 0 ]
then
echo "Entered number $number is even"
else
echo "Entered number $number is not even "
fi
