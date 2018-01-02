#!/bin/bash
filename='sql.txt'
echo Start
while read p ; do 
    #$p=$p+"$"
    #echo "${p: 0}"
    phrase1=`echo $p | grep -Po "^..."` 
    phrase2=`echo $p | grep -Po "^....."` 
    #echo $phrase
     if [ "$phrase1" == "ADD" ]
     then
         q=$p
     fi
     if [ "$phrase2" == "ALTER" ]
     then
         s=$p
     fi
       result="$s $q"
       echo $result
done < $filename
