#!/bin/bash

shopt -s extglob
read -p "Enter user 1st name : " first
read -p "Enter user last name : " last

patfn='^[[:upper:]]{1}[[:lower:]]{2,}$'

if [[ $first =~ $patfn ]]
then
	echo "Valid user 1st name input."
else
	echo "Invalid user 1st name. Please retry."
fi

if [[ $last =~ $patfn ]]
then
	echo "Valid user last name input."
else
	echo "Invalid user last name. Please retry."
fi
