# Backend

## Pre-requisitos

Es necesario contar con:

- PostgreSQL.

- *Node.js* y su manejador de paquetes *npm* (que, por defecto, viene incluido en la instalación de *Node.js*).

## Pre-ejecución

Instalar los módulos necesarios y sus dependencias mediante el siguiente comando:
```
npm install
```

Para conectar con la Base de Datos, es necesario contar con una Base de Datos llamada `mi_restaurante`, abrir el puerto 5432 (por defecto) y tener, en este mismo directorio, un archivo llamado `.env` que contenga lo siguiente:
```
DATABASE_URL="postgresql://${DB_USER}:${PGPASS}@localhost:5432/${DB_NAME}"
DB_NAME="mi_restaurante"
PGPASS="[contraseña]"
DB_USER="[usuario]"
```
en donde `[usuario]` y `[contraseña]` deben ser reemplazados por las credenciales necesarias para conectar con la Base de Datos.

Para generar una versión de la Base de Datos basada en el *schema* de *Prisma*, ejecutar el siguiente comando:
```
(npx) prisma generate
```

Para actualizar la Base de Datos con esta versión generada (i.e. para *pushear* el estado del *schema* a la BD), ejecutar el siguiente comando:
```
(npx) prisma db push
```

**Nota**: Los paréntesis alrededor de la palabra `npx` indican que sólo es necesario añadirla al comando si *Prisma* **no** está instalado de manera global.

## Ejecución

Levantar el servidor en el puerto 3001 del *localhost* con el siguiente comando: 
```
node server.js
```

## Pruebas 

Ejecutar lo siguiente:
```
npm run pretest
npm run test
npm posttest
```
