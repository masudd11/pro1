#!/bin/bash
function rootusrchk(){
	if [[ $UID != 0 ]]
	then
	    echo "please enter with root"
	    echo "u can use su command for root longin"
	    exit
	fi  	
}

function main(){
	rootusrchk
	cd /
	echo "here u find file/directory"
	echo "enter ur option"
	echo "1. search file/directory"
	echo "2. exit"
	read -p "enter "  opt

	if [[ ${opt} -eq 1 ]]
	then
	    read -p "enter the file name/directory " filename 
	    find . -name ${filename} > outfile.txt 2>/dev/null
	    if test -s outfile.txt
	    then
		echo "your file/directory in:"

	        cat outfile.txt
	    else
		echo "no match found, file/directory dosn't exits"
	    fi
	    main
	fi
	if [[ ${opt} -eq 2 ]]
	then
	    exit
	else
	    echo "please select right option"
	    main
	fi
}
main
