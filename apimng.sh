#!/bin/bash
# JSON Placeholder data :
# TUTORIAL : https://jsonplaceholder.typicode.com/


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
allposts=$urlroot/posts								## alternative in testing as a function : 
getpost=$urlroot/posts/$id
getpcom=$urlroot/posts/$id/comments
getpcid=$urlroot/comments?postId=$id
getuser=$urlroot/posts?userId=$id
allcomments=$urlroot/comments
allalbums=$urlroot/albums
allphotos=$urlroot/photos
alltodos=$urlroot/todos
allusers=$urlroot/users
# POST 
sendpost=$urlroot/posts
# PUT
putpost=$urlroot/posts/$id
# PATCH 
patchpost=$urlroot/posts/$id
# DELETE
delpost=$urlroot/posts/$id



## FUNCTIONS :

pause(){
  read -p "To continue press [Enter] button ..." fackEnterKey
}


## REST CALL FUNCTIONS : 

apiget() {
	curl -s -X GET $geturlpath
}


apipost() {
	curl -s -X POST $geturlpath
}


apiput() {
	curl -s -X PUT $geturlpath
}


apipatch() {
	curl -s -X PATCH $geturlpath
}


apidelete() {
	curl -s -X DELETE $geturlpath
}

####
### STANDARD DELIMITER FOR OUTPUTS :
## delimiter="$(tput setab 1)[ ] [ ] [ ] [ [ ] [ ] [ ] [ ] [ ]] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 0)"
## echo "$(tput setab 1)[ ] [ ] [ ] [ [ ] [ ] [ ] [ ] [ ]] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 0)"

# GET ALLs :
getallposts() {
	splashscr
	echo ""
    geturlpath=$allposts
    echo "       Fetching from URL : `tput setaf 1`$geturlpath"
	echo ""
	#echo "$(tput setab 7)[ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ][ ] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]"$(tput sgr 0)"
	#echo "`tput setab 7`)[ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ][ ] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]`tput sgr 0`"
	echo "$(tput setab 1)[ ] [ ] [ ] [ [ ] [ ] [ ] [ ] [ ]] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 0)"
	echo ""
	apiget
	echo ""
    #echo "$(tput setab 7)[ ] [ ] [ ] [ [ ] [ ] [ ] [ ] [ ]] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 0)"
	#echo "$(tput setab 7)[ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ][ ] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]"$(tput sgr 0)"
	echo "$(tput setab 1)[ ] [ ] [ ] [ [ ] [ ] [ ] [ ] [ ]] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 0)"
	pause
}

getallcomments() {
    splashscr
    echo ""
    geturlpath=$allcomments
    #echo "       Fetching from URL : $(tput setaf 1)$geturlpath"
    echo "       Fetching from URL : `tput setaf 1`$geturlpath"
    echo ""
    #echo "$(tput setab 6)[ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ][ ] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 1)"
    #echo "$(tput setab 1)[ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ][ ] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 0)"
	echo "$(tput setab 1)[ ] [ ] [ ] [ [ ] [ ] [ ] [ ] [ ]] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 0)"
    echo ""
    apiget
    echo ""
    #echo "$(tput setab 6)[ ] [ ] [ ] [ [ ] [ ] [ ] [ ] [ ]] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 1)"
    #echo "$(tput setab 6)[ ] [ ] [ ] [ [ ] [ ] [ ] [ ] [ ]] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 0)"
	echo "$(tput setab 1)[ ] [ ] [ ] [ [ ] [ ] [ ] [ ] [ ]] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 0)"
    pause
}

getallalbums() {
    splashscr
    echo ""
    geturlpath=$allalbums
    echo "       Fetching from URL : $(tput setaf 1)$geturlpath"
    echo ""
    echo "$(tput setab 5)[ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ][ ] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 2)"
    echo ""
    apiget
    echo ""
    echo "$(tput setab 5)[ ] [ ] [ ] [ [ ] [ ] [ ] [ ] [ ]] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 2)"
    pause
}

getallphotos() {
    splashscr
    echo ""
    geturlpath=$allphotos
    echo "       Fetching from URL : $(tput setaf 1)$geturlpath"
    echo ""
    echo "$(tput setab 4)[ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ][ ] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 3)"
    echo ""
    apiget
    echo ""
    echo "$(tput setab 4)[ ] [ ] [ ] [ [ ] [ ] [ ] [ ] [ ]] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 3)"
    pause
}

getalltodos() {
    splashscr
    echo ""
    geturlpath=$alltodos
    echo "       Fetching from URL : $(tput setaf 1)$geturlpath"
    echo ""
    echo "$(tput setab 3)[ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ][ ] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 4)"
    echo ""
    apiget
    echo ""
    echo "$(tput setab 3)[ ] [ ] [ ] [ [ ] [ ] [ ] [ ] [ ]] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 4)"
    pause
}

getallusers() {
    splashscr
    echo ""
    geturlpath=$allusers
    echo "       Fetching from URL : $(tput setaf 1)$geturlpath"
    echo ""
    echo "$(tput setab 2)[ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ][ ] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 3)"
    echo ""
    apiget
    echo ""
    echo "$(tput setab 2)[ ] [ ] [ ] [ [ ] [ ] [ ] [ ] [ ]] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 3)"
    pause
}

tmp1() {
    splashscr
    echo ""
    geturlpath=$allcomments
    echo "       Fetching from URL : $(tput setaf 1)$geturlpath"
    echo ""
    echo "$(tput setab 1)[ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ][ ] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 2)"
    echo ""
    apiget
    echo ""
    echo "$(tput setab 1)[ ] [ ] [ ] [ [ ] [ ] [ ] [ ] [ ]] [ ] [ ] [ ] [ ] [ ] [ ] [c] [b] [x] [ ]$(tput sgr 2)"
    pause
}



#### MENU RUN : 
printmenu() {
    echo  "$(tput setab 0)~~~~~~~~~~~~~~~~~~~~~" #$(tput setab 0)    
	echo  "$(tput setaf 1)  M A I N - M E N U" #$(tput  sgr 0))
    echo  "$(tput setaf 7)~~~~~~~~~~~~~~~~~~~~~" #$(tput sgr 0)
	echo  "   1) Get All Posts"
	echo  "   2) Get All Comments"
	echo  "   3) Get All Albums"
	echo  "   4) Get All Photos"
	echo  "   5) Get ALl Todo Tasks"
	echo  "   6) Get All Users"
	echo  "   7) tmp2"
	echo  "   8) tmp1"
	echo  "   "
	echo  "   $(tput setab 1)q) exit$(tput sgr 0)"	
	echo  ""
	echo "$(tput setaf 9)The quieter you become... $(tput setaf 4)The more you are able to hear!$(tput sgr 0)"
	echo ""
}

readchoice() {
    local choice
    read -p "Enter choice [ 1-9, q ] " choice
    case $choice in
        1) getallposts ;;
		2) getallcomments ;;
		3) getallalbums ;;
		4) getallphotos ;;
		5) getalltodos ;;
		6) getallusers ;;
		7) tmp2 ;;
		8) tmp1 ;;
        q) echo "     Bye !" && exit 0 ;;
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
	
# Versioning:
# 12-30-2016 - Initial version to connect to servers
# 12-30-2016 - Option #1 from menu working well, GET REST call to fetch JSON 

##   NEXT IMPLEMENTATION Parking lot :
# 
# - API calls with specific ID
# - json2table - better parse output 
# - fix background colours in items 3-9 (tmp1-tmp6)

