#!/bin/bash

#전체 컨테이너에 순차적으로 명령을 내리는 shellscript
#수정이 필요한 원시적인 방식 -> 개선 필요
echo "## control Beharbor-Server Container"

echo "Write a your class name..."
read class
echo "Write subex (eg. start, stop, rm)"
read subex

while read line || [ -n "$line" ] ; do
    echo "$subex $class$line 's Ubuntu Container"
    docker $subex "./install_sudo.sh" "$class$line:/root/"
    docker exec -i $class$line /root/install_sudo.sh
done < id