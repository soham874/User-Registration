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
patemail='^[a-z0-9]+([._+-][a-z0-9]+)*(@)[a-zA-Z]+[.]{1}[a-z]{2,3}([.][a-z]{2})*$'
patphone='^[0-9]{2} [0-9]{10}$'

patpassword='^.{8,}$'

echo "First name check:"
check $first $patfn
echo "Last name check:"
check $last $patfn
echo "Email ID check:"
check $email $patfn
echo "Phone number check:"
check $phone $patphone
echo "Password check for minimum 8 charecters length:"
check $password $patpassword
