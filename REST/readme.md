# Zacatecas Up REST Deployment

Deployment automatizado para los servicios REST consumidos por las aplicaciones
de UP.

## Requerimientos en el servidor
- Servidor ssh
- Servidor Apache
- PHP 7
- Composer
- MySQL

## Configuración del lado del servidor

### Creación del directorio para el proyecto

**Crear directorio para el proyecto:**
```
mkdir /var/www/html/ZacatecasUp
```

**Establecer el usuario y grupo propietarios de la carpeta del proyecto:**
```
sudo chown -R www-data:www-data /var/www/html/ZacatecasUp
```

**Dar permisos al grupo a la carpeta del proyecto:**
```
chmod -R g+wrx /var/www/html/ZacatecasUp
```

### Generación de llave ssh para usuario www-data

**Asignar shell:**
```
sudo vim /etc/passwd

# Comentar la línea que evita el login
# www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin

# Agregar la línea que permite el login
www-data:x:33:33:www-data:/var/www:/bin/bash
```

**Crear directorio para almacenar llave ssh:**
```
cd /var/www
sudo mkdir .ssh
sudo chown -R www-data:www-data /var/www/.ssh
```

**Loguearse como www-data:**
```
sudo su www-data
```

**Generar llaves ssh:**
```
ssh-keygen -t rsa -C "porfirioads@gmail.com"
```

**Agregar llave pública al repositorio remoto de git:**
```
cat /var/www/.ssh/id_rsa.pub
```

**Agregar gitlab.com a los known hosts:**
```
ssh -T git@gitlab.com
```

### Otras acciones de configuración

**Agregar usuario ubuntu al grupo www-data:**
```
sudo usermod -a -G www-data ubuntu
```

**Hacer propietario a www-data de la carpeta de composer:**
```
sudo chown -R www-data:www-data /home/ubuntu/.composer/
```

## Acciones en el equipo local:

**Conectarse al servidor por ssh:**
```
ssh -i "ubuntu_server_key.pem" ubuntu@ec2-18-221-199-5.us-east-2.compute.amazonaws.com
```

**Copiar scripts al servidor remoto:**
```
scp -i "/home/porfirio/AWS_Keys/Porfirio/ubuntu_server_key.pem" hook.php ubuntu@ec2-18-221-199-5.us-east-2.compute.amazonaws.com:/var/www/html/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/Porfirio/ubuntu_server_key.pem" deploy.sh ubuntu@ec2-18-221-199-5.us-east-2.compute.amazonaws.com:~/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/Porfirio/ubuntu_server_key.pem" create_user_and_database.sql ubuntu@ec2-18-221-199-5.us-east-2.compute.amazonaws.com:~/ZacatecasUp
```