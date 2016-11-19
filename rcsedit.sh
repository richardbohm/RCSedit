#!/bin/bash

string="n"
if [ ! -d RCS ] 
	then
  		echo -e "RCS directory doesn't exist, creating a new one."
  		mkdir RCS
fi


if [ -z "$(ls -l RCS | grep $1.v )" ]
then
    echo Creating first revision, enter log message: 
    ci -u $1

else
while [ "$string" != "y" ]
do
    co -l $1
    vi $1
    rcsdiff $1
    echo -n "Continue? [y/n]:"
    read choice
    string=$choice
done

ci -u $1
fi