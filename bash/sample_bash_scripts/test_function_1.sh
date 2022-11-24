#!/bin/bash

echo "Enter a number: "

read x

function square_of_number () {
    echo "Square of x is: $((x*x))"
}

square_of_number