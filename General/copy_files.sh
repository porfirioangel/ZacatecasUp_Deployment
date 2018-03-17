#!/bin/bash

# Script and files to deploy the application

scp -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" ../General/email.html ubuntu@18.219.193.113:~/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" ../General/notification_email.py ubuntu@18.219.193.113:~/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" ../General/send_email.sh ubuntu@18.219.193.113:~/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" ../AdminWebApp/hook_admin.php ubuntu@18.219.193.113:/var/www/html/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" ../AdminWebApp/deploy_admin.sh ubuntu@18.219.193.113:~/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" ../AdminWebApp/build_angular.sh ubuntu@18.219.193.113:~/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" ../REST/hook_rest.php ubuntu@18.219.193.113:/var/www/html/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" ../REST/deploy_rest.sh ubuntu@18.219.193.113:~/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" ../REST/create_user_and_database.sql ubuntu@18.219.193.113:~/ZacatecasUp

# Configurating ssh access

ssh -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" ubuntu@18.219.193.113 "sudo rm ZacatecasUp/ubuntu_upeando_key.pem"

scp -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" /home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem ubuntu@18.219.193.113:~/ZacatecasUp

ssh -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" ubuntu@18.219.193.113 "sudo chown www-data:www-data ZacatecasUp/ubuntu_upeando_key.pem"

ssh -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" ubuntu@18.219.193.113 "sudo chmod 400 ZacatecasUp/ubuntu_upeando_key.pem"