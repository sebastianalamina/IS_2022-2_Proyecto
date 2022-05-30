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

 Date: 29/05/2022 20:28:39
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
-- Sequence structure for mesa_idmesa_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."mesa_idmesa_seq";
CREATE SEQUENCE "public"."mesa_idmesa_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."mesa_idmesa_seq" OWNER TO "root";

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
-- Sequence structure for orden_idorden_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."orden_idorden_seq";
CREATE SEQUENCE "public"."orden_idorden_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."orden_idorden_seq" OWNER TO "root";

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
-- Sequence structure for resena_idresena_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."resena_idresena_seq";
CREATE SEQUENCE "public"."resena_idresena_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."resena_idresena_seq" OWNER TO "root";

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
-- Table structure for administrador
-- ----------------------------
DROP TABLE IF EXISTS "public"."administrador";
CREATE TABLE "public"."administrador" (
  "idadmin" int4 NOT NULL DEFAULT nextval('administrador_idadmin_seq'::regclass),
  "idrestaurante" int4 NOT NULL,
  "idusuario" int4 NOT NULL
)
;
ALTER TABLE "public"."administrador" OWNER TO "root";

-- ----------------------------
-- Records of administrador
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS "public"."cliente";
CREATE TABLE "public"."cliente" (
  "idcliente" int4 NOT NULL DEFAULT nextval('cliente_idcliente_seq'::regclass),
  "idusuario" int4 NOT NULL
)
;
ALTER TABLE "public"."cliente" OWNER TO "root";

-- ----------------------------
-- Records of cliente
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for contenidoorden
-- ----------------------------
DROP TABLE IF EXISTS "public"."contenidoorden";
CREATE TABLE "public"."contenidoorden" (
  "idcontenidoorden" int4 NOT NULL DEFAULT nextval('contenidoorden_idcontenidoorden_seq'::regclass),
  "idorden" int4 NOT NULL,
  "idplatillo" int4
)
;
ALTER TABLE "public"."contenidoorden" OWNER TO "root";

-- ----------------------------
-- Records of contenidoorden
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for entregadomicilio
-- ----------------------------
DROP TABLE IF EXISTS "public"."entregadomicilio";
CREATE TABLE "public"."entregadomicilio" (
  "identregadomicilio" int4 NOT NULL DEFAULT nextval('entregadomicilio_identregadomicilio_seq'::regclass),
  "idrepartidor" int4 NOT NULL,
  "idorden" int4 NOT NULL
)
;
ALTER TABLE "public"."entregadomicilio" OWNER TO "root";

-- ----------------------------
-- Records of entregadomicilio
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."menu";
CREATE TABLE "public"."menu" (
  "idmenu" int4 NOT NULL DEFAULT nextval('menu_idmenu_seq'::regclass),
  "idrestaurante" int4 NOT NULL
)
;
ALTER TABLE "public"."menu" OWNER TO "root";

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mesa
-- ----------------------------
DROP TABLE IF EXISTS "public"."mesa";
CREATE TABLE "public"."mesa" (
  "idmesa" int4 NOT NULL DEFAULT nextval('mesa_idmesa_seq'::regclass),
  "idrestaurante" int4 NOT NULL,
  "ocupada" bool NOT NULL
)
;
ALTER TABLE "public"."mesa" OWNER TO "root";

-- ----------------------------
-- Records of mesa
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mesero
-- ----------------------------
DROP TABLE IF EXISTS "public"."mesero";
CREATE TABLE "public"."mesero" (
  "idmesero" int4 NOT NULL DEFAULT nextval('mesero_idmesero_seq'::regclass),
  "idadmin" int4 NOT NULL,
  "idrestaurante" int4 NOT NULL,
  "idusuario" int4 NOT NULL
)
;
ALTER TABLE "public"."mesero" OWNER TO "root";

-- ----------------------------
-- Records of mesero
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for orden
-- ----------------------------
DROP TABLE IF EXISTS "public"."orden";
CREATE TABLE "public"."orden" (
  "idorden" int4 NOT NULL DEFAULT nextval('orden_idorden_seq'::regclass),
  "idmesa" int4 NOT NULL,
  "idrestaurante" int4,
  "idcliente" int4,
  "domicilio" text COLLATE "pg_catalog"."default",
  "estado" "public"."estadoorden" NOT NULL,
  "esCarrito" bool NOT NULL,
  "pagado" bool NOT NULL,
  "costo" int4 NOT NULL
)
;
ALTER TABLE "public"."orden" OWNER TO "root";

-- ----------------------------
-- Records of orden
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for platillo
-- ----------------------------
DROP TABLE IF EXISTS "public"."platillo";
CREATE TABLE "public"."platillo" (
  "idplatillo" int4 NOT NULL DEFAULT nextval('platillo_idplatillo_seq'::regclass),
  "idmenu" int4 NOT NULL,
  "idrestaurante" int4 NOT NULL,
  "img" varchar(1000) COLLATE "pg_catalog"."default" NOT NULL,
  "nombre" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "costo" int4 NOT NULL
)
;
ALTER TABLE "public"."platillo" OWNER TO "root";

-- ----------------------------
-- Records of platillo
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for repartidor
-- ----------------------------
DROP TABLE IF EXISTS "public"."repartidor";
CREATE TABLE "public"."repartidor" (
  "idrepartidor" int4 NOT NULL DEFAULT nextval('repartidor_idrepartidor_seq'::regclass),
  "idusuario" int4
)
;
ALTER TABLE "public"."repartidor" OWNER TO "root";

-- ----------------------------
-- Records of repartidor
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for resena
-- ----------------------------
DROP TABLE IF EXISTS "public"."resena";
CREATE TABLE "public"."resena" (
  "idresena" int4 NOT NULL DEFAULT nextval('resena_idresena_seq'::regclass),
  "idrestaurante" int4 NOT NULL,
  "idcliente" int4 NOT NULL,
  "classificacion" int4 NOT NULL,
  "date" date NOT NULL,
  "texto" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."resena" OWNER TO "root";

-- ----------------------------
-- Records of resena
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for restaurante
-- ----------------------------
DROP TABLE IF EXISTS "public"."restaurante";
CREATE TABLE "public"."restaurante" (
  "idrestaurante" int4 NOT NULL DEFAULT nextval('restaurante_idrestaurante_seq'::regclass),
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
-- Records of restaurante
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS "public"."usuario";
CREATE TABLE "public"."usuario" (
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "contrasegna" varchar(255) COLLATE "pg_catalog"."default",
  "token" varchar(255) COLLATE "pg_catalog"."default",
  "rol" varchar(255) COLLATE "pg_catalog"."default",
  "idusuario" int4 NOT NULL DEFAULT nextval('usuario_idusuario_seq'::regclass),
  "confirmado" bool NOT NULL,
  "nombre" char(100) COLLATE "pg_catalog"."default" NOT NULL,
  "apatermo" char(100) COLLATE "pg_catalog"."default",
  "amaterno" char(100) COLLATE "pg_catalog"."default",
  "estado" varchar(100) COLLATE "pg_catalog"."default",
  "calle" varchar(100) COLLATE "pg_catalog"."default",
  "numero" int4,
  "cp" int4,
  "municipio" varchar(100) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."usuario" OWNER TO "root";

-- ----------------------------
-- Records of usuario
-- ----------------------------
BEGIN;
COMMIT;

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
ALTER SEQUENCE "public"."menu_idmenu_seq"
OWNED BY "public"."menu"."idmenu";
SELECT setval('"public"."menu_idmenu_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."mesa_idmesa_seq"
OWNED BY "public"."mesa"."idmesa";
SELECT setval('"public"."mesa_idmesa_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."mesero_idmesero_seq"
OWNED BY "public"."mesero"."idmesero";
SELECT setval('"public"."mesero_idmesero_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."orden_idorden_seq"
OWNED BY "public"."orden"."idorden";
SELECT setval('"public"."orden_idorden_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."platillo_idplatillo_seq"
OWNED BY "public"."platillo"."idplatillo";
SELECT setval('"public"."platillo_idplatillo_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."repartidor_idrepartidor_seq"
OWNED BY "public"."repartidor"."idrepartidor";
SELECT setval('"public"."repartidor_idrepartidor_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."resena_idresena_seq"
OWNED BY "public"."resena"."idresena";
SELECT setval('"public"."resena_idresena_seq"', 2, false);

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
-- Indexes structure for table administrador
-- ----------------------------
CREATE UNIQUE INDEX "administrador_idrestaurante_key" ON "public"."administrador" USING btree (
  "idrestaurante" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table administrador
-- ----------------------------
ALTER TABLE "public"."administrador" ADD CONSTRAINT "administrador_pkey" PRIMARY KEY ("idadmin");

-- ----------------------------
-- Primary Key structure for table cliente
-- ----------------------------
ALTER TABLE "public"."cliente" ADD CONSTRAINT "cliente_pkey" PRIMARY KEY ("idcliente");

-- ----------------------------
-- Primary Key structure for table contenidoorden
-- ----------------------------
ALTER TABLE "public"."contenidoorden" ADD CONSTRAINT "contenidoorden_pkey" PRIMARY KEY ("idcontenidoorden");

-- ----------------------------
-- Primary Key structure for table entregadomicilio
-- ----------------------------
ALTER TABLE "public"."entregadomicilio" ADD CONSTRAINT "entregadomicilio_pkey" PRIMARY KEY ("identregadomicilio");

-- ----------------------------
-- Primary Key structure for table menu
-- ----------------------------
ALTER TABLE "public"."menu" ADD CONSTRAINT "menu_pkey" PRIMARY KEY ("idmenu");

-- ----------------------------
-- Primary Key structure for table mesa
-- ----------------------------
ALTER TABLE "public"."mesa" ADD CONSTRAINT "mesa_pkey" PRIMARY KEY ("idmesa");

-- ----------------------------
-- Primary Key structure for table mesero
-- ----------------------------
ALTER TABLE "public"."mesero" ADD CONSTRAINT "mesero_pkey" PRIMARY KEY ("idmesero");

-- ----------------------------
-- Primary Key structure for table orden
-- ----------------------------
ALTER TABLE "public"."orden" ADD CONSTRAINT "orden_pkey" PRIMARY KEY ("idorden");

-- ----------------------------
-- Primary Key structure for table platillo
-- ----------------------------
ALTER TABLE "public"."platillo" ADD CONSTRAINT "platillo_pkey" PRIMARY KEY ("idplatillo");

-- ----------------------------
-- Primary Key structure for table repartidor
-- ----------------------------
ALTER TABLE "public"."repartidor" ADD CONSTRAINT "repartidor_pkey" PRIMARY KEY ("idrepartidor");

-- ----------------------------
-- Primary Key structure for table resena
-- ----------------------------
ALTER TABLE "public"."resena" ADD CONSTRAINT "resena_pkey" PRIMARY KEY ("idresena");

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
-- Foreign Keys structure for table contenidoorden
-- ----------------------------
ALTER TABLE "public"."contenidoorden" ADD CONSTRAINT "fk_contenido1" FOREIGN KEY ("idorden") REFERENCES "public"."orden" ("idorden") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."contenidoorden" ADD CONSTRAINT "fk_contenido3" FOREIGN KEY ("idplatillo") REFERENCES "public"."platillo" ("idplatillo") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table entregadomicilio
-- ----------------------------
ALTER TABLE "public"."entregadomicilio" ADD CONSTRAINT "fk_or1" FOREIGN KEY ("idrepartidor") REFERENCES "public"."repartidor" ("idrepartidor") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."entregadomicilio" ADD CONSTRAINT "fk_or2" FOREIGN KEY ("idorden") REFERENCES "public"."orden" ("idorden") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table menu
-- ----------------------------
ALTER TABLE "public"."menu" ADD CONSTRAINT "fk_menu1" FOREIGN KEY ("idrestaurante") REFERENCES "public"."restaurante" ("idrestaurante") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table mesa
-- ----------------------------
ALTER TABLE "public"."mesa" ADD CONSTRAINT "fk_mesa" FOREIGN KEY ("idrestaurante") REFERENCES "public"."restaurante" ("idrestaurante") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table mesero
-- ----------------------------
ALTER TABLE "public"."mesero" ADD CONSTRAINT "fk_mesero1" FOREIGN KEY ("idadmin") REFERENCES "public"."administrador" ("idadmin") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."mesero" ADD CONSTRAINT "fk_mesero2" FOREIGN KEY ("idrestaurante") REFERENCES "public"."restaurante" ("idrestaurante") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."mesero" ADD CONSTRAINT "fk_usuario" FOREIGN KEY ("idusuario") REFERENCES "public"."usuario" ("idusuario") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table orden
-- ----------------------------
ALTER TABLE "public"."orden" ADD CONSTRAINT "fk,orden3" FOREIGN KEY ("idcliente") REFERENCES "public"."cliente" ("idcliente") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."orden" ADD CONSTRAINT "fk_orden1" FOREIGN KEY ("idmesa") REFERENCES "public"."mesa" ("idmesa") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."orden" ADD CONSTRAINT "fk_orden2" FOREIGN KEY ("idrestaurante") REFERENCES "public"."restaurante" ("idrestaurante") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table platillo
-- ----------------------------
ALTER TABLE "public"."platillo" ADD CONSTRAINT "fk_paltillo1" FOREIGN KEY ("idmenu") REFERENCES "public"."menu" ("idmenu") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table repartidor
-- ----------------------------
ALTER TABLE "public"."repartidor" ADD CONSTRAINT "fk_usuario" FOREIGN KEY ("idusuario") REFERENCES "public"."usuario" ("idusuario") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table resena
-- ----------------------------
ALTER TABLE "public"."resena" ADD CONSTRAINT "fk_resena2" FOREIGN KEY ("idrestaurante") REFERENCES "public"."restaurante" ("idrestaurante") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."resena" ADD CONSTRAINT "fk_resena3" FOREIGN KEY ("idcliente") REFERENCES "public"."cliente" ("idcliente") ON DELETE NO ACTION ON UPDATE NO ACTION;
