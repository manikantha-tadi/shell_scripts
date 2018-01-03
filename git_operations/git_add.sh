#!/bin/bash

# get git status to add the untracked files.
gitstatus=`echo git status`
result=`eval $gitstatus`
untracked_1=`echo $result| grep -c "Changes not staged for commit"`
untracked_2=`echo $result| grep -c "Untracked files:"`

echo $untracked_1
echo $untracked_2

if [ "$untracked_1" == 1 ] || [ "$untracked_2" >= 2 ]; then
    # do git operations
    gitadd=`echo git add .`
    eval $gitadd
fi

