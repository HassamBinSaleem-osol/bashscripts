voting_age()
{
   echo -e "Enter your age:\c"
   read age
   if [ $age -gt  20 ]
   then
       echo "You are eligible for voting"
        if [ $age -gt  65 ]
        then
            echo "You are eligible for senior citizen benefits"
        else
            echo "You are not eligible for senior citizen benefits"
        fi
   else
       echo "You are not eligible for voting"
   fi
}
voting_age
