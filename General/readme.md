# Zacatecas Up Admin Web App Deployment

Pasos generales para el deployment automatizado del sistema de Zacatecas UP

## Requerimientos en el servidor

- Servidor ssh
- Servidor Apache
- Nodejs
- PHP 7
- Composer
- MySQL
- Python 3
- Expect

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

## Acciones en el equipo local (upeando ubuntu server):

**Copiar scripts al servidor remoto (upeando ubuntu server):**

```bash
./copy_scripts.sh
```