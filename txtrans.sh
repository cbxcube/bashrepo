#!/bin/bash
# 
# cubic (c) 2016 
# 
# script will change case in input file to 
#  a) output file
#  b) stdout
# 
# input file can be passed as 
#  a) argument on start
#  b) interactively - if started without argument input file will be provided interactively
#
# Versioning :
# 0.1	- 18th November 2016 - initial script structure, defining basic conditionsi
# 0.2 
#  

# validating 1st argument
# -n $2 veriffy if argument was provided and if was if not asked for help
#-z string - True if string is empty.
#-n string - True if string is not empty.

# check how many arguments were passed 
# $# variable will tell you the number of input arguments the script was passed.

# print input argument
arg0=$0
arg1=$1
arg2=$2
arg3=$3
arg4=$4

echo "debug: echo args"
echo $0
echo $1
echo $2
echo $3
echo $4



#if [ $# -eq 0 ]
#  then
#    echo "No arguments supplied"
#fi


# check if working as superuser
if [[ $(id -u) = "0" ]]
then
  echo "You are superuser!"
fi

# check if first argument provided 
if [[ -n $arg1 ]]
then
  
  echo "Argument #1 detected..."
  if [[ $arg1 -eq "--help" ]] || [[ $arg1 -eq "-h" ]]
  then 
     echo "Run with arguments..."
     echo "Usage: txtrans.sh <input file> <output file>"
     echo "Example: txtrans.sh /tmp/file01.txt /tmp/file01.out"
     exit 2
  else 
	 echo "Input file : $arg1 "
  fi

#else [[ -z $arg1 ]]
else 
  echo "INFO: No argument provided for <input file>. Continue..."
#     value="1" 	# define here default value if not provided but 
# 					# required anyway to continue the run
#					# can be used for interactive read of input file 
  echo -n "Enter Input File Name : "
  read inputFile
fi



# validating 2nd argument, exiting if more arguments
if [[ -n $arg2 ]]
then

  echo "Argument #2 detected..."
  echo "Output file : $arg2"
else [[ -z $arg2 ]]
    echo "INFO: No argument provided for <output file>. Continue..."
    echo -n "Enter Output File Name : "
    read outputFile
fi

# validate if not too many arguments 
if [[ -n $arg3 ]]
then

     echo "ERR: Too many arguments. Exiting"
     echo "INFO: Use "txtrans.sh --help" or "txtrans.sh -h" for more details."
     exit 2
fi

## DEBUG1:
echo  "START of DEBUG1:"
echo  $arg0
echo  $arg1
echo  $arg2
echo  $arg3
echo  $inputFile
echo  $outputFile
echo  "END of DEBUG1:"

# VALIDATION II:
# Validate if ifile and ofile exists 
#if [ ! -f $arg1 ] || [ ! -f $inputFile ]; then
echo "DEBUG 2"
echo "-------"
echo "$arg1"
echo "$inputFile"
echo "$arg2"
echo "$outputFile"


# new validation for file 
if [[ -f $arg1 ]]
then 
	echo "Input file $arg1 exists"
elif [[ -f $inputFile ]]
then
	echo "Input file $inputFile exists"
else
    echo "Input file does not exist. Exiting ..."
	exit 2
fi

if [[ -f $arg2 ]]
then 
	echo "Output file $arg2 exists"
elif [[ -f $outputFile ]]
then
	echo "Output file $outputFile exists"
else
    echo "Output file does not exist. Using default output : /tmp/tr.out ..."
	touch /tmp/tr.out
	outputFile="/tmp/tr.out"

	# tyring to export variable
#	export $outputFile		
	#if [[ -n $arg2 ]] 
	#then
	#  touch $arg2
    #elif [[ -n $outputFile ]]
    #then
	#  touch $outputFile
    #fi
fi


# old validation for file
#if [[ -f $arg1 ]] || [[ -f $inputFile ]]; then
## check return code of evaluation:
#  #echo $?
#  echo "Debug : get RC of validating ifile"
#  echo "0 = success. "
#  echo "nonzero  = command failed to execute."
#  echo "Debug - end"
#
## another if required here to print $arg1 or $inputFile
## for now $inputFile is printed 
#  echo "Input File Name $inputFile does not exists."
#  exit 1
#fi


# TR FUNCTIONS :  
# convert uppercase to lowercase using tr command
# TR syntax : tr '[A-Z]' '[a-z]' < $fileName
trulrun() {

  #ifile="$arg1"
  #ofile="$arg2"
  ifile="$inputFile"
  ofile="$outputFile"
  
trulcmd="$(tr '[A-Z]' '[a-z]' < $ifile > $ofile) "
  $trulcmd
  #$($trulcmd $ifile $ofile); echo "" > $ofile
  #$($trulcmd > $ofile) #echo "" > $ofile

}

# convert lowercase to uppercase using tr command
trlurun() {

  #ifile="$arg1"
  #ofile="$arg2"
  ifile="$inputFile"
  ofile="$outputFile"
  trlucmd="$(tr '[a-z]' '[A-Z]' < $ifile >> $ofile) "# Append here
  $trlucmd
#  catoutfile="$(cat $ofile)"
#  $catoutfile
  echo "$ofile"
  $(cat "$ofile")
  #$($trlucmd $ifile $ofile); echo "" >> $ofile
  #$($trlucmd >> $ofile)

}


# EXECUTE TR FUNCTION  
echo ""
echo "TR lower to upper running ..."
echo "$trulrun"
$trulrun
echo "TR lower to upper completed."
echo ""
echo "TR upper to lower running ..."
echo "$trlurun"
$trlurun
echo "TR upper to lower completed."
$(cat "$ofile")
$(cat "/tmp/tr.out")
exit 0
