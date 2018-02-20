#!/bin/bash

echo "----------------------------------------------"
echo "Ejecución en $(date)"
echo "----------------------------------------------"
echo ""


REPO=$1
FOLDER=$2

if [ -d "$FOLDER" ]; then
    echo "Actualizando el repositorio $REPO..."
    cd $FOLDER
    git pull origin master
    cd ..
else
    echo "Clonando el repositorio $REPO..."
    git clone $REPO
fi

cd $FOLDER

echo "Creando archivo .env..."
cp .env.example .env

echo "Estableciendo configuración de la base de datos..."
sed -i 's/DB_DATABASE=homestead/DB_DATABASE=zacatecas_up/g' .env
sed -i 's/DB_USERNAME=homestead/DB_USERNAME=zacatecas_up/g' .env 
sed -i 's/DB_PASSWORD=secret/DB_PASSWORD=zacatecas_up/g' .env 

echo "Instalando dependencias del proyecto..."
export COMPOSER_HOME=/home/ubuntu/.composer
composer self-update
composer install --no-interaction

echo "Estableciendo llave del proyecto..."
php artisan key:generate

echo "Creando usuario y base de datos de MySQL..."
cd /home/ubuntu/ZacatecasUp
mysql -u root --password=padsMysql < create_user_and_database.sql

cd -
echo "Ejecutando migraciones de la base de datos"
php artisan migrate:fresh --seed