#Created By: Leonardo Fernandes
#Email: odranoelsf@gmail.com
#Version: v1.1
#!/bin/bash
NUM=1
TotalOperador=$(cat operadores.txt | wc -l)

echo "Type the DirectoryId that you want to exclude user/workspaces"
read DirectoryId;

while [ $NUM -le $TotalOperador ]; do
operadorws=$(awk NR==$NUM operadores.txt)

aws workspaces describe-workspaces --directory-id $DirectoryId --user-name "$operadorws" | grep WorkspaceId >> computers.txt

let NUM=NUM+1;
done

sed -i 's/\            "WorkspaceId": //g' computers.txt
sed -i 's/\ //g' computers.txt
sed -i 's/\,//g' computers.txt
sed -i 's/\"//g' computers.txt

NUM1=1
TotalComputer=$(cat computers.txt | wc -l)
#
while [ $NUM1 -le $TotalComputer ]; do
computerws=$(awk NR==$NUM1 computers.txt)

aws workspaces terminate-workspaces --terminate-workspace-requests $computerws >> terminate.log
echo "$operadorws removed"
let NUM1=NUM1+1;

done