#!/bin/bash

echo "----------------------------------------------"
echo "REST $(date)"
echo "----------------------------------------------"
echo ""


REPO=$1
FOLDER=$2
URL=$3

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

echo "Creating .env file..."
echo ""
cp .env.example .env

echo "Setting database configuration..."
echo ""
sed -i 's/DB_DATABASE=homestead/DB_DATABASE=zacatecas_up/g' .env
sed -i 's/DB_USERNAME=homestead/DB_USERNAME=zacatecas_up/g' .env 
sed -i 's/DB_PASSWORD=secret/DB_PASSWORD=zacatecas_up/g' .env 

echo "Installing project dependencies..."
echo ""
export COMPOSER_HOME=/home/ubuntu/.composer
composer self-update
composer install --no-interaction
echo ""

echo "Setting project key..."
echo ""
php artisan key:generate

echo ""
echo "Creating MySQL database and user..."
echo ""
cd /home/ubuntu/ZacatecasUp
mysql -u root --password=ZacatecasUp < create_user_and_database.sql
echo ""

cd -
echo ""
echo "Executing database migrations..."
echo ""
php artisan migrate:fresh --seed
echo ""

echo "End"