#!/bin/bash
# Get the git status to commit/push the file to repository.
gitstatus=`echo git status`
result=`eval $gitstatus`
commit_changes=`echo $result| grep -c "Changes to be committed:"`

if [ "$commit_changes" == 1 ]; then
    gitcommit=`echo git commit -m \"commit the local changes\"`
    eval $gitcommit
    gitpush=`echo git push origin master`
    eval $gitpush
fi

