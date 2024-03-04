#!/bin/bash

# Prompt user for input
read -p "Enter a number for the multiplication table: " number

# Validate input is a number
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
  echo "Invalid input. Please enter a valid number."
  exit 1
fi

# Prompt user for table type
read -p "Do you want a full multiplication table (1 to 10) or a partial table? (full/partial): " tableType

if [ "$tableType" == "full" ]; then
  startRange=1
  endRange=10
elif [ "$tableType" == "partial" ]; then
  # Prompt user for start and end range
  read -p "Enter the start range for the partial table: " startRange
  read -p "Enter the end range for the partial table: " endRange

  # Validate range inputs
  if ! [[ "$startRange" =~ ^[0-9]+$ ]] || ! [[ "$endRange" =~ ^[0-9]+$ ]] || [ "$startRange" -gt "$endRange" ]; then
    echo "Invalid range. Defaulting to full table."
    startRange=1
    endRange=10
  fi
else
  echo "Invalid choice. Defaulting to full table."
  startRange=1
  endRange=10
fi

# Generate multiplication table using loops
echo "Multiplication table for $number:"
for ((i=$startRange; i<=$endRange; i++)); do
  result=$((number * i))
  echo "$number x $i = $result"
done
