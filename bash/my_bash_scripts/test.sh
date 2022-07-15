#!/bin/bash

echo -n "Enter a character: "
read letter

case $letter in

  [a-z] )
    echo '$letter is between a-z' ;;

  [0-9] )
    echo '$letter is between 0-9' ;;

  ? )
    echo '$letter is a special character' ;;

  * )
    echo '$letter is an unknown character' ;;

esac
         
   

 
