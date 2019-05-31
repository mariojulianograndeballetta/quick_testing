### NOTES ###
### may 31, 2019 ###
### rhode island, usa ###
### mjgb ###
### sample script for individual mac address lookup ###
### using header based authentication method to api ###
### using curl -x GET method for URI ###
### using json for output results ###
### must be run with root privileges ###
### see read me file ###
### END NOTES ###

### interpreter ###
!#/bin/bash

### script error logging ###
function logging {
touch /tmp/maclookup.log
chmod 775 /tmp/cleanup.log
exec 2> /tmp/cleanup.log
}

### first commands ###
function first {
echo "CREATING DUMP FILE"
touch /tmp/maclookup.json
chmod 755 /tmp/maclookup.json
declare -rx DUMP=/tmp/maclookup.json
}

### second commands ###
function second {
echo "PLEASE ENTER A VALID MAC ADDRESS!"
echo
read -n 30 ADDRESS
export ADDRESS
declare -rx ADDRESS=MAC
export MAC
}

### third commands ###
function third {
echo "QUERYING ONLINE DATABASE"
curl -X GET https://api.macaddress.io/v1?apiKey=at_MCz6UFERCCn8xFuT8SQUBtD9K2A4m&output=json&search=$MAC >> $DUMP
}

### display ###
function display {
if [ egrep -l 'Invalid MAC or OUI address was received.' $DUMP ] ; then
   echo "PLEASE RELAUNCH SCRIPT AND ENTER VALID/CORRECT ADDRESS\n"
else [ cat $DUMP | egrep -l 'Company name:*' ]
fi
}

### functions ###
logging
first
second
third
display
end

### end ###
exit 0
