### NOTES ###
### johnston ###
### rhode island ###
### usa 02919 ###
### mjgb ###
### sample test script for individual mac address lookup ###
### using header & key based authentication method to api ###
### using curl -x GET method for URI ###
### using json for output results ###
### must be run with root privileges ###
### see read me file ###
### END NOTES ###

### interpreter ###
#!/bin/bash

### TRACE MODE ###
#set -x

### GREETING ###
function greeting {
echo
echo "### WELCOME TO MAC ADDRESS LOOKUP ###"
}

### script error logging ###
function logging {
echo
echo "### CREATING LOG FILE ###"
rm -f /tmp/maclookup.log
touch /tmp/maclookup.log
chmod 777 /tmp/maclookup.log
declare -rx LOG=/tmp/maclookup.log
exec 2> $LOG
}

### first commands ###
function first {
echo
echo "### CREATING DUMP FILE ###"
rm -f /tmp/maclookup.json
touch /tmp/maclookup.json
chmod 777 /tmp/maclookup.json
declare -rx DUMP=/tmp/maclookup.json
}

### second commands ###
function second {
echo
echo "### PLEASE ENTER A VALID MAC ADDRESS! ###"
echo
read -n 17 ADDRESS
export ADDRESS
echo
}

### third commands ###
function third {
echo
echo "### QUERYING ONLINE DATABASE ###"
echo
curl -v -X GET "https://api.macaddress.io/v1?apiKey=at_MCz6UFERCCn8xFuT8SQUBtD9K2A4m&output=vendor&search=$ADDRESS" >> "/tmp/maclookup.json"
}

### display ###
function display {
if grep -qx "Invalid MAC or OUI address was received." /tmp/maclookup.json ; then
   echo "||| ERROR ||| ### PLEASE RELAUNCH SCRIPT AND ENTER VALID/CORRECT ADDRESS ### ||| ERROR |||"
else
   printf '\n' >> /tmp/maclookup.json
   echo
   cat /tmp/maclookup.json
   echo
fi
}

### functions ###
greeting
logging
first
second
third
display

### end ###
exit 0
