#!/bin/bash
declare password=""

# Initialize parameters specified from command line
while getopts ":p:" arg; do
	case "${arg}" in
		p)
			password=${OPTARG}
			;;
		esac
done
shift $((OPTIND-1))

if [[ -z "$password" ]]; then
	while : ; do
		echo -n "Enter a password for the Machine Learning Server admin:"
		read -s password
		echo
		echo -n "Please repeat the password for the Machine Learning Server admin:"
		r