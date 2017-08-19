#!/bin/sh
# installation script wrapper

# ------------------------------
# rminst() - exit trap function
rminst()
{
        cd $ODIR
        rm -fr $DDIR
} # rminst()

# define exit trap
trap rminst 0

ODIR=$(pwd)
DDIR=/var/tmp/INST_$$

# mode - DRY/INST
MODE=$1
EXEC=false
URL=$2

# script
SCR=${URL##*/}
ret=0

shift 2

# ----------------------------
# disp()
disp()
{
     echo "== Wrapper: $* =="
} # disp()

# -----------------------------
# run()
run()
{
    typeset cmd=$1 msg=$2 ret=0
    
    echo "-------------------------------------------------------"
    disp "Message: $msg" 
    disp "Command: $cmd"
    $EXEC && { eval "$cmd"; ret=$?; }
    echo "-------------------------------------------------------"
    
    return $ret
} # run()

disp "Begin"

case $MODE in 
	DRY) disp "DRY run"; EXEC=false ;;
	INST) disp "REAL run"; EXEC=true ;;
	*) disp "UNKNOWN mode"; exit 1 ;;
esac	

{ mkdir -p $DDIR && cd $DDIR; } || {
    disp "Failed to create $DDIR"
    exit 1
}

disp "Download $URL"
wget -q $URL

run "sh ./$SCR $*" "Execution mode: $MODE"
ret=$?

disp "End"
exit $ret

