#!/bin/bash

echo "Downloading artifacts for OpenJDK 9 Stretch"
wget https://ci.adoptopenjdk.net/view/ev3dev/job/eljbuild/job/stretch-9/lastSuccessfulBuild/artifact/build/jdk-ev3.tar.gz
wget https://ci.adoptopenjdk.net/view/ev3dev/job/eljbuild/job/stretch-9/lastSuccessfulBuild/artifact/build/jmods-ev3.tar.gz
wget https://ci.adoptopenjdk.net/view/ev3dev/job/eljbuild/job/stretch-9/lastSuccessfulBuild/artifact/build/jri-ev3.tar.gz
wget https://ci.adoptopenjdk.net/view/ev3dev/job/eljbuild/job/stretch-9/lastSuccessfulBuild/artifact/build/metadata

echo "Splitting jdk-ev3.tar.gz"
split -b 50m jdk-ev3.tar.gz "jdk-ev3.tar.gz.part."
cat jdk-ev3.tar.gz.part.* > new-jdk-ev3.tar.gz
tar -xf new-jdk-ev3.tar.gz
cmp jdk-ev3.tar.gz new-jdk-ev3.tar.gz

echo "Splitting jmods-ev3.tar.gz"
split -b 50m jmods-ev3.tar.gz "jmods-ev3.tar.gz.part."
cat jmods-ev3.tar.gz.part.* > new-jmods-ev3.tar.gz
tar -xf new-jmods-ev3.tar.gz
cmp jmods-ev3.tar.gz new-jmods-ev3.tar.gz

echo "Splitting jri-ev3.tar.gz"
split -b 50m jri-ev3.tar.gz "jri-ev3.tar.gz.part."
cat jri-ev3.tar.gz.part.* > new-jri-ev3.tar.gz
tar -xf new-jri-ev3.tar.gz
cmp jri-ev3.tar.gz new-jri-ev3.tar.gz

echo "Removing files"
rm -rf jdk
rm -rf jmods
rm -rf jri

rm jdk-ev3.tar.gz
rm jmods-ev3.tar.gz
rm jri-ev3.tar.gz

rm new-jdk-ev3.tar.gz
rm new-jmods-ev3.tar.gz
rm new-jri-ev3.tar.gz
