#!/bin/bash
echo "Deleting latest Data backup"
rm -rf ./bak/foundryVTTData
echo "Creating new Data backup"
cp -r ./foundryVTTData ./bak
echo "Finished Data backup"
echo "Deleting latest Source backup"
rm -rf ./bak/foundryVTTSource
echo "Creating new Source backup"
cp -r ./foundryVTTSource ./bak
echo "Finished Source backup"