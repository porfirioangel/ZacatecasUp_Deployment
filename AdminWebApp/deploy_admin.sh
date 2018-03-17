#!/bin/bash

echo "----------------------------------------------"
echo "AdminWebApp $(date)"
echo "----------------------------------------------"
echo ""


REPO=$1
FOLDER=$2
URL=$3

#REPO="git@gitlab.com:zacatecasup/ZacatecasUp_WebApp.git"
#FOLDER="ZacatecasUp_WebApp"


if [ -d "$FOLDER" ]; then
    echo "Updating project $REPO..."
    echo ""
    cd $FOLDER
    git pull origin master
    cd ..
else
    echo "Cloning project $REPO..."
    echo ""
    git clone $REPO
fi

echo ""

cd $FOLDER

#echo "Installing dependencies..."
#echo ""
#npm install
#npm install --save-dev @angular/cli@latest

echo "Setting environment's files..."
echo ""

ENVIRONMENT_TXT="src/environments/environment.txt"
ENVIRONMENT_TS="src/environments/environment.ts"
ENVIRONMENT_PROD_TXT="src/environments/environment.prod.txt"
ENVIRONMENT_PROD_TS="src/environments/environment.prod.ts"

if [ -f $ENVIRONMENT_TXT ]; then
   mv $ENVIRONMENT_TXT $ENVIRONMENT_TS
fi

if [ -f $ENVIRONMENT_PROD_TXT ]; then
   mv $ENVIRONMENT_PROD_TXT $ENVIRONMENT_PROD_TS
fi

ssh -i "/home/ubuntu/ZacatecasUp/ubuntu_upeando_key.pem" ubuntu@18.219.193.113 "sh ~/ZacatecasUp/build_angular.sh"

echo "End"