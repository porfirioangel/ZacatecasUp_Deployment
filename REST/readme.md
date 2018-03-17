# Zacatecas Up REST Deployment

Deployment automatizado para los servicios REST consumidos por las aplicaciones
de UP.

## Solucionar el acceso a rutas de Laravel:


**First possible problem, mod_rewrite not enabled:**

```bash
sudo a2enmod rewrite && sudo service apache2 restart
```

**Second possible problem, AllowOverride is set to None, set it to All, assuming Apache2.4:**

```bash
sudo vim /etc/apache2/apache2.conf
search for <Directory /var/www/> and change AllowOverride None to AllowOverride All 
sudo service apache2 restart
```