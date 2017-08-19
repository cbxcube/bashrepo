#!/bin/bash


printf '\n'
echo "Detecting if any Resource is online : "

echo ""
echo " Detected resources online : "

#checkonline=$(hares -state |grep ONLINE)

echo "......."
#echo $checkonline


######## FUNCTIONS 

function checkonline {
	hares -state |grep ONLINE
}

function checkoffline {
	hares -state |grep OFFLINE
}

function onlineresname {
	hares -state |grep ONLINE |awk '{print $1}'
}

function deleteres {
	hares -delete
}

#hares -delete dbIP
#hares -delete webIP
#hares -delete ftpIP
#hares -delete crmIP
#hares -delete iotIP


# show online
printf "ONLINE RESOURCES ======\n"
checkonline
printf "\n"
printf "OFFLINE RESOURCES =====\n"
checkoffline
printf "\n"

printf "RESOURCES TO BRING OFFLINE==\n"
onlineresname
printf "\n"

echo " stopping online resources"

if [ -n onlineresname ]; then 
	echo $onlineresname
else
	hares -offline	onlineresname  -sys gemini2
elseif
	hares -offline  onlineresname  -sys gemini1
fi

	#for i in onlineresname;
	#	print $i
	#fi

printf "\n"
echo " * * *     D E S T R O Y E D !       ****"
echo "------------------------------------------"
#hares -state

printf '\n'
echo "bye! (cbx)"

