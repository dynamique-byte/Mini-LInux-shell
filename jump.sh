# !/bin/bash 
function jump(){  
	OLDIFS=$IFS 
	IFS=/ 
	path_arr=($PWD) 
	IFS=$OLDIFS 
	local pos=-1  
	for dir in "${path_arr[@]}"
	do 
		pos=$[$pos+1] 
		if [ "$1" = "$dir" ];then 
			dir_in_path=${#path_arr[@]} 
			cwd=$PWD 
			limit=$[$dir_in_path-$pos-1] 
			for ((i=0; i<limit; i++)) 
			do
				cwd=$cwd/.. 
			done
			cd $cwd 
			break
		fi
	done
} 

