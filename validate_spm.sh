#! /usr/bin/env zsh

if [ $# -eq 0 ]
  then
    echo "Usage: validate_spm.sh <project file> <scheme>"
    exit 1
fi

mkdir spm
cd spm
rsync -avr --exclude='spm' --exclude='.git' --exclude='Carthage' .. .
- xcodebuild -project $1 -scheme $2 -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO | xcpretty
cd ..
