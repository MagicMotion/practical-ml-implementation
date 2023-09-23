#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# -e: immediately exit if any command has a non-zero exit status
# -o: prevents errors in a pipeline from being masked
# IFS new value is less likely to cause confusing bugs when looping arrays or arguments (e.g. $@)

usage() { echo "Usage: $0 -i <subscriptionId> -g <resourceGroupName> -n <deploymentName> -l <resourceGroupLocation> -v <vm-name> -u <admin-username> -p <admin-password>" 1>&2; exit 1; }

declare subscriptionId=""
declare resourceGroupName=""
declare deploymentName="msftmlsvr-`date '+%Y-%m-%d-%H-%M-%S'`"
declare resourceGroupLocation=""
declare vmPrefix=""
declare username="" 
declare password=""

# Initialize parameters specified from command line
while getopts ":i:g:n:l:v:u:p:" arg; do
	case "${arg}" in
		i)
			subscriptionId=${OPTARG}
			;;
		g)
			resourceGroupName=${OPTARG}
			;;
		n)
			deploymentName=${OPTARG}
			;;
		l)
			resourceGroupLocation=${OPTARG}
			;;
		v)
			vmPrefix=${OPTARG}
			;;
		u)
			username=${OPTARG}
			;;
		p)
			password=${OPTARG}
			;;
		esac
done
shift