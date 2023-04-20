month_num=$1

if [ -z $month_num ]
then
  echo "No month number given. Please enter a month number as a command line argument."
  echo "eg: ./print-month-number 5"
  exit
fi  

if [[ $month_num -lt 1 ]] || [[ $month_num -gt 12 ]]
then
  echo "Invalid month number given. Please enter a valid number - 1 to 12."
  exit
fi

if [ $month_num = 1 ]
then 
  echo "January"
elif [ $month_num = 2 ]
then 
  echo "February"
elif [ $month_num = 2 ]
then 
  echo "February"
elif [ $month_num = 3 ]
then 
  echo "March"
elif [ $month_num = 4 ]
then 
  echo "April"
elif [ $month_num = 5 ]
then 
  echo "May"
elif [ $month_num = 6 ]
then 
  echo "June"
elif [ $month_num = 7 ]
then 
  echo "July"
elif [ $month_num = 8 ]
then 
  echo "August"
elif [ $month_num = 9 ]
then 
  echo "September"
elif [ $month_num = 10 ]
then 
  echo "October"
elif [ $month_num = 11 ]
then 
  echo "November"
elif [ $month_num = 12 ]
then 
  echo "December"      
fi  
