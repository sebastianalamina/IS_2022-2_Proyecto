# Backend :black_square_button:

## Pre-requisitos :memo:

Es necesario contar con:

- PostgreSQL.

- *Node.js* y su manejador de paquetes *npm* (que, por defecto, viene incluido en la instalación de *Node.js*).

## Pre-ejecución :nut_and_bolt:

- Instalar los módulos necesarios y sus dependencias mediante el siguiente comando:
```
npm install
```

- Es necesario contar con una Base de Datos llamada `mi_restaurante`, abrir el puerto 5432 (por defecto) y tener, en este mismo directorio, un archivo llamado `.env` que contenga lo siguiente:
```
DATABASE_URL="postgresql://${DB_USER}:${PGPASS}@localhost:5432/${DB_NAME}"
DB_NAME="mi_restaurante"
PGPASS="[contraseña]"
DB_USER="[usuario]"
```
en donde `[usuario]` y `[contraseña]` deben ser reemplazados por las credenciales necesarias para conectar con la Base de Datos.

- Para generar una versión de la Base de Datos basada en el *schema* de *Prisma*, ejecutar el siguiente comando:
```
(npx) prisma generate
```

- Para actualizar la Base de Datos con esta versión generada (i.e. para *pushear* el estado del *schema* a la BD), ejecutar el siguiente comando:
```
(npx) prisma db push
```

**Nota**: Los paréntesis alrededor de la palabra `npx` indican que sólo es necesario añadirla al comando si *Prisma* **no** está instalado de manera global.

## Ejecución :outbox_tray:

- Levantar el servidor en el puerto 3001 del *localhost* con el siguiente comando: 
```
node server.js
```

**Nota**: También es posible levantar el servidor mediante *nodemon*, que actualiza el servidor según se le hagan cambios al código fuente. Esto se logra mediante el siguiente comando:
```
(npx) nodemon server.js
```

## Pruebas :ballot_box_with_check:

Para *testear* el *Backend*, ejecutar los siguientes comandos:
```
npm run pretest
npm run test
npm run posttest
```