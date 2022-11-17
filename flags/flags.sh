#Get users from /etc/passwd
USERS="$(cat /etc/passwd | cut -d : -f 1)"

MENU_OPTIONS="
$(basename $0) - [OPTIONS]

    -h - Help
    -v - Version
    -s - Order output
"

VERSION="1.1"

ORDER_KEY=0
UPPERCASE_KEY=0

while test -n "$1"; do
    case "$1" in
    -h) echo "$MENU_OPTIONS" && exit 0 ;;
    -v) echo "$VERSION" && exit 0 ;;
    -s) ORDER_KEY=1 ;;
    -m) UPPERCASE_KEY=1 ;;
    *) echo "Invalid option $1, use -h to see options" && exit 1 ;;
    esac
    shift # next argument => $2, $3, $4 ... to $1 to each loop
done

[[ $ORDER_KEY -eq 1 ]] && USERS=$(echo "$USERS" | sort)
[[ $UPPERCASE_KEY -eq 1 ]] && USERS=$(echo "$USERS" | tr '[:lower:]' '[:upper:]')

echo "$USERS"
