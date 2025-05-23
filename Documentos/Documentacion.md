# Caso 3 Base de Datos I 
# Voto Pura Vida: Sistema de Voto Electronico y Crowdfunding
# Documentacion

## Integrantes
* Santiago Calderón Zúñiga, 2024089232
* Adrián Josué Barquero Sánchez, 2024146907
* Christopher Daniel Vargas Villalta, 2024108443

## Tabla de Contenidos

- [1. Introduccion](#1-introduccion)
- [2. Arquitectura del Sistema](#2-arquitectura-del-sistema)
- [3. Base de Datos](#3-base-de-datos)
- [4. Implementacion del API](#4-implementacion-del-api)
- [5. Dashboard](#5-dashboard)
- [6. Instalacion y Configuracion](#6-instalacion-y-configuracion)
- [7. Seguridad](#7-seguridad)
- [8. Pruebas](#8-pruebas)

## 1. Introduccion
En el presente documento se explicaran las relaciones y el modelo en general de la base de datos, la API y el dashboard de la demo del micitt. Esta demo presenta el sistema de voto electronico conocido como "Voto Pura Vida" un sistema de votacion que permitiria al gobierno realizar una gran cantidad de estudios electorales no solo para votaciones en general, sino tambien para aspectos de interes gubernamental como podrian ser encuestas, consultas publicas, toma de decisiones en instituciones, validacion ciudadana de propuestas o proyectos, y direccionamiento de politicas. En cada seccion del documento se explicaran los modulos principales del sistema que serian: diseno de la base de datos, implementacion de la API y dashboard. Esto ademas de aspectos necesarios para entender el sistema y verificar su validez, esto apartados serian: arquitectura del sistema, instalacion y configuracion, seguridad y pruebas.

---

### 1.1 Descripcion del Proyecto

Costa Rica no cuenta actualmente con un sistema oficial de voto electrónico como herramienta electoral, y su implementación enfrenta desafíos políticos, constitucionales y legales que requieren atención cuidadosa. Sin embargo, el concepto del voto electrónico va mucho más allá de las elecciones nacionales: puede ser utilizado para encuestas, consultas públicas, toma de decisiones en instituciones, validación ciudadana de propuestas o proyectos, y direccionamiento de políticas. En una sociedad democrática y digital, la participación no puede seguir limitada únicamente a eventos electorales cada varios años.

El objetivo del proyecto es crear una plataforma de voto electrónico que sea accesible, segura y multifuncional. Esta herramienta permitirá a ciudadanos y organizaciones registrar propuestas de diversa índole, desde decisiones administrativas hasta proyectos municipales o reformas legales, y someterlas a votación de públicos específicos. Las votaciones serán parametrizables, con reglas claras y mecanismos de validación, alcanzando poblaciones segmentadas según diversos criterios como edad, ubicación, afiliación o profesión. Este sistema busca promover un entorno donde la voz ciudadana pueda incidir de manera ágil y directa en múltiples esferas.

El resultado esperado es una Costa Rica más participativa, con una ciudadanía empoderada y con herramientas modernas para expresarse, influir y decidir. Se fomentará una cultura de transparencia, donde todas las votaciones serán públicas en contenido y resultados, pero asegurando que los votos individuales sean siempre anónimos. La plataforma brindará reportes en tiempo real, será altamente segura, y ofrecerá un respaldo técnico y criptográfico que garantice la integridad de cada voto emitido. Esto dará agilidad competitiva al país, permitiendo decisiones más rápidas, mejor informadas y colectivamente validadas.

---

### 1.2 Objetivos

* Desarrollar un sistema de voto electoral seguro con autenticacion, cifrado y anonimato: Esto permitira a los ciudadanos y organizaciones registrar propuestas diversas y someterlas a votacion de publicos especificos, manteniendo la integridad del proceso y el anonimato de los votantes.

* Implementar un sistema de identidad digital robusto: Esto inlcuiria una prueba de vida y cifrado avanzado para garantizar la legitimidad de los participantes y la validez de cada voto emitido.

* Desarrollar un modulo de crowfunding inetgrado: Esto permitiria financiar colectivamente proyectos de innovacion y emprendimiento, con mecanismos de validacion, supervision ciudadana y distribucion transparente de fondos.

* Establecer una plataforma parametizable y flexible: Esto permitira configurar diferentes tipos de votaciones con reglas personalizadas, segmentacion de votos y criterios de validacion especificos segun las necesidades de cada caso.

* Desarrollar un sistema de visualizacion de resultados (Dashboard): Basicamente en tiempo real que permitira analizar datos de votacion de forma transparente, facilitando la toma de decisiones informadas y promoviendo la participacion ciudadana activa en diversos procesos democraticos.

### 1.3 Alcance

El alcance del caso 3 "Voto Pura Vida" comprende el desarrollo de un prototipo funcional que incluye las siguientes cuestiones:

1. **Diseño e implementación de una base de datos**: Esta sera relacional, y ser el soporte los requerimientos funcionales del sistema de voto electronico y el módulo de crowdfunding, incluyendo:
   - Estructura para gestion de usuarios con multiples factores de autenticación.
   - Almacenamiento seguro de propuestas y proyectos.
   - Sistema de votacion con anonimato garantizado.
   - Mecanismos de crowdfunding con gestion de inversiones y desembolsos.

2. **Desarrollo de una API serverless**: Expondra la funcionalidad core del sistema, implementando:
   - Endpoints para gestion de propuestas mediante procedimientos almacenados.
   - Endpoints para votacion y consulta mediante ORM.
   - Mecanismos de seguridad y validacion.
   - Soporte para multiples tipos de votaciones configurables.

3. **Creacion de un dashboard de visualizacion** Permite:
   - Consulta de resultados de votaciones en tiempo real.
   - Visualizacion de datos demográficos de votantes, siempre con anonimato.
   - Seguimiento de inversiones y estado de proyectos del modulo de crowdfunding.

Este prototipo se desarrollara como demostracion para el MICITT, enfocandose especificamente en el caso de uso del crowdfunding.

### 1.4 Tecnologias Utilizadas

### Base de Datos
- **Microsoft SQL Server Management Studio (SSMS)**: Para el diseño, desarrollo y administracion de la base de datos relacional.
- **SQL Server 2019**: Como motor de base de datos principal para almacenamiento y procesamiento de datos.
- **Flyway**: Herramienta para control de versiones de la base de datos, permitiendo migraciones controladas y versionadas.

### API Serverless
- **Python 3.9+**: Sera el lenguaje de programacion principal para el desarrollo del backend.
- **FastAPI**: Framework moderno de Python para crear APIs RESTful, esto soporte para operaciones asincronas y documentación automatica.
- **SQLAlchemy**: ORM (Object-Relational Mapping) para interactuar con la base de datos desde Python.
- **Pydantic**: Para validación de datos y serializacion/deserializacion.
- **PyODBC**: Driver para conectar Python con SQL Server.
- **Uvicorn**: Servidor ASGI para ejecutar la aplicacion FastAPI localmente.

### Dashboard
- **Power BI**: Plataforma de Microsoft para la creacion de visualizaciones interactivas y dashboards analíticos.
- **DAX**: Lenguaje de formulas para cálculos avanzados en Power BI.
- **Conexion DirectQuery**: Para visualizacion de datos en tiempo real desde SQL Server.

### Seguridad
- **JWT (JSON Web Tokens)**: Para autenticacion y autorizacion segura.
- **Algoritmos de cifrado**: AES-256 y RSA para cifrado de datos sensibles.
- **Hash seguro**: Bcrypt para el almacenamiento seguro de contraseñas.

### Herramientas de Desarrollo
- **Git & GitHub**: Para control de versiones del codigo y colaboración en equipo.
- **Visual Studio Code**: Como entorno de desarrollo integrado para la codificacion.
- **Postman/Swagger**: Para pruebas y documentacion de la API.

## 2. Arquitectura del Sistema

### 2.1 Diagrama de Arquitectura

### 2.2 Stack Tecnológico

### 2.3 Enfoque Serverless


## 3. Base de Datos
En este apartado nos enfocaremos enteramente en lo que corresponde al diseño de la base de datos. Como se menciono anteriormente para realizar este diseño nos centraremos en un modelo relacion usando "SQL Server", esto mediante el motor de base de datos de "SQL Server 2019" y "SSMS". Una vez entendido esto durante el apartado mencionaremos todas las entidades de la base de datos, el diagrama completo, nuestra division en grupos funcionales que nos ayudara a entender como se dividien propiamente las entidades y finalmente la descripcion de cada una de las tablas.

### 3.1 Entidades "Votu"
En este apartado expondremos el listado completo de todas las "entidades" o tablas de la base de datos. Destacar que usaremos el prefijo "Votu" para definir todos los nombres de las entidades. Por ejemplo "VotuUsers", esto para seguir una categorizacion y tener un mejor manejo visual del diseño.

1. Countries ✓
   * Provinces ✓
   * Cantones ✓
   * Distritos ✓
   * Adresses ✓
2.

### 3.2 Diagrama Entidad-Relacion

### 3.3 Grupos Funcionales de la Base de Datos 

1. Geolocalizacion: En este apartado nos encontramos con las tablas de countries, provinces, cantones y distritos. Este grupo funcional nos ayudara a dividir los votantes por regiones. Esto ademas de darnos propiamente la direccion de los usuarios. 

### 3.4 Descripcion de Tablas y Grupos Funcionales 
En este apartado se explicaran las tablas de cada uno de los grupos funcionales, describiendo su funcionamiento y como operan.

#### 3.4.1 Grupo Geolocalizacion
Este grupo funcional nos permite localizar la direccion de los usuarios, esto para tenerlo como datos en su perfil de usuario, direccion de facturacion en caso de inversion y el aspecto mas importante que corresponde propiamente a la division regional de los votantes en el pais. Este grupo funcional nos ayudara bastante en lo que se refiere al dashboard, esto dado a que nos permitira seccionar los resultados.

#### 3.4.1.1 VotuCountries
En esta tabla de paises dado la especificacion del proyecto tendremos solo a Costa Rica inicialmente. Sin embargo, hay que tomar en cuenta que "en una fase posterior, extranjeros podrán registrarse, condicionados por listas blancas de IPs y países permitidos". Consecuentemente añadimos un apartado de "allowsVoting" para ver si la persona que se quiere registrar o votar es parte de un pais permitido. 

| Nombre de columna | Tipo de datos | Longitud | Identidad | Incremento de identidad | Permitir valores NULL | Valor predeterminado |
|-------------------|---------------|----------|-----------|-------------------------|----------------------|---------------------|
| 🔑 countryId | int | 4 | ✓ | 1 | □ | |
| name | varchar(40) | 40 | □ | | □ | |
| createdAt | datetime | 8 | □ | | □ | |
| updatedAt | datetime | 8 | □ | | □ | |
| allowsVoting | bit | 1 | □ | | □ | 1 |




## 4. Implementacion del API

### 4.1 Endpoints implementados por Stored Procedures

#### a) crearActualizarPropuesta

#### b) revisarPropuesta

#### c) invertir 

#### d) repartirDividendos 

### 4.2 Endpoints implementados por ORM

#### a) votar

#### b) comentar

#### c) listarVotos

#### d) configurarVotacion


## 5. Dashboard

### 5.1 Visualizaciones implementadas

### 5.2 Tecnologia utilizada

### 5.3 Integracion con la API


## 6. Instalacion y Configuracion

### 6.1 Requisitos previos

### 6.2 Configuracion de la Base de Datos

### 6.3 Configuracion del API

### 6.4 Ejecucion local


## 7. Seguridad

### 7.1 Estrategia de Cifrado

### 7.2 Anonimato del Voto

### 7.3 Autenticacion y Autorizacion


## 8. Pruebas

### 8.1 Escenarios de Prueba

### 8.2 Resultados




