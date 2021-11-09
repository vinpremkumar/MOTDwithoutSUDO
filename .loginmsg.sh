#!/bin/bash

/usr/bin/clear

## Welcome Message ##
# ASCII color
blue='\033[0;34m'
purple='\033[0;35m'
nocolor='\033[0m'

# Centering
banner_width=36
COLUMNS=$(tput cols)
indent=$(( (COLUMNS - banner_width) / 2 ))
prefix=''
for ((i=1; i<=indent; i++)) ; do
    prefix+=' '
done

echo -e " "
echo -e "${blue}"
echo -e "${prefix}█████╗█████╗█████╗█████╗█████╗█████╗"
echo -e "${prefix}╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝"
echo -e "${prefix}██╗                              ██╗"
echo -e "${prefix}██║                              ██║"
echo -e "${prefix}╚═╝                              ╚═╝"
echo -e "${prefix}██╗   ██╗███╗   ██╗ ██████╗      ██╗"
echo -e "${prefix}██║   ██║████╗  ██║██╔════╝      ██║"
echo -e "${prefix}╚═╝   ██║██╔██╗ ██║██║           ╚═╝"
echo -e "${prefix}██╗   ██║██║╚██╗██║██║           ██╗"
echo -e "${prefix}██║   ██║██║ ╚████║╚██████╗██╗   ██║"
echo -e "${prefix}╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝╚═╝   ╚═╝"
echo -e "${prefix}██╗                              ██╗"
echo -e "${prefix}██║                              ██║"
echo -e "${prefix}╚═╝                              ╚═╝"
echo -e "${prefix}█████╗█████╗█████╗█████╗█████╗█████╗"
echo -e "${prefix}╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝"
echo -e "${nocolor} "


###################################################
## Login details ##
###################################################
declare -i row
row=2   $Initializing

# Checking if the row contains IP loging or :/pts login detail
# If it the later, discard and move to next row
userID=$(whoami | awk '{print substr($1,1,8)}')

while true; do
    LoginDetail=$(last | grep $userID | awk -v var="$row" 'FNR == var {print}' | awk '{print "Last login from " $3 " on " $4"-" $5"-" $6 " at " $7}' | awk '{print substr($4,1,1)}')

    if [ "$LoginDetail" = ":" ]
    then
        row+=1
    else
        break
    fi
done

echo -e "Greetings ${purple}$(whoami)${nocolor}!"
last | grep $userID | awk -v var=$row 'FNR == var {print}' | awk '{print "Your last login was from " $3 " on " $4"-" $5"-" $6 " at " $7}'
echo " "
######################################################

