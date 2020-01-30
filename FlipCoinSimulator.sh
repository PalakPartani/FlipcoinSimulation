#!/bin/bash 
echo "Welcome to flipcoin simulation "
declare -A coinDict
result=""
readonly HEAD="H"
readonly TAIL="T"
#checking for no of times
coinFlip()
{
	for((i=1;i<=$num;i++))
		do
			result=""
			for((j=1;j<=$coin;j++))
			do
				if (($((RANDOM%2))==1)) #for multiple times
				then			
					result=$result$HEAD	
				else
					result=$result$TAIL
				fi			
			done
			coinDict[$result]=$((${coinDict[$result]}+1))
		done
		echo "${!coinDict[@]}"
		echo "${coinDict[@]}"
		calculatePercent


}
	
calculatePercent()
{
	for i in ${!coinDict[@]}
	do
		value=${coinDict[$i]}
		coinDict[$i]=$( echo "scale=2; $value * 100 / $num" | bc )
	done
}
read -p "Enter a how many times for flipping a coin : " num
read -p "Enter the number of coin " coin
case $coin in
	1)
		echo "This is singlet"
		coinFlip
		
		echo "Percentage are : " ${coinDict[@]}
		;;
	*)
		echo "Error"
	
esac
