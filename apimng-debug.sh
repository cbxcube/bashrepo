#!/bin/bash
## SPLASH SCREEN : 
splashscr() {
clear
cat << "EOF"
                  oo                                                      
                                                                          
.d8888b. 88d888b. dP    88d8b.d8b. 88d888b. .d8888b.    88d888b. dP    dP 
88'  `88 88'  `88 88    88'`88'`88 88'  `88 88'  `88    88'  `88 88    88 
88.  .88 88.  .88 88    88  88  88 88    88 88.  .88 dP 88.  .88 88.  .88 
`88888P8 88Y888P' dP    dP  dP  dP dP    dP `8888P88 88 88Y888P' `8888P88 
         88                                      .88    88            .88 
         dP                                  d8888P     dP        d8888P  
EOF
sleep 1
}


## Navigation :
urlroot='https://jsonplaceholder.typicode.com'


# GET
allposts="$urlroot/posts"

echo " print URL results :"
echo "$allcomments"


pause(){
  read -p "To continue press [Enter] button ..." fackEnterKey
}


## REST CALL FUNCTIONS : 
apiget() {
    curl -s -X GET $geturlpath
}

# GET ALLs :
getallposts() {
    splashscr
    echo "combining url and appropriate rest call "
    geturlpath=$allposts
    echo "       Fetching from URL : $(tput setaf 1)$geturlpath"
    echo ""
    echo "$(tput setab 6)[ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ][ ] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 0)"
    echo ""
    #apiget $geturlpath
    apiget
    echo ""
    echo "$(tput setab 6)[ ] [ ] [ ] [ [ ] [ ] [ ] [ ] [ ]] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 0)"
    pause

}

getallcomments() {
    splashscr
    echo ""
    geturlpath=$allcomments
    echo "       Fetching from URL : $(tput setaf 1)$geturlpath"
    echo ""
    echo "$(tput setab 6)[ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ][ ] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 0)"
    echo ""
    #apiget $geturlpath
    apiget
    echo ""
    echo "$(tput setab 6)[ ] [ ] [ ] [ [ ] [ ] [ ] [ ] [ ]] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 0)"
    pause
}




#### MENU RUN : 
printmenu() {
    echo  "~~~~~~~~~~~~~~~~~~~~~"    
	echo  '$(tput setaf 2) M A I N - M E N U'
    echo  "~~~~~~~~~~~~~~~~~~~~~"
    echo  "1) apiallget"
    echo  "2) apiallpost"
    echo  "3) apiallusers"
    echo  "3) apiput"
    echo  "4) apipatch"
    echo  "5) apidelete"
    echo  ""
    echo  "x) exit" 
    echo  ""
}


readchoice() {
    local choice
    read -p "Enter choice [ 1-5, x ] " choice
    case $choice in
        1) getallposts ;;
        2) getallcomments ;;
        3) apiget $allalbums ;;
        4) apiget $allphotos ;;
        5) apiget $alltodos ;;
        6) apiget $allusers ;;
        7) apiget $allusers ;;

        x) echo "     Bye !" && exit 0 ;;
        *) echo -e "${RED}Error...${STD}" && sleep 2
    esac
}



# PROGRAM RUN : 

while true
do
    splashscr
    printmenu
    readchoice
done

