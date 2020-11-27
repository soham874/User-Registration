#!/bin/bash

shopt -s extglob

function check(){
	if [[ $1 =~ $2 ]]
	then
   		echo "Entry is valid."
	else
   		echo "Entry is invalid."
	fi
}

#~~~~~~~~~~~~~first name check~~~~~~~~~~~~

read -p "Enter user 1st name : " first

patname='^[[:upper:]]{1}[[:lower:]]{2,}$'
echo "##First name check:##"
check $first $patname

#~~~~~~~~~~~~~last name check~~~~~~~~~~~~

read -p "Enter user last name : " last

echo "##Last name check:##"
check $last $patname

#~~~~~~~~~~~~~Email ID check~~~~~~~~~~~~~

read -p "Enter user email ID : " email

patemail='^[a-z0-9]+([._+-][a-z0-9]+)*(@)[0-9a-zA-Z]+[.]{1}[a-z]{2,3}'
patemailf1='([.][a-z]{2})'
patemailf2='$'

echo "##Email ID check:##"
if [[ $email =~ $patemail$patemailf1$patemailf2 || $email =~ $patemail$patemailf2 ]]
then
    echo "Entry is valid."
else
    echo "Entry is invalid."
fi

#~~~~~~~~~~~~~Phone number check~~~~~~~~~~~~~

read -p "Enter phone number : " phone
patphone='^[[:digit:]]{2}([ ])[[:digit:]]{10}$'

echo "##Phone number check:##"
check $phone $patphone

#~~~~~~~~~~~~~Password check~~~~~~~~~~~~~~~~~

read -p "Enter user password : " password
pattern='^([^.,:;!@#$%^&*_+=]*)[.,:;!@#$%^&*_+=]([^.,:;!@#$%^&*_+=]*)$'

echo "##Password check for minimum 8 charecters length, at least 1 UpperCase charecter, at least 1 numeric charecter, and exactly 1 special charecter :##"
if [[ ${#password} -ge 8 && "$password" == *[[:upper:]]* && "$password" == *[[:lower:]]* && "$password" == *[[:digit:]]* && "$password" =~ $pattern ]]
then
	echo "Entry is valid."
else
	echo "Entry is invalid."
fi