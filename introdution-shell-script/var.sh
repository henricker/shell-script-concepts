#!/usr/bin/env bash

# #!/usr/bin/env bash => find bash compiler in the path

# Each variable is followed by the data type
NAME="Henricker" # String
AGE=25           # Integer
HEIGHT=1.80      # Float
MARRIED=false    # Boolean

echo "My name is $NAME" # Output: My name is John
echo "$NAME"            # Output: John

echo "My age is $AGE" # Output: My age is 25
echo "$AGE"           # Output: 25

echo "My height is $HEIGHT" # Output: My height is 1.8
echo "$HEIGHT "             # Output: 1.8

echo "Am I married? $MARRIED" # Output: Am I married? false
echo "$MARRIED"               # Output: false

NUMEBER_1=10
NUMBER_2=20

TOTAL=NUMEBER_1+NUMBER_2 # Output: 30

echo "$TOTAL" # Output: NUMEBER_1+NUMBER_2

TOTAL=$((NUMEBER_1 + NUMBER_2)) # Output: 30

echo "$TOTAL" # Output: 30

CAT_OUTPUT="$(cat /etc/passwd | grep henricker)" # Output: /etc/passwd content

echo "$CAT_OUTPUT" # Output: /etc/passwd content

echo "-------------------------------------------------"
# Similar to argv in C

echo "The script name is $0"     # Output: The script name is var.sh
echo "The first argument is $1"  # Output: The first argument is 1
echo "The second argument is $2" # Output: The second argument is 2
echo "all params is $*"          # Output: all params is 1 2 3 4 5 6 7 8 9 10
echo "all params count is $#"    # Output: all params count is 10
echo "last exit code is $?"      # Output: last exit code is 0
echo "PID is $$"                 # Output: PID is 1234
