#!/bin/bash

# This generates a multiplication table for a number provided by the user.
echo "Enter a number to generate its multiplication table:"
read number 

if [[ -z $number ]]; then
    echo "No number provided. Please enter a number."
    exit 1
fi

if [[ ! $number =~ ^[0-9]+$ ]]; then
    echo "Input must be a numeric value."
    exit 1
fi

echo "will you   like to see the full multiplication table from 1 to 10 or a partial table with a specific range? (full/partial)"
read choice

if [ "$choice" = "partial" ]; then
    echo "Enter the range (e.g. 1-5):"
    read range

    start=$(echo $range  | cut -d'-' -f1)
    end=$(echo $range | cut -d'-' -f2)

    if [[ -z $start || -z $end ]]; then
        echo "Invalid range format. Please use 'start-end' format."
        exit 1
    fi

    if [[ ! $start =~ ^[0-9]+$ || ! $end =~ ^[0-9]+$ ]]; then
        echo "Range must be numeric."
        exit 1
    fi

    if [[ $start -gt $end ]]; then
        echo "Start of range cannot be greater than end of range."
        exit 1
    fi


    if [[ $start -lt 1 || $end -gt 10 ]]; then
        echo "Range must be between 1 and 10."
        exit 1
    fi

    if [[ $start -eq $end ]]; then
        echo "Range cannot be a single number. Please provide a range."
        exit 1
    fi

    range=$((end - start + 1))
    if [[ $range -eq 0 ]]; then
        echo "Range cannot be zero. Please provide a valid range."
        exit 1
    fi

    if [[ $start -lt 1 || $start -gt 10 || $end -lt 1 || $end -gt 10 ]]; then
        echo "Please enter a valid range between 1 and 10."
        exit 1
    fi

    echo "Multiplication table for $start up to $end:"

    for (( i=start; i<=end; i++ ));
    do
    result=$((number * i))
    echo "$number x $i = $result"
    done
else
    echo "Multiplication table for $number:"
    for i in {1..10};
    do
    result=$((number * i))
    echo "$number x $i = $result"
    done
fi

