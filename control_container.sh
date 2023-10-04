#!/bin/bash

echo "## control Beharbor-Server Container"

echo "Write a your class name..."
read class
echo "start / stop / rm"
read type

while read line || [ -n "$line" ] ; do
    echo "$type $class$line 's Ubuntu Container"
    docker $type $class$line
done < id