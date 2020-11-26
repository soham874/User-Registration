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

read -p "Enter user 1st name : " first
read -p "Enter user last name : " last
read -p "Enter user email ID : " email
read -p "Enter phone number : " phone
read -p "Enter user password : " password

patfn='^[[:upper:]]{1}[[:lower:]]{2,}$'
patemail='^[a-z0-9]+([._+-][a-z0-9]+)*(@)[0-9a-zA-Z]+[.]{1}[a-z]{2,3}([.][a-z]{2})?$'
patphone='^[0-9]{2} [0-9]{10}$'

patpassword='^(?=.*[A-Z]{1,})(?=.*[0-9]{1}).{8,}$'	#will check for minimum 1 Uppercase, minimum 1 digit and minimum length 8
patspeccheck1='^.*[\W].*$'				#will return true if at least 1 special charecter exists
patspeccheck2='^(.*?[\W].*?){2,}$'			#will return true if at least 2 special charecters exist

echo "First name check:"
check $first $patfn
echo "Last name check:"
check $last $patfn
echo "Email ID check:"
check $email $patfn
echo "Phone number check:"
check $phone $patphone
echo "Password check for minimum 8 charecters length, at least 1 UpperCase charecter, at least 1 numeric charecter, and exactly 1 special charecter :"

if [[ $password =~ $patpassword ]]	#verifying first that length, uppercase and numerical conditions are satisfied
then
	if [[ $password =~ $patspeccheck2 ]]				#if this case is successful it means there are 2 or more special charecters
	then
		echo "Password is invalid. Please try again"
	elif [[ $password =~ $patspeccheck1 ]]			#if case 1 is false and this is true, it means there is exactly 1 special char.
	then
		echo "Password is valid."
	else						#if both cases fail it means that there are no special charecter
    		echo "Password is invalid. Please try again"
	fi
else
	echo "Password is invalid. Please try again"
fi
