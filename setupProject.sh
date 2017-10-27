#!/bin/bash
# This script will setup a simple asm project for you
# Usage: ./setupProject.sh ProjectName

# copy the project template to the new project
cp -r project_template projects/$1

# rename the standard asm file
mv projects/$1/template.asm projects/$1/$1.asm

# setup the makefile
sed -i -e "s/template/$1/g" projects/$1/makefile
