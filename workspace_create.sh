#/bin/bash
NUM=0

if $NUM < 3{
userws=$(awk NR==1+$NUM ~/teste.txt)

echo -e \
"{ \n \
  \n \
"Workspaces" : [ \n \
\n \
    { \n \
        "DirectoryId" : "d-9067795b33", \n \
        "UserName" : "$userws", \n \
        "BundleId" : "wsb-3fnpwlcdv", \n \
        "WorkspaceProperties": { \n \
          "RunningMode": "ALWAYS_ON", \n \
          "RootVolumeSizeGib": 80, \n \
          "UserVolumeSizeGib": 10 \n \
        } \n \
    } \n \
] \n \
}"\n \ >> workspace.json


aws workspaces create-workspaces --cli-input-json file://"~/workspace.json"

$NUM=$NUM+1
}
else{
    exit
}