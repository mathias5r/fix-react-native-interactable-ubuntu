#!/bin/bash

FILE_PATH="/home/mrosa/Segware/my-security-v3/android/settings.gradle"

if [ -f $FILE_PATH ]
then 
    echo "Reading file..."
else
    echo "File not exists!"
    exit 1
fi

sed -i -e 's+react-native-interactable/android+react-native-interactable/lib/android+g' $FILE_PATH

echo "fixing interactable path:"
echo
echo

cat $FILE_PATH

PACKAGE_PATH="/home/mrosa/Segware/my-security-v3/node_modules/react-native-interactable"


if [ -f $PACKAGE_PATH/\{ios\,android\}@ ]
then
    echo "Removing old link"
    rm -rf $PACKAGE_PATH/\{ios\,android\}@
else
    echo "old link not exits"
fi

ln -s lib/android $PACKAGE_PATH && ln -s lib/ios $PACKAGE_PATH
