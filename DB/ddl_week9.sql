/*
 Navicat Premium Data Transfer

 Source Server         : docker_dazzling_gould
 Source Server Type    : PostgreSQL
 Source Server Version : 130004
 Source Host           : localhost:5432
 Source Catalog        : mi_restaurante
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 130004
 File Encoding         : 65001

 Date: 18/04/2022 18:15:56
*/


-- ----------------------------
-- Type structure for estadoorden
-- ----------------------------
DROP TYPE IF EXISTS "public"."estadoorden";
CREATE TYPE "public"."estadoorden" AS ENUM (
  'RECIBIDA',
  'EN_PROCESO',
  'EN_CAMINO',
  'ENTREGADA'
);
ALTER TYPE "public"."estadoorden" OWNER TO "root";

-- ----------------------------
-- Sequence structure for administrador_idadmin_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."administrador_idadmin_seq";
CREATE SEQUENCE "public"."administrador_idadmin_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."administrador_idadmin_seq" OWNER TO "root";

-- ----------------------------
-- Sequence structure for cliente_idcliente_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cliente_idcliente_seq";
CREATE SEQUENCE "public"."cliente_idcliente_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."cliente_idcliente_seq" OWNER TO "root";

-- ----------------------------
-- Sequence structure for cocinero_idcocinero_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cocinero_idcocinero_seq";
CREATE SEQUENCE "public"."cocinero_idcocinero_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."cocinero_idcocinero_seq" OWNER TO "root";

-- ----------------------------
-- Sequence structure for contenidoorden_idcontenidoorden_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."contenidoorden_idcontenidoorden_seq";
CREATE SEQUENCE "public"."contenidoorden_idcontenidoorden_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."contenidoorden_idcontenidoorden_seq" OWNER TO "root";

-- ----------------------------
-- Sequence structure for entregadomicilio_identregadomicilio_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."entregadomicilio_identregadomicilio_seq";
CREATE SEQUENCE "public"."entregadomicilio_identregadomicilio_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."entregadomicilio_identregadomicilio_seq" OWNER TO "root";

-- ----------------------------
-- Sequence structure for entregamesa_identregamesa_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."entregamesa_identregamesa_seq";
CREATE SEQUENCE "public"."entregamesa_identregamesa_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."entregamesa_identregamesa_seq" OWNER TO "root";

-- ----------------------------
-- Sequence structure for franquicia_idfranquicia_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."franquicia_idfranquicia_seq";
CREATE SEQUENCE "public"."franquicia_idfranquicia_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."franquicia_idfranquicia_seq" OWNER TO "root";

-- ----------------------------
-- Sequence structure for inventario_idinventario_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."inventario_idinventario_seq";
CREATE SEQUENCE "public"."inventario_idinventario_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."inventario_idinventario_seq" OWNER TO "root";

-- ----------------------------
-- Sequence structure for menu_idmenu_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."menu_idmenu_seq";
CREATE SEQUENCE "public"."menu_idmenu_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."menu_idmenu_seq" OWNER TO "root";

-- ----------------------------
-- Sequence structure for mesero_idmesero_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."mesero_idmesero_seq";
CREATE SEQUENCE "public"."mesero_idmesero_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."mesero_idmesero_seq" OWNER TO "root";

-- ----------------------------
-- Sequence structure for ordenenvio_idordenenvio_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ordenenvio_idordenenvio_seq";
CREATE SEQUENCE "public"."ordenenvio_idordenenvio_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."ordenenvio_idordenenvio_seq" OWNER TO "root";

-- ----------------------------
-- Sequence structure for ordenescliente_idordencliente_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ordenescliente_idordencliente_seq";
CREATE SEQUENCE "public"."ordenescliente_idordencliente_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."ordenescliente_idordencliente_seq" OWNER TO "root";

-- ----------------------------
-- Sequence structure for ordennormal_idordennormal_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ordennormal_idordennormal_seq";
CREATE SEQUENCE "public"."ordennormal_idordennormal_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."ordennormal_idordennormal_seq" OWNER TO "root";

-- ----------------------------
-- Sequence structure for platillo_idplatillo_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."platillo_idplatillo_seq";
CREATE SEQUENCE "public"."platillo_idplatillo_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."platillo_idplatillo_seq" OWNER TO "root";

-- ----------------------------
-- Sequence structure for prepararorden_idpreparaorden_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."prepararorden_idpreparaorden_seq";
CREATE SEQUENCE "public"."prepararorden_idpreparaorden_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."prepararorden_idpreparaorden_seq" OWNER TO "root";

-- ----------------------------
-- Sequence structure for registrorestaurante_idregistrorestaurante_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."registrorestaurante_idregistrorestaurante_seq";
CREATE SEQUENCE "public"."registrorestaurante_idregistrorestaurante_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."registrorestaurante_idregistrorestaurante_seq" OWNER TO "root";

-- ----------------------------
-- Sequence structure for repartidor_idrepartidor_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."repartidor_idrepartidor_seq";
CREATE SEQUENCE "public"."repartidor_idrepartidor_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."repartidor_idrepartidor_seq" OWNER TO "root";

-- ----------------------------
-- Sequence structure for restaurante_idrestaurante_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."restaurante_idrestaurante_seq";
CREATE SEQUENCE "public"."restaurante_idrestaurante_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."restaurante_idrestaurante_seq" OWNER TO "root";

-- ----------------------------
-- Sequence structure for usuario_idusuario_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."usuario_idusuario_seq";
CREATE SEQUENCE "public"."usuario_idusuario_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."usuario_idusuario_seq" OWNER TO "root";

-- ----------------------------
-- Table structure for _prisma_migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."_prisma_migrations";
CREATE TABLE "public"."_prisma_migrations" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "checksum" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "finished_at" timestamptz(6),
  "migration_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "logs" text COLLATE "pg_catalog"."default",
  "rolled_back_at" timestamptz(6),
  "started_at" timestamptz(6) NOT NULL DEFAULT now(),
  "applied_steps_count" int4 NOT NULL DEFAULT 0
)
;
ALTER TABLE "public"."_prisma_migrations" OWNER TO "root";

-- ----------------------------
-- Table structure for administrador
-- ----------------------------
DROP TABLE IF EXISTS "public"."administrador";
CREATE TABLE "public"."administrador" (
  "idadmin" int4 NOT NULL DEFAULT nextval('administrador_idadmin_seq'::regclass),
  "idrestaurante" int4 NOT NULL,
  "nombre" char(100) COLLATE "pg_catalog"."default" NOT NULL,
  "apatermo" char(100) COLLATE "pg_catalog"."default",
  "amaterno" char(100) COLLATE "pg_catalog"."default",
  "idusuario" int4 NOT NULL
)
;
ALTER TABLE "public"."administrador" OWNER TO "root";

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS "public"."cliente";
CREATE TABLE "public"."cliente" (
  "idcliente" int4 NOT NULL DEFAULT nextval('cliente_idcliente_seq'::regclass),
  "nombre" char(100) COLLATE "pg_catalog"."default" NOT NULL,
  "apatermo" char(100) COLLATE "pg_catalog"."default",
  "amaterno" char(100) COLLATE "pg_catalog"."default",
  "estado" varchar(100) COLLATE "pg_catalog"."default",
  "calle" varchar(100) COLLATE "pg_catalog"."default",
  "numero" int4,
  "cp" int4,
  "municipio" varchar(100) COLLATE "pg_catalog"."default",
  "idusuario" int4 NOT NULL
)
;
ALTER TABLE "public"."cliente" OWNER TO "root";

-- ----------------------------
-- Table structure for cocinero
-- ----------------------------
DROP TABLE IF EXISTS "public"."cocinero";
CREATE TABLE "public"."cocinero" (
  "idcocinero" int4 NOT NULL DEFAULT nextval('cocinero_idcocinero_seq'::regclass),
  "idadmin" int4 NOT NULL,
  "idrestaurante" int4 NOT NULL,
  "nombre" char(100) COLLATE "pg_catalog"."default" NOT NULL,
  "apatermo" char(100) COLLATE "pg_catalog"."default",
  "amaterno" char(100) COLLATE "pg_catalog"."default",
  "idusuario" int4 NOT NULL
)
;
ALTER TABLE "public"."cocinero" OWNER TO "root";

-- ----------------------------
-- Table structure for contenidoorden
-- ----------------------------
DROP TABLE IF EXISTS "public"."contenidoorden";
CREATE TABLE "public"."contenidoorden" (
  "idcontenidoorden" int4 NOT NULL DEFAULT nextval('contenidoorden_idcontenidoorden_seq'::regclass),
  "idordennormal" int4,
  "idordenenvio" int4,
  "idplatillo" int4
)
;
ALTER TABLE "public"."contenidoorden" OWNER TO "root";

-- ----------------------------
-- Table structure for entregadomicilio
-- ----------------------------
DROP TABLE IF EXISTS "public"."entregadomicilio";
CREATE TABLE "public"."entregadomicilio" (
  "identregadomicilio" int4 NOT NULL DEFAULT nextval('entregadomicilio_identregadomicilio_seq'::regclass),
  "idrepartidor" int4 NOT NULL,
  "idordenenvio" int4 NOT NULL,
  "estado" char(18) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."entregadomicilio" OWNER TO "root";

-- ----------------------------
-- Table structure for entregamesa
-- ----------------------------
DROP TABLE IF EXISTS "public"."entregamesa";
CREATE TABLE "public"."entregamesa" (
  "identregamesa" int4 NOT NULL DEFAULT nextval('entregamesa_identregamesa_seq'::regclass),
  "idmesero" int4 NOT NULL,
  "idordennormal" int4 NOT NULL,
  "estado" char(18) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."entregamesa" OWNER TO "root";

-- ----------------------------
-- Table structure for franquicia
-- ----------------------------
DROP TABLE IF EXISTS "public"."franquicia";
CREATE TABLE "public"."franquicia" (
  "idfranquicia" int4 NOT NULL DEFAULT nextval('franquicia_idfranquicia_seq'::regclass),
  "nombre" varchar(100) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."franquicia" OWNER TO "root";

-- ----------------------------
-- Table structure for inventario
-- ----------------------------
DROP TABLE IF EXISTS "public"."inventario";
CREATE TABLE "public"."inventario" (
  "idinventario" int4 NOT NULL DEFAULT nextval('inventario_idinventario_seq'::regclass),
  "nombre" char(100) COLLATE "pg_catalog"."default" NOT NULL,
  "cantidad" int4 NOT NULL,
  "idrestaurante" int4 NOT NULL
)
;
ALTER TABLE "public"."inventario" OWNER TO "root";

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."menu";
CREATE TABLE "public"."menu" (
  "idmenu" int4 NOT NULL DEFAULT nextval('menu_idmenu_seq'::regclass),
  "idrestaurante" int4 NOT NULL,
  "idfranquicia" int4 NOT NULL
)
;
ALTER TABLE "public"."menu" OWNER TO "root";

-- ----------------------------
-- Table structure for mesero
-- ----------------------------
DROP TABLE IF EXISTS "public"."mesero";
CREATE TABLE "public"."mesero" (
  "idmesero" int4 NOT NULL DEFAULT nextval('mesero_idmesero_seq'::regclass),
  "idadmin" int4 NOT NULL,
  "idrestaurante" int4 NOT NULL,
  "nombre" char(100) COLLATE "pg_catalog"."default" NOT NULL,
  "apatermo" char(100) COLLATE "pg_catalog"."default",
  "amaterno" char(100) COLLATE "pg_catalog"."default",
  "idusuario" int4 NOT NULL
)
;
ALTER TABLE "public"."mesero" OWNER TO "root";

-- ----------------------------
-- Table structure for ordenenvio
-- ----------------------------
DROP TABLE IF EXISTS "public"."ordenenvio";
CREATE TABLE "public"."ordenenvio" (
  "idordenenvio" int4 NOT NULL DEFAULT nextval('ordenenvio_idordenenvio_seq'::regclass),
  "costo" int4 NOT NULL
)
;
ALTER TABLE "public"."ordenenvio" OWNER TO "root";

-- ----------------------------
-- Table structure for ordenescliente
-- ----------------------------
DROP TABLE IF EXISTS "public"."ordenescliente";
CREATE TABLE "public"."ordenescliente" (
  "idordencliente" int4 NOT NULL DEFAULT nextval('ordenescliente_idordencliente_seq'::regclass),
  "idcliente" int4 NOT NULL,
  "idordenenvio" int4 NOT NULL,
  "idordennormal" int4 NOT NULL,
  "metodopago" char(18) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."ordenescliente" OWNER TO "root";

-- ----------------------------
-- Table structure for ordennormal
-- ----------------------------
DROP TABLE IF EXISTS "public"."ordennormal";
CREATE TABLE "public"."ordennormal" (
  "idordennormal" int4 NOT NULL DEFAULT nextval('ordennormal_idordennormal_seq'::regclass),
  "costo" int4 NOT NULL,
  "estado" "public"."estadoorden" NOT NULL
)
;
ALTER TABLE "public"."ordennormal" OWNER TO "root";

-- ----------------------------
-- Table structure for platillo
-- ----------------------------
DROP TABLE IF EXISTS "public"."platillo";
CREATE TABLE "public"."platillo" (
  "idplatillo" int4 NOT NULL DEFAULT nextval('platillo_idplatillo_seq'::regclass),
  "idmenu" int4 NOT NULL,
  "idrestaurante" int4 NOT NULL,
  "idfranquicia" int4 NOT NULL,
  "nombre" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "costo" int4 NOT NULL
)
;
ALTER TABLE "public"."platillo" OWNER TO "root";

-- ----------------------------
-- Table structure for prepararorden
-- ----------------------------
DROP TABLE IF EXISTS "public"."prepararorden";
CREATE TABLE "public"."prepararorden" (
  "idpreparaorden" int4 NOT NULL DEFAULT nextval('prepararorden_idpreparaorden_seq'::regclass),
  "idcocinero" int4 NOT NULL,
  "idordenenvio" int4 NOT NULL,
  "idordennormal" int4 NOT NULL
)
;
ALTER TABLE "public"."prepararorden" OWNER TO "root";

-- ----------------------------
-- Table structure for registrorestaurante
-- ----------------------------
DROP TABLE IF EXISTS "public"."registrorestaurante";
CREATE TABLE "public"."registrorestaurante" (
  "idregistrorestaurante" int4 NOT NULL DEFAULT nextval('registrorestaurante_idregistrorestaurante_seq'::regclass),
  "idadmin" int4 NOT NULL,
  "idrestaurante" int4 NOT NULL,
  "fecha" date NOT NULL
)
;
ALTER TABLE "public"."registrorestaurante" OWNER TO "root";

-- ----------------------------
-- Table structure for repartidor
-- ----------------------------
DROP TABLE IF EXISTS "public"."repartidor";
CREATE TABLE "public"."repartidor" (
  "idrepartidor" int4 NOT NULL DEFAULT nextval('repartidor_idrepartidor_seq'::regclass),
  "nombre" char(100) COLLATE "pg_catalog"."default" NOT NULL,
  "apatermo" char(100) COLLATE "pg_catalog"."default",
  "amaterno" char(100) COLLATE "pg_catalog"."default",
  "idusuario" int4
)
;
ALTER TABLE "public"."repartidor" OWNER TO "root";

-- ----------------------------
-- Table structure for restaurante
-- ----------------------------
DROP TABLE IF EXISTS "public"."restaurante";
CREATE TABLE "public"."restaurante" (
  "idrestaurante" int4 NOT NULL DEFAULT nextval('restaurante_idrestaurante_seq'::regclass),
  "idfranquicia" int4 NOT NULL,
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "estado" varchar(100) COLLATE "pg_catalog"."default",
  "calle" varchar(100) COLLATE "pg_catalog"."default",
  "numero" int4,
  "cp" int4,
  "municipio" varchar(100) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."restaurante" OWNER TO "root";

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS "public"."usuario";
CREATE TABLE "public"."usuario" (
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "contrasegna" varchar(255) COLLATE "pg_catalog"."default",
  "token" varchar(255) COLLATE "pg_catalog"."default",
  "rol" varchar(255) COLLATE "pg_catalog"."default",
  "idusuario" int4 NOT NULL DEFAULT nextval('usuario_idusuario_seq'::regclass)
)
;
ALTER TABLE "public"."usuario" OWNER TO "root";

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."administrador_idadmin_seq"
OWNED BY "public"."administrador"."idadmin";
SELECT setval('"public"."administrador_idadmin_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cliente_idcliente_seq"
OWNED BY "public"."cliente"."idcliente";
SELECT setval('"public"."cliente_idcliente_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cocinero_idcocinero_seq"
OWNED BY "public"."cocinero"."idcocinero";
SELECT setval('"public"."cocinero_idcocinero_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."contenidoorden_idcontenidoorden_seq"
OWNED BY "public"."contenidoorden"."idcontenidoorden";
SELECT setval('"public"."contenidoorden_idcontenidoorden_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."entregadomicilio_identregadomicilio_seq"
OWNED BY "public"."entregadomicilio"."identregadomicilio";
SELECT setval('"public"."entregadomicilio_identregadomicilio_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."entregamesa_identregamesa_seq"
OWNED BY "public"."entregamesa"."identregamesa";
SELECT setval('"public"."entregamesa_identregamesa_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."franquicia_idfranquicia_seq"
OWNED BY "public"."franquicia"."idfranquicia";
SELECT setval('"public"."franquicia_idfranquicia_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."inventario_idinventario_seq"
OWNED BY "public"."inventario"."idinventario";
SELECT setval('"public"."inventario_idinventario_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."menu_idmenu_seq"
OWNED BY "public"."menu"."idmenu";
SELECT setval('"public"."menu_idmenu_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."mesero_idmesero_seq"
OWNED BY "public"."mesero"."idmesero";
SELECT setval('"public"."mesero_idmesero_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ordenenvio_idordenenvio_seq"
OWNED BY "public"."ordenenvio"."idordenenvio";
SELECT setval('"public"."ordenenvio_idordenenvio_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ordenescliente_idordencliente_seq"
OWNED BY "public"."ordenescliente"."idordencliente";
SELECT setval('"public"."ordenescliente_idordencliente_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ordennormal_idordennormal_seq"
OWNED BY "public"."ordennormal"."idordennormal";
SELECT setval('"public"."ordennormal_idordennormal_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."platillo_idplatillo_seq"
OWNED BY "public"."platillo"."idplatillo";
SELECT setval('"public"."platillo_idplatillo_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."prepararorden_idpreparaorden_seq"
OWNED BY "public"."prepararorden"."idpreparaorden";
SELECT setval('"public"."prepararorden_idpreparaorden_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."registrorestaurante_idregistrorestaurante_seq"
OWNED BY "public"."registrorestaurante"."idregistrorestaurante";
SELECT setval('"public"."registrorestaurante_idregistrorestaurante_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."repartidor_idrepartidor_seq"
OWNED BY "public"."repartidor"."idrepartidor";
SELECT setval('"public"."repartidor_idrepartidor_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."restaurante_idrestaurante_seq"
OWNED BY "public"."restaurante"."idrestaurante";
SELECT setval('"public"."restaurante_idrestaurante_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."usuario_idusuario_seq"
OWNED BY "public"."usuario"."idusuario";
SELECT setval('"public"."usuario_idusuario_seq"', 2, false);

-- ----------------------------
-- Primary Key structure for table _prisma_migrations
-- ----------------------------
ALTER TABLE "public"."_prisma_migrations" ADD CONSTRAINT "_prisma_migrations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table administrador
-- ----------------------------
ALTER TABLE "public"."administrador" ADD CONSTRAINT "administrador_pkey" PRIMARY KEY ("idadmin");

-- ----------------------------
-- Primary Key structure for table cliente
-- ----------------------------
ALTER TABLE "public"."cliente" ADD CONSTRAINT "cliente_pkey" PRIMARY KEY ("idcliente");

-- ----------------------------
-- Primary Key structure for table cocinero
-- ----------------------------
ALTER TABLE "public"."cocinero" ADD CONSTRAINT "cocinero_pkey" PRIMARY KEY ("idcocinero");

-- ----------------------------
-- Primary Key structure for table contenidoorden
-- ----------------------------
ALTER TABLE "public"."contenidoorden" ADD CONSTRAINT "contenidoorden_pkey" PRIMARY KEY ("idcontenidoorden");

-- ----------------------------
-- Primary Key structure for table entregadomicilio
-- ----------------------------
ALTER TABLE "public"."entregadomicilio" ADD CONSTRAINT "entregadomicilio_pkey" PRIMARY KEY ("identregadomicilio");

-- ----------------------------
-- Primary Key structure for table entregamesa
-- ----------------------------
ALTER TABLE "public"."entregamesa" ADD CONSTRAINT "entregamesa_pkey" PRIMARY KEY ("identregamesa");

-- ----------------------------
-- Primary Key structure for table franquicia
-- ----------------------------
ALTER TABLE "public"."franquicia" ADD CONSTRAINT "franquicia_pkey" PRIMARY KEY ("idfranquicia");

-- ----------------------------
-- Primary Key structure for table inventario
-- ----------------------------
ALTER TABLE "public"."inventario" ADD CONSTRAINT "inventario_pkey" PRIMARY KEY ("idinventario");

-- ----------------------------
-- Primary Key structure for table menu
-- ----------------------------
ALTER TABLE "public"."menu" ADD CONSTRAINT "menu_pkey" PRIMARY KEY ("idmenu");

-- ----------------------------
-- Primary Key structure for table mesero
-- ----------------------------
ALTER TABLE "public"."mesero" ADD CONSTRAINT "mesero_pkey" PRIMARY KEY ("idmesero");

-- ----------------------------
-- Primary Key structure for table ordenenvio
-- ----------------------------
ALTER TABLE "public"."ordenenvio" ADD CONSTRAINT "ordenenvio_pkey" PRIMARY KEY ("idordenenvio");

-- ----------------------------
-- Primary Key structure for table ordenescliente
-- ----------------------------
ALTER TABLE "public"."ordenescliente" ADD CONSTRAINT "ordenescliente_pkey" PRIMARY KEY ("idordencliente");

-- ----------------------------
-- Primary Key structure for table ordennormal
-- ----------------------------
ALTER TABLE "public"."ordennormal" ADD CONSTRAINT "ordennormal_pkey" PRIMARY KEY ("idordennormal");

-- ----------------------------
-- Primary Key structure for table platillo
-- ----------------------------
ALTER TABLE "public"."platillo" ADD CONSTRAINT "platillo_pkey" PRIMARY KEY ("idplatillo");

-- ----------------------------
-- Primary Key structure for table prepararorden
-- ----------------------------
ALTER TABLE "public"."prepararorden" ADD CONSTRAINT "prepararorden_pkey" PRIMARY KEY ("idpreparaorden");

-- ----------------------------
-- Primary Key structure for table registrorestaurante
-- ----------------------------
ALTER TABLE "public"."registrorestaurante" ADD CONSTRAINT "registrorestaurante_pkey" PRIMARY KEY ("idregistrorestaurante");

-- ----------------------------
-- Primary Key structure for table repartidor
-- ----------------------------
ALTER TABLE "public"."repartidor" ADD CONSTRAINT "repartidor_pkey" PRIMARY KEY ("idrepartidor");

-- ----------------------------
-- Primary Key structure for table restaurante
-- ----------------------------
ALTER TABLE "public"."restaurante" ADD CONSTRAINT "restaurante_pkey" PRIMARY KEY ("idrestaurante");

-- ----------------------------
-- Primary Key structure for table usuario
-- ----------------------------
ALTER TABLE "public"."usuario" ADD CONSTRAINT "usuario_pkey" PRIMARY KEY ("idusuario");

-- ----------------------------
-- Foreign Keys structure for table administrador
-- ----------------------------
ALTER TABLE "public"."administrador" ADD CONSTRAINT "fk_admin" FOREIGN KEY ("idrestaurante") REFERENCES "public"."restaurante" ("idrestaurante") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."administrador" ADD CONSTRAINT "fk_usuario" FOREIGN KEY ("idusuario") REFERENCES "public"."usuario" ("idusuario") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table cliente
-- ----------------------------
ALTER TABLE "public"."cliente" ADD CONSTRAINT "fk_usuario" FOREIGN KEY ("idusuario") REFERENCES "public"."usuario" ("idusuario") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table cocinero
-- ----------------------------
ALTER TABLE "public"."cocinero" ADD CONSTRAINT "fk_cocinero1" FOREIGN KEY ("idadmin") REFERENCES "public"."administrador" ("idadmin") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."cocinero" ADD CONSTRAINT "fk_cocinero2" FOREIGN KEY ("idrestaurante") REFERENCES "public"."restaurante" ("idrestaurante") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."cocinero" ADD CONSTRAINT "fk_usuario" FOREIGN KEY ("idusuario") REFERENCES "public"."usuario" ("idusuario") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table contenidoorden
-- ----------------------------
ALTER TABLE "public"."contenidoorden" ADD CONSTRAINT "fk_contenido1" FOREIGN KEY ("idordennormal") REFERENCES "public"."ordennormal" ("idordennormal") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."contenidoorden" ADD CONSTRAINT "fk_contenido2" FOREIGN KEY ("idordenenvio") REFERENCES "public"."ordenenvio" ("idordenenvio") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."contenidoorden" ADD CONSTRAINT "fk_contenido3" FOREIGN KEY ("idplatillo") REFERENCES "public"."platillo" ("idplatillo") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table entregadomicilio
-- ----------------------------
ALTER TABLE "public"."entregadomicilio" ADD CONSTRAINT "fk_or1" FOREIGN KEY ("idrepartidor") REFERENCES "public"."repartidor" ("idrepartidor") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."entregadomicilio" ADD CONSTRAINT "fk_or2" FOREIGN KEY ("idordenenvio") REFERENCES "public"."ordenenvio" ("idordenenvio") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table entregamesa
-- ----------------------------
ALTER TABLE "public"."entregamesa" ADD CONSTRAINT "fk_em1" FOREIGN KEY ("idmesero") REFERENCES "public"."mesero" ("idmesero") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."entregamesa" ADD CONSTRAINT "fk_em2" FOREIGN KEY ("idordennormal") REFERENCES "public"."ordennormal" ("idordennormal") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table inventario
-- ----------------------------
ALTER TABLE "public"."inventario" ADD CONSTRAINT "fk_inventario" FOREIGN KEY ("idrestaurante") REFERENCES "public"."restaurante" ("idrestaurante") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table menu
-- ----------------------------
ALTER TABLE "public"."menu" ADD CONSTRAINT "fk_menu1" FOREIGN KEY ("idrestaurante") REFERENCES "public"."restaurante" ("idrestaurante") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table mesero
-- ----------------------------
ALTER TABLE "public"."mesero" ADD CONSTRAINT "fk_mesero1" FOREIGN KEY ("idadmin") REFERENCES "public"."administrador" ("idadmin") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."mesero" ADD CONSTRAINT "fk_mesero2" FOREIGN KEY ("idrestaurante") REFERENCES "public"."restaurante" ("idrestaurante") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."mesero" ADD CONSTRAINT "fk_usuario" FOREIGN KEY ("idusuario") REFERENCES "public"."usuario" ("idusuario") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table ordenescliente
-- ----------------------------
ALTER TABLE "public"."ordenescliente" ADD CONSTRAINT "fk_oc1" FOREIGN KEY ("idcliente") REFERENCES "public"."cliente" ("idcliente") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."ordenescliente" ADD CONSTRAINT "fk_oc2" FOREIGN KEY ("idordenenvio") REFERENCES "public"."ordenenvio" ("idordenenvio") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."ordenescliente" ADD CONSTRAINT "fk_oc3" FOREIGN KEY ("idordennormal") REFERENCES "public"."ordennormal" ("idordennormal") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table platillo
-- ----------------------------
ALTER TABLE "public"."platillo" ADD CONSTRAINT "fk_paltillo1" FOREIGN KEY ("idmenu") REFERENCES "public"."menu" ("idmenu") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table prepararorden
-- ----------------------------
ALTER TABLE "public"."prepararorden" ADD CONSTRAINT "fk_po1" FOREIGN KEY ("idcocinero") REFERENCES "public"."cocinero" ("idcocinero") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."prepararorden" ADD CONSTRAINT "fk_po2" FOREIGN KEY ("idordenenvio") REFERENCES "public"."ordenenvio" ("idordenenvio") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."prepararorden" ADD CONSTRAINT "fk_po3" FOREIGN KEY ("idordennormal") REFERENCES "public"."ordennormal" ("idordennormal") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table registrorestaurante
-- ----------------------------
ALTER TABLE "public"."registrorestaurante" ADD CONSTRAINT "fk_reg1" FOREIGN KEY ("idadmin") REFERENCES "public"."administrador" ("idadmin") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."registrorestaurante" ADD CONSTRAINT "fk_reg2" FOREIGN KEY ("idrestaurante") REFERENCES "public"."restaurante" ("idrestaurante") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table repartidor
-- ----------------------------
ALTER TABLE "public"."repartidor" ADD CONSTRAINT "fk_usuario" FOREIGN KEY ("idusuario") REFERENCES "public"."usuario" ("idusuario") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table restaurante
-- ----------------------------
ALTER TABLE "public"."restaurante" ADD CONSTRAINT "fk_restaurante" FOREIGN KEY ("idfranquicia") REFERENCES "public"."franquicia" ("idfranquicia") ON DELETE NO ACTION ON UPDATE NO ACTION;
