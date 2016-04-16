#!/bin/bash
if [ -z "$1" ]
  then
    echo "A folder name must be specifed"
	exit
fi

mkdir "roles/$1"
mkdir "roles/$1/defaults"
mkdir "roles/$1/handlers"
mkdir "roles/$1/meta"
mkdir "roles/$1/tasks"
mkdir "roles/$1/templates"
