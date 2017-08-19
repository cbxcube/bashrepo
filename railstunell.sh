#!/bin/bash

#runtun=$(ssh -L 3000:localhost:3000 kimsufi &)
runtun=$(ssh -f -N -L  3000:localhost:3000 kimsufi &)
chkpgrp=$(pgrep -f "3000:localhost:3000 kimsufi")



# check if not already started
if [[ $chkpgrp == 1 ]]; then
   printf "%s\n" "Rails Server SSH Tunel Already Opened. Exiting!"; exit 0
else
   printf "%s\n" "Starting SSH Tunnel for Rails - Kimsufi ..."; $runtun; sleep 3
fi

# grep string from ps
printf "%s\n" "$chkpgrp"

exit 0
