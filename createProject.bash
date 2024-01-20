#!bin/bash

echo "Enter the project name"
read projName
echo "Github repo remote"
read repo
echo "Github pull"
read gitpull

mkdir $projName
cd $projName
git init
git remote add origin $repo
git pull $gitpull main
npm i
