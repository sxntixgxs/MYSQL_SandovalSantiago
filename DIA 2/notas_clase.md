# Clase 2

## comandos consola

+ systemctl status mysql funciona para verificar si mysql esta instalaod

+ como instalarlo? install mysql on ubuntu 20.04

+ sudo mysql

+ alterar usuario: ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1005153789'

+ flush privileges; para recargar los usuarios cambiados sin reiniciar el server

+ exit:

+ sudo mysql -u root -p // root nombre de usuario y -p te pide la clave; esto es para ingresar a mysql con el usuario root

+ mirar la ip es: ip addr

+ la ip es la que dice inet

+ se pueden configurar diferentes modos de acceso y restricciones dependiendo del usuario

+ por defecto rechaza los usuarios; el motor MYSQL rechaza la conexion y da REFUSE es porque la base de datos no tiene permisos para que alguien se conecte desde afuera

+ instalarlo deforma segura o predeterminado


+ archivo de configuracion mysql

+ sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf

+ hay que cambiar bind-adress para autorizar cualquier direccion es decir 0.0.0.0

+ si quiero autorizar direcciones especificas lo que se hace es ponerlas seguidas separadas x espacios

+ como se cambio el archivo de configuracion se reinicia: systemctl restart mysql

+ systemctl stop mysql 
+ systemctl start mysql

+ systemctl status mysql

+ ahora al hacer la conexion con vscode ua cambia el error, dice que es por error de usuario, mas no por conexion remota

+ abrir mysql es  sudo mysql -u root -p

+ crear usuario CREATE USER 'root'@'%' IDENTIFIED BY '1005153789' el porcentaje me vale por todas las ip por lo que lo que está haciendo es que ese usuario tenga acceso desde cualquier ip.

+  GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
esto me le da todos los privileigos de la db al usuario root

+ luego es flush privileges;

+     1  shutdown -f now
    2  clear
    3  passwd
    4  exit
    5  clear
    6  pwd
    7  cd .
    8  cd ..
    9  cd p4student/
   10  cd ..
   11  ls
   12  ls -l
   13  cd p4student/
   14  cd ..
   15  ls -l
   16  cd home/p4student/
   17  touch mytext.txt
   18  ls -l
   19  mkdir miCarpeta
   20  ls -l
   21  nano mytext.txt 
   22  clear
   23  sudo apt-get update
   24  exit
   25  sudo apt install mysql-server
   26  server is running using the systemctl start command:
   27  mysql
   28  mysql 
   29  ls
   30  cd .
   31  cd ../
   32  ls 
   33  cd ..
   34  ls
   35  cd .
   36  cd .home
   37  cd home/p4student/
   38  sudo systemctl status mysql
   39  clear
   40  exit
   41  ls
   42  sudo apt-get install mysql
   43  sudo apt-get install mysql-server
   44  system ctl
   45  systemctl
   46  systemctl status mysql
   47  sudo mysql
   48  sudo mysql -u root -p
   49  ip addr
   50  sudo mysql_secure_installation
   51  nano /etc/mysql/mysql.conf.d/mysqld.cnf
   52  sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
   53  systemctl restart mysql
   54  systemctl stop mysql
   55  systemctl start mysql
   56  systemctl status mysql
   57  sudo mysql -u root -p
   58  history
