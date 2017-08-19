#!/bin/bash
# menu driven bash script to operate lynx
# menu navigation offers GET/POST calls to kimsufi TodoApp

#Variables:
RED='\033[0;41;30m'			# For STDO text colors
STD='\033[0;0;39m'
# GET :
lynxtodourl() {
	clear
	todourl=$(lynx echo "http://5.135.158.225:8080/todo")
}
helpurl="$lynx http://5.135.158.225:8080/help"
#  Need to pass parameter from user
itemurl="$lynx http://5.135.158.225:8080/item$m"
jsonurl="$lynx http://5.135.158.225:8080/json$m"
# POST
newurl() {
	"$lynx http://5.135.158.225:8080/new"
}


editurl() {
    echo "Enter todo item ID to edit :"
	read -p "ID of task to edit : " m
	$lynx "http://5.135.158.225:8080/edit/$m"
}

# FUNCTTIONS : 

# function to display menus
show_menus() {
    clear
    echo  "~~~~~~~~~~~~~~~~~~~~~"    
    echo  " M A I N - M E N U"
    echo  "~~~~~~~~~~~~~~~~~~~~~"
    echo  " n) New todo item"
    echo  " l) All todo items"
    echo  " i) Show todo item ID"
    echo  " u) Edit todo item ID"
    echo  " j) Show todo item in JSON" 
    echo  " h) Help page"
    echo  " q) Exit" 
}

# function to read answer from user
read_options(){
    local choice
    read -p "Enter choice [ n, l, i, u, j, h, q ] " choice
    case $choice in
        n) newurl ;;
        l) todourl ;;
        i) indexurl ;;
        u) editurl ;;
        j) jsonurl ;;
        h) helpurl ;;
        q) exit 0 ;;
        *) echo -e "${RED}Error...${STD}" && sleep 2
    esac
}

# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
 
	show_menus
	read_options
done



# Versioning:
# 12-28-2016 - Initial version to connect to servers

##   NEXT IMPLEMENTATION Parking lot :
# 
#	- Mysql connect menu item
#	- SECURITY:Create separate user for todoapp in mysql. Root is used now!
# 	- Add funny pictures to 403/404 error pages
