#!/usr/bin/env bash
# guessinggame.sh - guess how many files are in the current directory

# Count the files (non-hidden) in the current directory
function count_files {
  ls -1 | wc -l
}

# Ask the user for a numeric guess; keep asking until the input is valid
function get_guess {
  local input
  while true; do
    read -p "Enter your guess: " input
    if [[ $input =~ ^[0-9]+$ ]]; then
      echo "$input"
      return
    fi
    echo "Please enter a valid whole number." >&2
  done
}

actual=$(count_files)

echo "Welcome to the Guessing Game!"
echo "How many files are in the current directory?"

while true
do
  guess=$(get_guess)

  if [[ $guess -lt $actual ]]
  then
    echo "Too low! Try again."
  elif [[ $guess -gt $actual ]]
  then
    echo "Too high! Try again."
  else
    echo "Congratulations! You guessed correctly: there are $actual files."
    break
  fi
done
