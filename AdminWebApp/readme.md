# Zacatecas Up Admin Web App Deployment

Deployment automatizado para la aplicación web administrativa de UP.

## Configuración del lado del servidor

### Habilitar swap para equipos con poca ram

**Create a 4 Gigabyte file:**

```bash
sudo fallocate -l 4G /swapfile
```

**Verify that the correct amount of space was reserved:**

```bash
ls -lh /swapfile
```

**Adjust the permissions on our file so that it isn't readable by anyone besides root:**

```bash
sudo chmod 600 /swapfile
```

**Verify that the file has the correct permissions:**

```bash
ls -lh /swapfile
# -rw------- 1 root root 4.0G Apr 28 17:19 /swapfile
```

**Tell our system to set up the swap space:**

```bash
sudo mkswap /swapfile

# Setting up swapspace version 1, size = 4194300 KiB
# no label, UUID=e2f1e9cf-c0a9-4ed4-b8ab-714b8a7d6944
```

**Enable the file to be used as a swap space:**

```bash
sudo swapon /swapfile
```

**Verify that the procedure was successful:**

```bash
sudo swapon -s

# Filename                Type        Size    Used    Priority
# /swapfile               file        4194300 0       -1
```

**We have a new swap file here. We can use the free utility again to corroborate our findings:**

```bash
free -m

#              total       used       free     shared    buffers     cached
# Mem:          3953        101       3851          0          5         30
# -/+ buffers/cache:         66       3887
# Swap:         4095          0       4095
```

**Make the Swap File Permanent:**

```bash
sudo vim /etc/fstab

# Put the following content
/swapfile   none    swap    sw    0   0
```

### Instalación de dependencias

**Instalar nodejs:**

```bash
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

sudo apt-get install -y nodejs

cd /var/www

sudo mkdir .npm-global

npm config set prefix '.npm-global'

echo 'export PATH=/var/www/.npm-global/bin:$PATH' | sudo tee --append .profile > /dev/null

sudo chown -R www-data:www-data /var/www/.npm

sudo chmod -R g+wrx /var/www/.npm

sudo su www-data

source .profile
```


**Instalar angular:**

```bash
npm install -g @angular/cli@latest

npm install --save-dev @angular/cli@latest

# Si la instalación falla:

npm uninstall -g @angular/cli

npm uninstall --save-dev @angular/cli

npm cache verify

npm cache clean --force

npm install

npm install -g @angular/cli@latest

npm install --save-dev @angular/cli@latest
```

### Configuración de apache

**Crear el siguiente .htaccess en la carpeta del proyecto:**

```bash
<IfModule mod_rewrite.c>
    RewriteEngine on
    RewriteCond %{REQUEST_FILENAME} -s [OR]
    RewriteCond %{REQUEST_FILENAME} -l [OR]
    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^.*$ - [NC,L]
    RewriteRule ^(.*) index.html [NC,L]
</IfModule>
```

## Solución de errores

**Module build failed: Error: ENOENT: no such file or directory:**

```bash
npm rebuild node-sass
```