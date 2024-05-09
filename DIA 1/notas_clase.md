# Clase 1 MYSQL

+ IP clasificacion: 
    + Clase A -> Corporativo **WAN** desde 0.0.0.0 hasta 127.255.255.255. 
    + Clase B -> municipal(?) **MAN** desde 128.0.0.0 hasta 191.255.255.255.
    + Clase C -> doméstico **LocalAccessNetwork LAN** desde 192.0.0.0 hasta 223.255.255.255
+ La división viene dada así [img](https://www.google.com/search?client=ubuntu-sn&hs=5r1&sca_esv=b944e575ace96cca&sca_upv=1&channel=fs&sxsrf=ACQVn0-63ktVIHF-enY0OVFRV2DCCVOrkQ:1714521652062&q=que+significa+cada+byte+ip&uds=AMwkrPsg_JvUfmGZWVnIanpSJbfw7eSAZSS8IumdL9MVKw87JW5Mon9HRW_1BWYEIR2DqwKOX3SgMnYTpIIfn_8xWY_BM2pyxa7JNeiB94vODt2Ii0WfKDGK9uPRCfAnDEWyWTwH0h0NZF8exJqTw8dtbvyfWYI2tJcAkM6MyfGCcgB-xviD2a3C0uFuE5eHMfem2FLqG6y6M-4UbTIVUTbuPP0Fkjt6sbEr7F4qe7xgWftC9oMr5ft04_oqPhrETOYQZ5i75-Kbx3h69sSCMdfG3ib-Uvug7q3DLKEpkhKiiHvay-zPNyI&udm=2&prmd=isvnbmtz&sa=X&ved=2ahUKEwjBl5_wkuuFAxUTVjABHby6BMwQtKgLegQIDRAB&biw=1850&bih=968&dpr=1#vhid=fmUzImh9kRG1KM&vssid=mosaic)

+ 0000 *1 primer identificador** NETWORK ID PAIS CLASE A **16M HOSTS**
+ 0000 *2 primeros* son NETWORK identificadores x ejemplo 0[Col]0[Giron] 00[host] **65K HOSTS**
+ 0000 *3 son network* y 1 es el host **254 HOSTS**

+ Puertos más comunes: 
    + 80 HTTP
    + 443 HTTPS **Requiere Dominio**
    + 21 FTP
    + 3306 MYSQL **también es un motor / servicio que usa un puerto**


+ **Borrar config VSCode** code --list-extensions | xargs -L 1 code --uninstall-extension
+ Instalación MYSQL por máquina virtual
    + IP: 172.16.101.140
    + ssh p4student@172.16.101.140
    + password: p4student
    + como cambiar contraseña en linux: passwd y enter
    + nueva clave es 1005153789
    + para cerrar la conexion con maquina virtual es **exit** 
    + **clear** 
    + significa AT HACIA por eso la conexion es user@ip 
    + **pwd** ruta de donde estoy
    + **ls** LISTAR
    + **ls -l** list long, es info extendida
    + **/$**  es la carpeta raiz de linux está antes de home
    + **nano nombre archivo** se abre nano y es ctrl x para salir y luego confirmar o puede ser ctrl s ctrl x
    + ### Instalación MYSQL
        + **sudo apt-get update** super usuario quiero obtener una actualizacion de todos los software que hay
        + la clave de sudo solo me la pide una vez por sesion
        + buscar cómo se hace: install mysql server community ubuntu 20.04
        + es decir primero se actualiza todo ubuntu y ahi si instalamos mysql
        + sudo apt install mysql-server





```SQL
CREATE TABLE IF NOT EXISTS;
```
