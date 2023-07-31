#!/bin/sh

## SET VARIABLES ##
# Data saving directory #
if [ "$port" = 1 ]; then
  export datadir="./saves/"
else
  export datadir="${XDG_DATA_HOME:-$HOME/.local/share}/life.sh"
fi
mkdir -p "$datadir"
# Name Lists #
boynamelist=$(echo "Adam Aaron Alex Andy Ben Blake Brycen Caleb Cam Chad Chris Connor Dan Dave Dom Dylan Eddie Eli Ethan Felix Gabe Harry Hank Isaac Jack Jackson Jas Joe Josh Kaelan Lev Liam Lucas Luke Mase Matt Mike Nate Nigel Nick Noah Oli Oscar Pat Quinn Ryan Sam Seb Tom Vince Will Xav Zach" | tr " " "\n")
boysnum=$(echo "$boynamelist" | wc -l)
girlnamelist=$(echo "Abigail Alice Anna Audrey Ava Bella Chloe Clara Eleanor Ella Emma Eva Gabriella Grace Hailey Hannah Harper Hazel Isabella Ivy Jasmine Layla Leah Lily Lucy Mackenzie Madison Mia Natalie Olivia Piper Ruby Savannah Scarlett Sophia Stella Taylor Valentina Victoria Violet Willow Zoe Zara" | tr " " "\n")
girlsnum=$(echo "$girlnamelist" | wc -l)
surnamelist=$(echo "Adams Allen Anderson Baker Bell Bennett Brooks Brown Campbell Carter Clark Collins Cook Cooper Cox Davis Edwards Evans Garcia Gonzalez Gray Green Hall Harris Hernandez Hill Howard Jackson James Johnson Jones King Lee Lewis Lopez Martinez Martin Miller Mitchell Moore Morgan Morris Murphy Nelson Parker Perez Peterson Phillips Powell Ramirez Reed Richardson Rivera Roberts Robinson Rodriguez Rogers" | tr " " "\n")
surnum=$(echo "$surnamelist" | wc -l)
# Other Presets #
name="0"

## FUNCTIONS ##
# Statistic Generation #
genrand() { 
awk -v min="$1" -v max="$2" -v seed="$(od -An -N4 -tu4 /dev/urandom)" 'BEGIN{srand(seed+0); printf("%.2d", int(min+rand()*(max-min+1)))}'
}
genstat() {
      run=$(genrand 1 4)
      if [ "$run" = 1 ]; then
       export "$1"="$(genrand 1 100)"
      else
        export "$1"="$(genrand 50 100)"
      fi
}
# Gen People #
genperson () {
  true
}
# Import Life #
imp() {
  for file in "$lifedir"/*
    do
      . "$file"
    done
}
# Year Starting Event #
ageevent() {
if [ "$age" = 1 ]; then
  echo Insert Start of year event here
fi
}
# Name Generator #
genboyname() {
  prinum=$(genrand 1 "$boysnum")
  echo "$boynamelist" | sed -n "${prinum}p"
}
gengirlname() {
  prinum=$(genrand 1 "$girlsnum")
  echo "$girlnamelist" | sed -n "${prinum}p"
}
gensurname() {
  prinum=$(genrand 1 "$surnum")
  echo "$surnamelist" | sed -n "${prinum}p"
}
# Echo Statistics #
stat () {
  echo "Your name is $name
You are $sex
You are $age years old
You have \$$cash in the bank
You are $smart% intelligent
You have $look% looks 
You are $health% healthy
You are $happy% happy"
}

## FLAGS ##
case $* in
  *-d*) # Debug Mode #
 echo "------------------
DEBUG MODE ENABLED
------------------
DATA DIR = $datadir"
  export debug=1;;
  *-l*) # Load life via flag #
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
  *) export debug=0 # If no flags are detected, start game normally #
  echo "
                       Welcome to

 _       _________ _______  _______     _______          
( \      \__   __/(  ____ \(  ____ \   (  ____ \|\     /|
| (         ) (   | (    \/| (    \/   | (    \/| )   ( |
| |         | |   | (__    | (__       | (_____ | (___) |
| |         | |   |  __)   |  __)      (_____  )|  ___  |
| |         | |   | (      | (               ) || (   ) |
| (____/\___) (___| )      | (____/\ _ /\____) || )   ( |
(_______/\_______/|/       (_______/(_)\_______)|/     \|
"
  sleep 0.5
esac 
## HOME MENU ##
# If no loading flag was passed #
if [ "$name" = 0 ]; then
while :; do
# Prompt user to start or load a life #
echo "[1] New Life | [2] Load Life"
read -p ">> " -r response

  # LIFE CREATION #
  if [ "$response" = "1" ]; then
    while :; do
    # Sex #
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
    # String Statistics (name, location, etc) #
    echo "Enter your characters first name"
    read -p ">> " -r fname
    echo "Enter your characters last name"
    read -p ">> " -r lname
    echo "Enter your characters town/city name (Note that this town will be in Australia. It can be fictional or real)"
    read -p ">> " -r town
    # echo "Enter your characters country name"
    # read -p ">> " -r country

    # Value generation with a strong positive bias #
    genstat smart
    genstat look
    genstat health

    # Export stats #
    export age=0
    export happy=100
    export cash=0
    export fame
    export lname
    export name="$fname"-"$lname"
    export town
    export country
    export sex

    # FAMILY #
    # Mum #
    # mumname="$(gengirlname)-$lname"

    # Tell player their decisions in formatted language #
    echo "I am $fname $lname, and I was born as a $sex in $town, Australia. I am $smart% intelligent, have $look% looks, are $health% healthy, and am $happy% happy"
    break
  # SAVED LIFE LOADING #
  elif [ "$response" = "2" ]; then 
    echo "Choose a name from these options. Make sure to spell it exactly (case sensitive), or the script will error"
    # List saved lives in data directory and prompt user to choose #
    while :; do find "$datadir" -printf '%P | '; echo; read -p ">> " -r name
    if  test -s "$datadir"/"$name"; then
      break
    else
      echo "Life not found, it may be incorrectly spelt, try again"
    fi
    done
    # Set the chosen name as current life #
    export name
    # Import all stats on chosen life #
    # . "$datadir"/"$name"
    break
  else
    echo "Invalid Response, try again"
  fi
done
fi
export lifedir="$datadir/$name"

## THE GAME ##
echo "=== Entering Life ==="
mkdir -p "$lifedir"; touch "$lifedir/test"
imp 
echo "Run 'help' for a list of commands with descriptions, or 'tut' for a basic tutorial"
# Main game UI #
while :; do
read -p ">> " -r "act"
case $act in
  age) echo "Ageing up"; age=$((age+1)); ageevent ;; # Age
  "stop") echo "Saving"; break ;; # Save and quit
  stat) stat;; # Print life statistics
  help) printf " age: Complete year and start next \n stat: List current statistics \n stop: Save and exit \n help: View this menu \n" ;; # List avalible commands
  *) echo "Invalid Command" # Catchall
esac 
done

## SAVING ##
echo "export name='$name' 
export sex='$sex'
export age='$age'
export smart='$smart'
export look='$look'
export health='$health'
export happy='$happy'" > "$lifedir"/player
echo "Exiting"
