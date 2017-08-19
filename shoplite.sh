#!/bin/bash

print_menu() {
    clear
    echo  "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"    
    echo  "      M A I N - M E N U"
    echo  "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo  " l) All shopping list items"
    echo  " n) Add new shopping list item" 
	echo  " c) Show completed items list"
    echo  " q) Exit" 
}

read_choice(){
    local choice
    read -p "Enter choice [ n, l, q ] " choice
    case $choice in
        n) lynxshopnewurl ;;
        l) lynxshoplurl ;;
		c) lynxclosurl ;;
        q) echo "     Bye !" && exit 0 ;;
        *) echo -e "${RED}Error...${STD}" && sleep 2
    esac
}

pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}


lynxshoplurl() {
	clear
	lynx -dump "http://5.135.158.225/html/angularjs0/shopping/index.html"
	echo ""
	pause
}

lynxclosurl() {
	clear
	lynx -dump "http://5.135.158.225/html/angularjs0/shopping/completed.html"
	echo ""
	pause
}


lynxshopnewurl() {
    clear
    lynx "http://5.135.158.225/html/angularjs0/shopping/index.html"
}


while true 
do 
	print_menu	
	read_choice
done

# Versioning:
# 12-28-2016 - Initial version to connect to servers

##   NEXT IMPLEMENTATION Parking lot :
# 
#   - SECURITY:Create separate user for shopping list app in mysql. Root is used now!
#   - Add funny pictures to 403/404 error pages
