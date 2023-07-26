#!/bin/bash

## SET VARIABLES ##
if [ "$port" = 1 ]; then
  export datadir="./saves/"
else
  export datadir="${XDG_DATA_HOME:-$HOME/.local/share}/life.sh"
fi
mkdir -p "$datadir"
name="0"

genstat() {
      run=$(shuf -i 1-4 -n1)
      if [ "$run" = 1 ]; then
       export "$1"="$(shuf -i 1-100 -n1)"
      else
        export "$1"="$(shuf -i 50-100 -n1)"
      fi
}
imp() {
  for file in "$datadir"/"$name"/*
    do
      . "$file"
    done
}
## Year Starting Event ##
ageevent() {
if [ "$age" = 1 ]; then
  echo Insert Start of year event here
fi
}
stat () {
  echo "Your name is $name
You are $sex
You are $age years old
You are $smart% intelligent
You have $look% looks 
You are $health% healthy
You are $happy% happy"
}

case $* in
  *-d*)
 echo "------------------
DEBUG MODE ENABLED
------------------
DATA DIR = $datadir"
  export debug=1;;
  *-l*) 
    if  test -s "$datadir"/"$2"; then
      export "name"="$2"
      . "$datadir"/"$name"
    else
      echo "Life not found, it may be incorrectly spelt, try again"
      exit 1
    fi
    export debug=1
    echo "Starting $name's life"
    ;;
  *) export debug=0
  clear
  echo "Welcome to

 _       _________ _______  _______     _______          
( \      \__   __/(  ____ \(  ____ \   (  ____ \|\     /|
| (         ) (   | (    \/| (    \/   | (    \/| )   ( |
| |         | |   | (__    | (__       | (_____ | (___) |
| |         | |   |  __)   |  __)      (_____  )|  ___  |
| |         | |   | (      | (               ) || (   ) |
| (____/\___) (___| )      | (____/\ _ /\____) || )   ( |
(_______/\_______/|/       (_______/(_)\_______)|/     \|"
  sleep 0.5
esac 


if [ "$name" = 0 ]; then
## PROMPT ##
while :; do
echo "[1] New Life | [2] Load Life"
read -p ">> " -r response

  ## CREATE ##
  if [ "$response" = "1" ]; then
    while :; do
    echo "[M]ale or [F]emale?"
    read -p ">> " -r response
      if [ "$response" = "m" ]; then
        export sex=male
        break
      elif [ "$response" = "f" ]; then
        export sex=female
        break
      else
        echo "Invalid reponse"
    fi
    done
    
    echo "Enter your characters full name"
    read -p ">> " -r name
    echo "Enter your characters town/city name (Note that this town will be in Australia. It can be fictional or real)"
    read -p ">> " -r town
    # echo "Enter your characters country name"
    # read -p ">> " -r country

    ## Generate and export stats with a strong positive bias (1/8 chance of being below 50%) ##
    genstat smart
    genstat look
    genstat health

    ## Export other stats ##
    export age=0
    export happy=100
    export name
    export town
    export country
    export sex

    echo "I am $name, and I was born as a $sex in $town, Australia. I am $smart% intelligent, have $look% looks, are $health% healthy, and am $happy% happy"
    break
  ## LOAD ##
  elif [ "$response" = "2" ]; then 
    echo "Choose a name from these options. Make sure to spell it exactly (case sensitive), or the script will error"
    while :; do find "$datadir" -printf '%P | '; echo; read -p ">> " -r name
    if  test -s "$datadir"/"$name"; then
      break
    else
      echo "Life not found, it may be incorrectly spelt, try again"
    fi
    done
    export name
    . "$datadir"/"$name"
    break
  else
    echo "Invalid Response, try again"
  fi
done
fi

echo "=== Entering Life ==="
imp
echo "Run 'help' for a list of commands with descriptions, or 'tut' for a basic tutorial"
# Interaction
while :; do
read -p ">> " -r "act"
case $act in
  age) echo "Ageing up"; age=$((age+1)); ageevent
  ;;
  "stop") echo "Saving"; break ;;
  stat) stat;;
  help) printf " age: Complete year and start next \n stat: List current statistics \n stop: Save and exit \n help: View this menu \n" ;;
  *) echo "Invalid Command"
esac 
done

## SAVING ##
echo "export name='$name' 
export sex='$sex'
export age='$age'
export smart='$smart'
export look='$look'
export health='$health'
export happy='$happy'" > "$datadir"/"$name"
echo "Exiting"
