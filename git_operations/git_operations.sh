#!/bin/bash
url=$1
basename=$(basename $url)
echo $reponame

if [ ! -d "$basename" ]; then
    # if local repo doesnt exist, Clone the repo
    gitclone=`echo git clone $url`
    eval $gitclone
else 
    # update the local repo if exists
    cd $basename
    gitpull=`echo git pull`
    eval $gitpull
fi
# get git status to add the untracked files.
gitstatus=`echo git status` 
result=`eval $gitstatus`
untracked_1=`echo $result | cut -d ' ' -f 10-11`
untracked_2=`echo $result | cut -d ' ' -f 24-25`

echo $untracked_1
echo $untracked_2

if [ "$untracked_1" == "Untracked files:" ] || [ "$untracked_2" == "Untracked files:" ]; then
    # do git operations
    gitadd=`echo git add .`
    eval $gitadd
fi

# Get the git status to commit/push the file to repository.
gitstatus=`echo git status`
result=`eval $gitstatus`
commit_changes=`echo $result | cut -d ' ' -f 10-13`

if [ "$commit_changes" == "Changes to be committed:" ]; then
    gitcommit=`echo git commit -m \"commit the local changes\"`
    eval $gitcommit
    gitpush=`echo git push origin master`
    eval $gitpush
fi
