# Zacatecas Up REST Deployment

Deployment automatizado para los servicios REST consumidos por las aplicaciones
de UP.

## Requerimientos en el servidor

- Servidor ssh
- Servidor Apache
- PHP 7
- Composer
- MySQL
- Python 3

## Configuración del lado del servidor

### Creación del directorio para el proyecto

**Crear directorio para el proyecto:**

```bash
sudo mkdir /var/www/html/ZacatecasUp
```

**Establecer el usuario y grupo propietarios de la carpeta del proyecto:**

```bash
sudo chown -R www-data:www-data /var/www/html/ZacatecasUp
```

**Dar permisos al grupo a la carpeta del proyecto:**

```bash
sudo chmod -R g+wrx /var/www/html/ZacatecasUp
```

### Generación de llave ssh para usuario www-data

**Asignar shell:**

```bash
sudo vim /etc/passwd

# Comentar la línea que evita el login
# www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin

# Agregar la línea que permite el login
www-data:x:33:33:www-data:/var/www:/bin/bash
```

**Crear directorio para almacenar llave ssh:**

```bash
cd /var/www
sudo mkdir .ssh
sudo chown -R www-data:www-data /var/www/.ssh
```

**Loguearse como www-data:**

```bash
sudo su www-data
```

**Generar llaves ssh:**

```bash
ssh-keygen -t rsa -C "porfirioads@gmail.com"
```

**Agregar llave pública al repositorio remoto de git:**

```bash
cat /var/www/.ssh/id_rsa.pub
```

**Agregar gitlab.com a los known hosts:**

```bash
ssh -T git@gitlab.com
```

**Salir de la sesión de www-data:**

```bash
exit
```

### Otras acciones de configuración

**Agregar usuario ubuntu al grupo www-data:**

```bash
sudo usermod -a -G www-data ubuntu
```

**Hacer propietario a www-data de la carpeta de composer:**

```bash
sudo chown -R www-data:www-data /home/ubuntu/.composer/
```

**Crear carpeta de scripts:**

```bash
mkdir ~/ZacatecasUp
```

**Hacer propietario a www-data de la carpeta de scripts:**

```bash
sudo chown -R www-data:www-data /home/ubuntu/ZacatecasUp/
```

## Acciones en el equipo local (porfirio ubuntu server):

**Conectarse al servidor por ssh (porfirio ubuntu server):**

```bash
ssh -i "ubuntu_server_key.pem" ubuntu@ec2-18-221-199-5.us-east-2.compute.amazonaws.com
```

**Copiar scripts al servidor remoto (porfirio ubuntu server):**

```bash
scp -i "/home/porfirio/AWS_Keys/Porfirio/ubuntu_server_key.pem" hook.php ubuntu@ec2-18-221-199-5.us-east-2.compute.amazonaws.com:/var/www/html/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/Porfirio/ubuntu_server_key.pem" deploy.sh ubuntu@ec2-18-221-199-5.us-east-2.compute.amazonaws.com:~/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/Porfirio/ubuntu_server_key.pem" create_user_and_database.sql ubuntu@ec2-18-221-199-5.us-east-2.compute.amazonaws.com:~/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/Porfirio/ubuntu_server_key.pem" email.html ubuntu@ec2-18-221-199-5.us-east-2.compute.amazonaws.com:~/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/Porfirio/ubuntu_server_key.pem" notification_email.py ubuntu@ec2-18-221-199-5.us-east-2.compute.amazonaws.com:~/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/Porfirio/ubuntu_server_key.pem" send_email.sh ubuntu@ec2-18-221-199-5.us-east-2.compute.amazonaws.com:~/ZacatecasUp
```

## Acciones en el equipo local (upeando ubuntu server):

**Conectarse al servidor por ssh (upeando ubuntu server):**

```bash
ssh -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" ubuntu@18.219.193.113
```

**Copiar scripts al servidor remoto (upeando ubuntu server):**

```bash
scp -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" hook.php ubuntu@18.219.193.113:/var/www/html/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" deploy.sh ubuntu@18.219.193.113:~/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" create_user_and_database.sql ubuntu@18.219.193.113:~/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" email.html ubuntu@18.219.193.113:~/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" notification_email.py ubuntu@18.219.193.113:~/ZacatecasUp

scp -i "/home/porfirio/AWS_Keys/ZacatecasUp/ubuntu_upeando_key.pem" send_email.sh ubuntu@18.219.193.113:~/ZacatecasUp
```