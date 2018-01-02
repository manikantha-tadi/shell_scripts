#!/bin/bash
inputfile=$1
outputfile=$2
result=""
echo Start
while read p ; do 
    delim=`echo "${p: -1}"`
    begin=`echo "${p:0:2}"`
     if [[ "$delim" != ";"  &&  "$begin" != "--" ]]
     then
         result+="$p"
         result+=" "
     elif [ "$delim" == ";" ]
     then
        result+="$p"
        echo $result >> $outputfile
        result=" "
     else
       continue
     fi
done < $inputfile
