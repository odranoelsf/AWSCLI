#Created By: Leonardo Fernandes
#Email: odranoelsf@gmail.com
#Version: v1.4
#!/bin/bash
NUM=1

echo "Type the DirectoryId"
read directory;
echo "Type the BundleID"
read bundleid;

echo "This script creates one user per time, please check the log.txt file to check if any error occurred"

TotalUsers=$(cat usuarios.txt | wc -l)

while [ $NUM -le $TotalUsers ]; do
userws=$(awk NR==$NUM usuarios.txt)

echo -e \
'{ \n
  \n
"Workspaces" : [ \n
\n
    { \n
        "DirectoryId" : ''"'${directory}'"'', \n
              "UserName" : ''"'${userws}'"'', \n
        "BundleId" : ''"'${bundleid}'"'', \n
        "WorkspaceProperties": { \n
          "RunningMode": "ALWAYS_ON", \n
          "RootVolumeSizeGib": 80, \n
          "UserVolumeSizeGib": 10 \n
        } \n
    } \n
] \n
}' > workspace.json


aws workspaces create-workspaces --cli-input-json file://"workspace.json" >> log.txt

echo "$NUMº user created"

let NUM=NUM+1;
done