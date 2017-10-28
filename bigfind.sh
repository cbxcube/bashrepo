#!/bin/bash
#
# cubic (c) 2017
# Looks for top 10 biggest files in provided destination - argument $1 on CLI
#
# Exit codes : 
E_WRONG_ARGS=85		# if more than 1 command line argument is provided
E_BADVALUE_ARGS=86 	# check if argument is letter, if not exit
E_OK=0				# 0 return indicates success


## Test whether the script has been invoked with the correct number of parameters
#Number_of_expected_args=1
#script_parameters="-a -h -m -z"
##                  -a = all, -h = help, etc.
#if [ $# -ne $Number_of_expected_args ]
#then
#  echo "Usage: `basename $0` $script_parameters"
#  # `basename $0` is the script's filename.
#  exit $E_WRONG_ARGS
#fi


# Get parameter from command line, if none argument provided use current dir.
if [ -n "$1" ]then
	directory=$1
	
echo -e "bigfind.sh has been invoked without any argument. Running for working directory.\n"
	directory=$1
else
	directory=$(pwd)
fi

#echo -e "DEBUG1:\n"
#echo $directory

# Here define function for finding largest files : 
getbigfiles() {
echo -e "Listing 10 biggest files in folder : $directory\n"
ls -la $directory |grep -viE "^d|^total"|sort -nk 5|tail -10
}

# Program run 
getbigfiles

# Program exit 
exit $E_OK      # Doesn't matter. The script will not exit here.
                # Try an echo $? after script termination.
                # You'll get a 0, not a 85.
