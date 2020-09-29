#Created By: Leonardo Fernandes
#Email: odranoelsf@gmail.com
#Version: v1.2
#!/bin/bash
NUM=0
TotalUsers=$(cat ~/usuarios.txt | wc -l)

while [ $NUM -le $TotalUsers ]; do
userws=$(awk NR==$NUM+1 ~/usuarios.txt)

echo -e \
'{ \n 
  \n 
"Workspaces" : [ \n 
\n 
    { \n 
        "DirectoryId" : "d-9067795b33", \n 
	"UserName" : ''"'${userws}'"'', \n 
        "BundleId" : "wsb-3fnpwlcdv", \n 
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
