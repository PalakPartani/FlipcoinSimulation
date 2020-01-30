#!/bin/bash 
echo "Welcome to flipcoin simulation "
declare -A coinDict

#Sorting combinations
sorting() {
		echo "Winning Percent "
		for i in ${!coinDict[@]}
		do
			echo "$i ${coinDict[$i]}"
		done | sort -k2 -rn | head -n 1

}

#checking for no of times
coinFlip() {
		#Looping for no of times
		for((i=1;i<=$num;i++))
		do
			result=""
			for((j=1;j<=$coin;j++)) 		
			do
				if (($((RANDOM%2))==1)) 
				then			
					result=$result"H"	
				else
					result=$result"T"
				fi			
			done
			coinDict[$result]=$((${coinDict[$result]}+1))
		done
	echo ${!coinDict[@]}
	echo ${coinDict[@]}
	calculatePercent
}

#Calculating Percentage			
calculatePercent() {
			for i in ${!coinDict[@]}
			do
				value=${coinDict[$i]}
				coinDict[$i]=$( echo "scale=2; $value * 100 / $num" | bc )
			done
			echo "key are :    " ${!coinDict[@]}
			echo "Percentage are : " ${coinDict[@]}	
			sorting
}

#if -eq used then it wil consider it as integer
value="Y"
while [ "$value" == "Y" -o "$value" == "y" ]
do
	read -p "Enter how many times you want to flip a coin : " num
	read -p "Enter the number of coin " coin
	#Clearing dictionary	
	coinDict=()
	case $coin in
	1)
		echo "This is singlet combination"
		coinFlip
		;;
	
	2)
		echo "This is doublet Combination"
		coinFlip	
		;;
	3)
		echo "This is Triplet Combination"
		coinFlip
		;;
	*)
		echo "Invalid choice!"

	esac
read -p "Press Y to continue " value
done
	
