#!/bin/bash 
echo "Welcome to flipcoin simulation "
declare -A coinDict
result=""
readonly HEAD="H"
readonly TAIL="T"

coinFlip() {
		#Looping for no of times
		for((i=1;i<=$num;i++))
		do
			result=""
			for((j=1;j<=$coin;j++)) 		
			do
				if (($((RANDOM%2))==1)) 
				then			
					result=$result$HEAD	
				else
					result=$result$TAIL
				fi			
			done
			coinDict[$result]=$((${coinDict[$result]}+1))
		done
	echo ${!coinDict[@]}
	echo ${coinDict[@]}
	calculatePercent
}
	
calculatePercent() {
			for i in ${!coinDict[@]}
			do
				value=${coinDict[$i]}
				coinDict[$i]=$( echo "scale=2; $value * 100 / $num" | bc )
			done
			echo "key are :    " ${!coinDict[@]}
			echo "Percentage are : " ${coinDict[@]}	

}
read -p "Enter how many times you want to flip a coin : " num
read -p "Enter the number of coin " coin
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
