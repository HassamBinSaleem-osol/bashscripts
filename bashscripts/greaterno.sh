#!/bin/bash
greater(){
          echo -e "Enter the first number:\c"
          read number1
          echo -e "Enter the second number:\c"
          read number2
          if [ $number1 -gt  $number2 ]
          then
              echo "$number1 is greater."
          elif [ $number2 -gt $number1 ]
          then
              echo "$number2 is greater."
          else
              echo "Both numbers are equal"
          fi
}
greater

