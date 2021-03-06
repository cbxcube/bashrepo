#!/bin/bash


### Colors for output and splash screen : 
#
#red=`tput setaf 1`
#yellow=`tput setab 7`
#green=`tput setaf 2`
#reset=`tput sgr 0`
#
#echo "${red}red text ${green}green text${reset}"
#echo "$(tput setaf 1)Red text $(tput setab 7)and white background$(tput sgr 0)"
#
## splash file : 
#cat << "EOF"
#
#    W E L C O M E . . . 
#	
#EOF
#echo "${reset}    Connecting to the server ..."
#sleep 2
#
#echo "${yellow}Testing defined colors : "
#echo "${red}RED text"
#echo "$(tput setaf 2)Another Color"
#echo "$(tput setaf 3)Another Color"
#echo "$(tput setaf 4)Another Color"
#echo "$(tput setaf 2)Different text $(tput setaf4)and even different background and text color.$(tput sgr0)"
#echo "${yellow}YELLOW text"
#echo "${yellow}YELLOW text"
#echo "${green}GREEN text ${red}RED text"
#echo "${reset}REVERSE RED"
#echo "$(tput setaf 1)Red text $(tput setab 7)and white background$(tput sgr 0)"
##### 



# scan in loop for output color : 

counter=1
while [ $counter -le 1000 ]
	do
		echo "$(tput setaf $counter)text"
		sleep .5
#		echo "Generated by command : echo \"\$(tput setaf $counter)text\""
		echo "Generated by command : echo $tput setaf $counter text"
		sleep .5
		counter=$[counter+1]
done


# some example : 


# Red front text
red=`tput setaf 1`
# Yellow background 
yellow=`tput setaf 11`
# Green front text
green=`tput setaf 10`
# Reset of color
reset=`tput sgr 0`


#!/bin/bash


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

		Checking if user "cubic" exists on system!

				  cubic (c) 2016

EOF

sleep 2


if grep -Fq "cubic" /etc/passwd; then
  echo "User cubic found on system."
else
  echo "User cubic NOT found on system."
fi


# show todo list : 
lynx -dump "http://5.135.158.225:8080/todo"

sleep 5

exit 0
