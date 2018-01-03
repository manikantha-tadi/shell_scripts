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

