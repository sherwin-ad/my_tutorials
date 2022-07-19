 #!/bin/bash

select cal in add subtract multiply divide quit;
do 
  case $cal in
    add)
      echo $cal
      read -p "x= " x
      read -p "y= " y
      echo "$x + $y = $(($x+$y))" ;;
    
    subtract) 
      echo $cal
      read -p "x= " x
      read -p "y= " y
      echo "$x - $y = $(($x-$y))" ;;

    multiply)  
      read -p "x= " x
      read -p "y= " y
      echo "$x * $y = $(($x*$y))" ;;

    divide)  
      read -p "x= " x
      read -p "y= " y
      echo "$x / $y = $(($x/$y))" ;;

    quit)
      break ;;     #Finish the loop

    *)
      echo "Invalid option $REPLY" ;; 
  esac
done