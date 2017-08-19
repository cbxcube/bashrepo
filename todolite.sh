#!/bin/bash


## Colors for output and splash screen : 

# Red front text
red=`tput setaf 1`
# Yellow background 
yellow=`tput setaf 11`
# Green front text
green=`tput setaf 10`
# Reset of color
reset=`tput sgr 0`

echo "${red}red text ${green}green text${reset}"

# splash file : 
cat << "EOF"

                                 .`
                              -dMMs
                             +MMMMMo
                           .dMMMMMMN-
                          +NMMMMMMMMd`
                        `hMMMMMMMMMMMo
                       -mMMMMMMMMMMMMN.
                       dMMMMMMMMMMMMMMo
  :hmmmmmmmmmmmmdhs/. `MMMMMMMMMMMMMMMh
  sMMMMMMMMMMMMMMMMMMd+NMMMMMMMMMMMMMM+
   /NMMMMMMMMMMMMMMMMMMMMMMMMs+NMMMMMm/+syyyso/-`
    `hMMMMMMMMMMMMMMMMMMMMMMo  hMMMMMMMMMMMMMMMMMNhs+:.
      /NMMMMMMMMMMMNmmNMMMMN. `mMMMMMMMMMMMMMMMMMMMMMMMNh-
       .hMMMMMMMMMMh` `-sNMMs-hMMMMMMMMMMMMMMMMMMMMMMMMMM+
         /mMMMMMMMMMNy+-./MMMMMMy:....oMMMMMMMMMMMMMMMNo.
           :ymMMMMMMMMMMMMMMMMMNy//oymMMMMMMMMMMMMMNy:
              .yMMMMMMMms:oMMNhNMMMMMMMMMMMMMMMMNh/`
            .yMMMMMMMN/  .dMMy `sMMMMMMMMMMMNmy/`
           /NMMMMMMMM:`-sMMMMM:  sMMMMMMs-..`
          -NMMMMMMMMMNNMMMMMMMMs./MMMMMMMh`
          mMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMs
         sMMMMMMMMMMMMMMMMhMMMMMMMMMMMMMMMN
        :MMMMMMMMMMMMMMMN+ hMMMMMMMMMMMMMMN.
       `dMMMMMMMMMMMMNh/`  `hMMMMMMMMMMMMMN.
       /MMMMMMMMmhs+-        /dMMMMMMMMMMMN.
       .hmdys/-                -sNMMMMMMMMN.
                                 `:hNMMMMMN.
                                    `+dMMMN`
                                       ./+-

		TODO List - v1.0

				  cubic (c) 2016

EOF

sleep 2

print_splash() {
	clear
    echo "${yellow}             ___.   .__           __             .___     .__  .__          __   "
    echo "${yellow}   ____  __ _\_ |__ |__| ____   _/  |_  ____   __| _/____ |  | |__| _______/  |_ "
    echo "${yellow} _/ ___\|  |  \ __ \|  |/ ___\  \   __\/  _ \ / __ |/  _ \|  | |  |/  ___/\   __\ "
    echo "${yellow} \  \___|  |  / \_\ \  \  \___   |  | (  <_> ) /_/ (  <_> )  |_|  |\___ \  |  |  "
    echo "${yellow}  \___  >____/|___  /__|\___  >  |__|  \____/\____ |\____/|____/__/____  > |__|  "
    echo "${yellow}      \/          \/        \/                    \/                   \/        "
    echo "${yellow}" 
	echo "${yellow}"
	date
	echo ""
	sleep 1
}                                                                                

print_menu() {
    echo  "${reset}~~~~~~~~~~~~~~~~~~~~~"    
    echo  "${reset} M A I N - M E N U"
    echo  "~~~~~~~~~~~~~~~~~~~~~"
    echo  " n) New todo item"
    echo  " l) All todo items"
    echo  " i) Show todo item ID"
    echo  " u) Edit todo item ID"
    echo  " j) Show todo item in JSON" 
	echo  " p) All todo items in JSON"
	echo  " o) API to update task ID"
	echo  " .) Screensaver in bash"
    echo  " h) Help page"
    echo  " q) Exit" 
}

read_choice(){
    local choice
    read -p "Enter choice [ n, l, i, u, j, p, h, q ] " choice
    case $choice in
        n) lynxnewurl ;;
        l) lynxtodourl ;;
        i) indexurl ;;
        u) editurl ;;
        j) jsonurl ;;
		p) lynxtodojsonurl ;;
		o) lynxapiupdate ;;
		.) screensaver ;;
        h) lynxhelpurl ;;
        q) echo "     Bye !" && exit 0 ;;
        *) echo -e "${RED}Error...${STD}" && sleep 2
    esac
}

pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

screensaver(){
	clear
	counter=1
	while [ $counter -le 100 ]
	do
			echo "$(tput setaf $counter)text"
			sleep .5
			echo "Generated by command : echo \"\$(tput setaf $counter)text\""
			sleep .5
			counter=$[counter+1]
	done
}

lynxtodourl(){
	clear
	lynx -dump "http://5.135.158.225:8080/todo"
	echo ""
	pause
}


#lynxtodojsonurl() {
#	clear
#	increase=1
#	if [ increase=[0-9999] ]; then
#		curl -s -X GET http://5.135.158.225:8080/json"$increase"
#		echo ""
#		increase=$increase+1
#	else
#		echo "No more json objects."	
#	fi
#}

lynxtodojsonurl(){
	clear
	increase=[1-120]
		if [ increase[0-9]{3} ]; then
	        curl -s -X GET http://5.135.158.225:8080/json"$increase" && echo -e ""
			echo ""
		else 
			echo "No more json objects."
			exit 0
		fi
	pause
}



lynxapiupdate(){
	clear
	echo "This functionality is not yet implemented !!!"
	echo ""
	echo "Example how to use API calls to update DB : "
	echo ""
	echo "# POST http://5.135.158.225:8080/edit/18?task=Test+various+editors+for+and+check+the+syntax+highlighting&status=open&save=save"
	echo ""
	echo "Exaple of listing task ID:"
	echo "# GET http://5.135.158.225:8080/item15"
	pause
}



lynxhelpurl(){
    clear
    lynx -dump "http://5.135.158.225:8080/help"
	echo ""
    pause
}

lynxnewurl(){
    clear
    lynx "http://5.135.158.225:8080/new"
}


while true 
do 
	print_splash
	print_menu	
	read_choice
done

# Versioning:
# 12-28-2016 - Initial version to connect to servers

##   NEXT IMPLEMENTATION Parking lot :
# 
#	- API CALL to EDIT : http://5.135.158.225:8080/edit/18?task=Test+various+editors+for+and+check+the+syntax+highlighting&status=open&save=save
# 	- add missing items with ID
# 	- try to use lynx in non interactive mode. only display page
#   - Mysql connect menu item
#   - SECURITY:Create separate user for todoapp in mysql. Root is used now!
#   - Add funny pictures to 403/404 error pages
                                                                                                        79,1          Bot

