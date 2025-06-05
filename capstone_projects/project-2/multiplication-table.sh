#!/bin/bash

# ANSI color codes
GREEN="\033[1;32m"
RED="\033[1;31m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
RESET="\033[0m"

# Function to get a valid number from the user
get_number() {
  while true; do
    echo -e "${CYAN} Enter a number to generate its multiplication table:${RESET}"
    read number

    if [[ -z $number ]]; then
      echo -e "${RED} No number provided. Try again.${RESET}"
    elif [[ ! $number =~ ^[0-9]+$ ]]; then
      echo -e "${RED} Input must be a numeric value. Try again.${RESET}"
    else
      break
    fi
  done
}

# Function to get user's choice: full or partial
get_choice() {
  while true; do
    echo -e "${CYAN} Would you like the full table (1–10) or a partial table? (Enter 'f' for full, 'p' for partial):${RESET}"
    read choice

    if [[ $choice =~ ^[fp]$ ]]; then
      break
    else
      echo -e "${RED} Invalid choice. Enter 'f' or 'p'.${RESET}"
    fi
  done
}

# Function to get a valid range
get_range() {
  while true; do
    echo -e "${CYAN}Enter the range (e.g. 1-5):${RESET}"
    read range

    start=$(echo "$range" | cut -d'-' -f1)
    end=$(echo "$range" | cut -d'-' -f2)

    if [[ -z $start || -z $end ]]; then
      echo -e "${RED} Invalid format. Use 'start-end'.${RESET}"
      continue
    fi

    if [[ ! $start =~ ^[0-9]+$ || ! $end =~ ^[0-9]+$ ]]; then
      echo -e "${RED} Both start and end must be numbers.${RESET}"
      continue
    fi

    if [[ $start -gt $end ]]; then
      echo -e "${RED} Start cannot be greater than end.${RESET}"
      continue
    fi

    if [[ $start -eq $end ]]; then
      echo -e "${RED} Range must span more than one number.${RESET}"
      continue
    fi

    if [[ $start -lt 1 || $end -gt 10 ]]; then
      echo -e "${RED} Range must be between 1 and 10.${RESET}"
      continue
    fi

    break
  done
}

# Run prompts
get_number
get_choice

# Styled output
print_table() {
  echo -e "\n${YELLOW}==============================${RESET}"
  echo -e "${GREEN} Multiplication Table for $number${RESET}"
  echo -e "${YELLOW}==============================${RESET}"
  for ((i=$1; i<=$2; i++)); do
    result=$((number * i))
    echo -e "${GREEN}$number x $i = $result${RESET}"
  done
  echo -e "${YELLOW}==============================${RESET}\n"
}

if [[ $choice == "p" ]]; then
  get_range
  print_table "$start" "$end"
else
  print_table 1 10
fi
