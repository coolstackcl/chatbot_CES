# Desinstalación Ubuntu

## Referencia:
[desinstalar-mysql-en-ubuntu-21-04-completamente](https://www.solvetic.com/tutoriales/article/9270-desinstalar-mysql-en-ubuntu-21-04-completamente/)


### Versión de Ubuntu

~~~
lsb_release -a 
sudo systemctl status mysql 
sudo apt remove --purge mysql-server mysql-client mysql-common 
sudo apt autoclean 
sudo apt autoremove sudo rm -rf /var/lib/mysql
~~~

### Estado del servidor MySQL
```sudo systemctl status mysql```

### Remueve y desinstala todo MySQL
```sudo apt remove --purge mysql-server mysql-client mysql-common```

### Limpia paquetes del proceso de desinstalación
```sudo apt autoclean```

### Los elimina
```sudo apt autoremove```

### Elimina directorio de MySQL
```sudo rm -rf /var/lib/mysql```

# Instalación Ubuntu

## Referencias:
[como-instalar-mysql-en-ubuntu-20-04-lts](https://noviello.it/es/como-instalar-mysql-en-ubuntu-20-04-lts/)
[como-instalar-mysql-en-ubuntu-21-04-hirsute-hippo](https://www.solvetic.com/tutoriales/article/9211-como-instalar-mysql-en-ubuntu-21-04-hirsute-hippo/)

### Instala MySQL server, client y libmysqlclient
```sudo apt-get install mysql-server mysql-client libmysqlclient-dev```

### Verifica estado del serivdor, debería estar ON
```sudo systemctl status mysql```

### Instala script de seguridad
Depende de las preferencias que quieran instalar, yo opté por no validar contraseña, desabilitar usuarios anonimos, habilitar conexión remota

```sudo mysql_secure_installation```

### Ingresamos a MySQL
```sudo mysql```

### Verificamos los datos de los usuarios
```SELECT user,authentication_string,plugin,host FROM mysql.user;```

### Modificamos la password del usuario root
```ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'password';```

### Actualizamos privilegios
```FLUSH PRIVILEGES;```

### Verificamos cambios
```SELECT user,authentication_string,plugin,host FROM mysql.user;```

### Salimos de MySQL
```exit```

### Instalamos MySQL para Ruby
```gem install mysql2```

### Creamos un proyecto en Rails
```rails new NOMBRE_PROYECTO -d mysql```

### En *config/database.yml* agregamos el *password* que definimos para *root*
~~~
default: &default
  adapter: mysql2
  encoding: utf8mb4
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password: *****
  socket: /var/run/mysqld/mysqld.sock
~~~

### Dentro del proyecto crear base de datos
<code>rake db:create</code>