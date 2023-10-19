#!/bin/bash
declare password=""

# Initialize parameters specified from command line
while getopts ":p:" arg; do
	case "${arg}" in
		p)
			password=${OPTARG