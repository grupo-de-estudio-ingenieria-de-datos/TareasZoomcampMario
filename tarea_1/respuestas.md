# Respuestas de la primera tarea

## Question 1. Knowing docker tags

Ejecutando `docker run --help` encontramos que el comando que tiene el texto `Automatically remove the container when it exits` es:
```
--rm                             
```

## Question 2. Understanding docker first run

Corremos el comando `docker run --rm -it python:3.9 /bin/bash` para entrar a una terminal con la imagen python:3.9

La salida indica:

```
Package    Version
---------- -------
pip        23.0.1
setuptools 58.1.0
wheel      0.42.0
```

Por lo que la respuesta es `0.42.0`


## Preparación de los datos

Primero necesitamos cargar los datos, creamos el archivo `docker-compose.yml` y le damos un `docker compose up -d` para 'levantar' la base de datos.

Descargamos los datos a la carpeta `datasets` y extramos el archivo comprimido con `gzip -d green_tripdata_2019-09.csv.gz`

Instalamos un ambiente virtual con `jupyter` y `pandas` usando `poetry install`.

En el archivo `upload-data.ipynb` se cargan los datos a a la base. Ojo que primero hay que seleccionar el nuevo ambiente de poetry como intérprete de Python para poder ejecutarlo.

## Question 3 - 6

Estas respuestas se encuentran en el archivo `queries.sql`




