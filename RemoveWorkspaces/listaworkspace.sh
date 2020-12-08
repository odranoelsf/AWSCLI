#Created By: Leonardo Fernandes
#Email: odranoelsf@gmail.com
#Version: v1.0
#!/bin/bash
NUM=1
TotalOperador=$(cat operadores.txt | wc -l)

echo "Type the DirectoryId that you want to exclude user/workspaces"
read DirectoryId;

while [ $NUM -le $TotalOperador ]; do
operadorws=$(awk NR==$NUM operadores.txt)

aws workspaces describe-workspaces --directory-id $DirectoryId --user-name "$operadorws" | grep WorkspaceId >> computers.txt
#aws workspaces describe-workspaces --directory-id d-90677273bf --user-name "$operadorws" | grep WorkspaceId >> computers2.txt
#aws workspaces describe-workspaces --directory-id d-9067733938 --user-name "$operadorws" | grep WorkspaceId >> computers3.txt

let NUM=NUM+1;
done

NUM1=1
TotalComputer=$(cat computer.txt | wc -l)
#
while [ $NUM1 -le $TotalComputer ]; do
computerws=$(awk NR==$NUM1 computers.txt)

aws workspaces terminate-workspaces --terminate-workspace-requests $computerws >> terminate.log

let NUM1=NUM1+1;

done
