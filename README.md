# Ingeniería de Software - Equipo 3 :heavy_check_mark:

Este proyecto **escolar** consiste en la implementación de un sistema para el manejo y administración de un conjunto de restaurantes. Se pueden encontrar más detalles en la documentación.

## Autores :busts_in_silhouette:

- [davidalencia](https://github.com/davidalencia) (David Román Valencia Rodríguez)

- [rubal501](https://github.com/rubal501) (J. Roberto Rubalcava Cortés)

- [ShadoRoca](https://github.com/ShadoRoca) (Rodrigo Liprandi Cortés)

- [sebastianalamina](https://github.com/sebastianalamina) (Sebastián Alamina Ramírez)

- Transitoriamente: [DiegoMendezMedina](https://github.com/DiegoMendezMedina) (Diego Méndez Médina)

## Estructura del proyecto :open_file_folder:

- Los archivos dentro de la carpeta `docs/` contienen la documentación del sistema.

- Los archivos dentro de la carpeta `front/` contienen la implementación *Frontend* del sistema.

- Los archivos dentro de la carpeta `back/` contienen la implementación *Backend* del sistema.

- Los archivos dentro de las carpetas `DB/` y `back/prisma/` contienen la implementación de la *Base de Datos* del sistema.

- Los archivos `docker-compose.yaml` y `downloadnrun.sh` auxilian en la ejecución integral del proyecto (ver **Cómo correr con Docker y Docker Compose** más abajo).

## Cómo correr con Docker y Docker Compose :whale2:

- Es necesario contar con una versión de *Docker* y *Docker Compose*.

El repositorio contiene un archivo `docker-compose.yaml` que crea 3 contenedores (para la *Base de Datos*, el *Backend* y el *Frontend*). Se ejecuta mediante el siguiente comando, que inicializa las imágenes correspondientes si se corre por primera vez:

```bash
docker compose -f docker-compose.yaml up -d
```