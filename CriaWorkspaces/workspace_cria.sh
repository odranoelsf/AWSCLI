#Created By: Leonardo Fernandes
#Email: odranoelsf@gmail.com
#Version: v1.3
#!/bin/bash
NUM=0

echo "Digite o DirectoryId"
read directory;
echo "Digite o BundleID"
read bundleid;

TotalUsers=$(cat ~/usuarios.txt | wc -l)

while [ $NUM -le $TotalUsers ]; do
userws=$(awk NR==$NUM+1 ~/usuarios.txt)

echo -e \
'{ \n 
  \n 
"Workspaces" : [ \n 
\n 
    { \n 
        "DirectoryId" : ''"'${directory}'"'', \n 
	      "UserName" : ''"'${userws}'"'', \n 
        "BundleId" : ''"'${bundleid}"'', \n 
        "WorkspaceProperties": { \n 
          "RunningMode": "ALWAYS_ON", \n 
          "RootVolumeSizeGib": 80, \n 
          "UserVolumeSizeGib": 10 \n 
        } \n 
    } \n 
] \n 
}' > workspace.json


aws workspaces create-workspaces --cli-input-json file://"~/workspace.json" >> log.txt

let NUM=NUM+1;
done
