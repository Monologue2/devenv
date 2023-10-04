#!/bin/bash

echo "## Create Beharbor-Server Container"

echo "Write a admin ID"
read admin
echo "Write a your class name..."
read class

while read line || [ -n "$line" ] ; do
    echo "create $line 's Ubuntu Container"
    docker run -it -d --env USERNAME=$class$line -h=$class --name $class$line -v /home/$admin/2023/$class/$line:/home/$line/workspace --net harbor --net-alias $class$line beharbor/devenv:1.0
    docker exec $class"_"$line "/root/create_user.sh" "$class" "$line"
done < id
