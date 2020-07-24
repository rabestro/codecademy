#!/bin/bash
echo "Welcome to installation script!"

firstline=$(head -1 source/changelog.md)

read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}

echo "The version $version will be build."
echo "Enter 1 for continue and 0 for exit."
read versioncontinue

if [[ versioncontinue -eq 0 ]]; then
  echo "Please come back when you are ready"
  exit 1
fi

for filename in source/*
do
  echo $filename
  if [[ $filename == "source/secretinfo.md" ]]; then
    echo "Not copying" $filename
  else
    echo "Copying" $filename
    cp $filename build/.
  fi
done

cd build/
echo "Build version $version contains:"
ls
cd ..
