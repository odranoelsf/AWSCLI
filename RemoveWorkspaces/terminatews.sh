#Created By: Leonardo Fernandes
#Email: odranoelsf@gmail.com
#Version: v1.0
#!/bin/bash
NUM=0
TotalComputer=$(cat ~/consolidado.txt | wc -l)
#
while [ $NUM -le $TotalComputer ]; do
computerws=$(awk NR==$NUM+1 ~/consolidado.txt)

aws workspaces terminate-workspaces --terminate-workspace-requests $computerws >> terminate.log

let NUM=NUM+1;

done

#aws workspaces describe-workspaces --bundle-id wsb-cwdqsfjwm | grep WorkspaceId | awk {'print $2'} | tr -d \" | tr -d \,