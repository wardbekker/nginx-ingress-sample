#!/bin/bash
IC_HTTPS_PORT=443
IC_IP=35.202.109.168
K=100000000;    

array[0]="macha"
array[1]="decaf"
array[2]="green"
array[3]="breakfast"

size=${#array[@]}

for (( c=1; c<=$K; c++ ))
do
    index=$(($RANDOM % $size))

    curl --resolve cafe.example.com:$IC_HTTPS_PORT:$IC_IP https://cafe.example.com:$IC_HTTPS_PORT/coffee --insecure   
    sleep $[ ( $RANDOM %  4)  + 1 ]s
    curl --resolve cafe.example.com:$IC_HTTPS_PORT:$IC_IP https://cafe.example.com:$IC_HTTPS_PORT/tea --insecure 
    sleep $[ ( $RANDOM %  2)  + 1 ]s
    curl --resolve cafe.example.com:$IC_HTTPS_PORT:$IC_IP https://cafe.example.com:$IC_HTTPS_PORT/tea?var=${array[$index]} --insecure    
 done
