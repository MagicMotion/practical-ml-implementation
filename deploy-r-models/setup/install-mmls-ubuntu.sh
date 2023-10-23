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
		read -s password_confirm
		echo
		if [[ "$password" == "$password_confirm" ]]; then
			break
		else
			echo "The passwords do not match. Please retry."
		fi
	done
fi

# Optionally, if your system does not have the https apt transport option
apt-get install apt-transport-https

# Add the **azure-cli** repo to your apt sources list
AZ_REPO=$(lsb_release -cs)

echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list

# Set the location of the package repo the 