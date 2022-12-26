#!/bin/bash

function print_color(){
   case $1 in
      "green") color="\033[0;32m" ;;
      "red") color="\033[0;31m" ;;
      "*") color=n"\033[0m" ;;
   esac   

      echo -e "${color}$2 ${nc}"
}

print_color "red" "Is not Active"
print_color "green" "Is Active"


is_active = $( )


function print_green(){
   green="\033[0;32m"
   nc="\033[0m" 

   echo -e "${green}$1 ${nc} " 
}


print_green Installing...

echo -e "\033[0;32mInstalling ...\033[0m"