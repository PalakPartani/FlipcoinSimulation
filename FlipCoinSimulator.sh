#!/bin/bash 
echo "Welcome to flipcoin simulation "

coinFlip()
{
		if(( $((RANDOM%2))==1)) #for single time
		then
			echo "Head"
		else
			echo "Tail"
		fi
}
coinFlip
