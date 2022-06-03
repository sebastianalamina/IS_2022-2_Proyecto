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

 Date: 03/06/2022 08:36:15
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
  "idrestaurante" int4,
  "idusuario" int4 NOT NULL
)
;
ALTER TABLE "public"."administrador" OWNER TO "root";

-- ----------------------------
-- Records of administrador
-- ----------------------------
BEGIN;
INSERT INTO "public"."administrador" VALUES (1, 1, 41);
INSERT INTO "public"."administrador" VALUES (2, 2, 52);
INSERT INTO "public"."administrador" VALUES (3, 3, 103);
INSERT INTO "public"."administrador" VALUES (4, 4, 114);
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
INSERT INTO "public"."cliente" VALUES (1, 11);
INSERT INTO "public"."cliente" VALUES (2, 12);
INSERT INTO "public"."cliente" VALUES (3, 13);
INSERT INTO "public"."cliente" VALUES (4, 14);
INSERT INTO "public"."cliente" VALUES (5, 15);
INSERT INTO "public"."cliente" VALUES (6, 16);
INSERT INTO "public"."cliente" VALUES (7, 17);
INSERT INTO "public"."cliente" VALUES (8, 18);
INSERT INTO "public"."cliente" VALUES (9, 19);
INSERT INTO "public"."cliente" VALUES (10, 20);
INSERT INTO "public"."cliente" VALUES (11, 21);
INSERT INTO "public"."cliente" VALUES (12, 22);
INSERT INTO "public"."cliente" VALUES (13, 23);
INSERT INTO "public"."cliente" VALUES (14, 24);
INSERT INTO "public"."cliente" VALUES (15, 25);
INSERT INTO "public"."cliente" VALUES (16, 26);
INSERT INTO "public"."cliente" VALUES (17, 27);
INSERT INTO "public"."cliente" VALUES (18, 28);
INSERT INTO "public"."cliente" VALUES (19, 29);
INSERT INTO "public"."cliente" VALUES (20, 30);
INSERT INTO "public"."cliente" VALUES (21, 31);
INSERT INTO "public"."cliente" VALUES (22, 32);
INSERT INTO "public"."cliente" VALUES (23, 33);
INSERT INTO "public"."cliente" VALUES (24, 34);
INSERT INTO "public"."cliente" VALUES (25, 35);
INSERT INTO "public"."cliente" VALUES (26, 36);
INSERT INTO "public"."cliente" VALUES (27, 37);
INSERT INTO "public"."cliente" VALUES (28, 38);
INSERT INTO "public"."cliente" VALUES (29, 39);
INSERT INTO "public"."cliente" VALUES (30, 40);
INSERT INTO "public"."cliente" VALUES (31, 73);
INSERT INTO "public"."cliente" VALUES (32, 74);
INSERT INTO "public"."cliente" VALUES (33, 75);
INSERT INTO "public"."cliente" VALUES (34, 76);
INSERT INTO "public"."cliente" VALUES (35, 77);
INSERT INTO "public"."cliente" VALUES (36, 78);
INSERT INTO "public"."cliente" VALUES (37, 79);
INSERT INTO "public"."cliente" VALUES (38, 80);
INSERT INTO "public"."cliente" VALUES (39, 81);
INSERT INTO "public"."cliente" VALUES (40, 82);
INSERT INTO "public"."cliente" VALUES (41, 83);
INSERT INTO "public"."cliente" VALUES (42, 84);
INSERT INTO "public"."cliente" VALUES (43, 85);
INSERT INTO "public"."cliente" VALUES (44, 86);
INSERT INTO "public"."cliente" VALUES (45, 87);
INSERT INTO "public"."cliente" VALUES (46, 88);
INSERT INTO "public"."cliente" VALUES (47, 89);
INSERT INTO "public"."cliente" VALUES (48, 90);
INSERT INTO "public"."cliente" VALUES (49, 91);
INSERT INTO "public"."cliente" VALUES (50, 92);
INSERT INTO "public"."cliente" VALUES (51, 93);
INSERT INTO "public"."cliente" VALUES (52, 94);
INSERT INTO "public"."cliente" VALUES (53, 95);
INSERT INTO "public"."cliente" VALUES (54, 96);
INSERT INTO "public"."cliente" VALUES (55, 97);
INSERT INTO "public"."cliente" VALUES (56, 98);
INSERT INTO "public"."cliente" VALUES (57, 99);
INSERT INTO "public"."cliente" VALUES (58, 100);
INSERT INTO "public"."cliente" VALUES (59, 101);
INSERT INTO "public"."cliente" VALUES (60, 102);
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
INSERT INTO "public"."contenidoorden" VALUES (1, 1, 1);
INSERT INTO "public"."contenidoorden" VALUES (2, 2, 1);
INSERT INTO "public"."contenidoorden" VALUES (3, 3, 1);
INSERT INTO "public"."contenidoorden" VALUES (4, 4, 1);
INSERT INTO "public"."contenidoorden" VALUES (5, 5, 1);
INSERT INTO "public"."contenidoorden" VALUES (6, 6, 1);
INSERT INTO "public"."contenidoorden" VALUES (7, 7, 1);
INSERT INTO "public"."contenidoorden" VALUES (8, 8, 1);
INSERT INTO "public"."contenidoorden" VALUES (9, 9, 1);
INSERT INTO "public"."contenidoorden" VALUES (10, 10, 1);
INSERT INTO "public"."contenidoorden" VALUES (11, 11, 41);
INSERT INTO "public"."contenidoorden" VALUES (12, 12, 41);
INSERT INTO "public"."contenidoorden" VALUES (13, 13, 41);
INSERT INTO "public"."contenidoorden" VALUES (14, 14, 41);
INSERT INTO "public"."contenidoorden" VALUES (15, 15, 41);
INSERT INTO "public"."contenidoorden" VALUES (16, 16, 41);
INSERT INTO "public"."contenidoorden" VALUES (17, 17, 41);
INSERT INTO "public"."contenidoorden" VALUES (18, 18, 41);
INSERT INTO "public"."contenidoorden" VALUES (19, 19, 41);
INSERT INTO "public"."contenidoorden" VALUES (20, 20, 41);
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
INSERT INTO "public"."entregadomicilio" VALUES (1, 1, 1);
INSERT INTO "public"."entregadomicilio" VALUES (2, 2, 2);
INSERT INTO "public"."entregadomicilio" VALUES (3, 3, 3);
INSERT INTO "public"."entregadomicilio" VALUES (4, 4, 4);
INSERT INTO "public"."entregadomicilio" VALUES (5, 5, 5);
INSERT INTO "public"."entregadomicilio" VALUES (6, 6, 6);
INSERT INTO "public"."entregadomicilio" VALUES (7, 7, 7);
INSERT INTO "public"."entregadomicilio" VALUES (8, 8, 8);
INSERT INTO "public"."entregadomicilio" VALUES (9, 9, 9);
INSERT INTO "public"."entregadomicilio" VALUES (10, 10, 10);
INSERT INTO "public"."entregadomicilio" VALUES (11, 11, 11);
INSERT INTO "public"."entregadomicilio" VALUES (12, 12, 12);
INSERT INTO "public"."entregadomicilio" VALUES (13, 13, 13);
INSERT INTO "public"."entregadomicilio" VALUES (14, 14, 14);
INSERT INTO "public"."entregadomicilio" VALUES (15, 15, 15);
INSERT INTO "public"."entregadomicilio" VALUES (16, 16, 16);
INSERT INTO "public"."entregadomicilio" VALUES (17, 17, 17);
INSERT INTO "public"."entregadomicilio" VALUES (18, 18, 18);
INSERT INTO "public"."entregadomicilio" VALUES (19, 19, 19);
INSERT INTO "public"."entregadomicilio" VALUES (20, 20, 20);
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
INSERT INTO "public"."menu" VALUES (1, 1);
INSERT INTO "public"."menu" VALUES (2, 2);
INSERT INTO "public"."menu" VALUES (3, 3);
INSERT INTO "public"."menu" VALUES (4, 4);
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
INSERT INTO "public"."mesa" VALUES (1, 1, 't');
INSERT INTO "public"."mesa" VALUES (2, 1, 't');
INSERT INTO "public"."mesa" VALUES (3, 1, 't');
INSERT INTO "public"."mesa" VALUES (4, 1, 't');
INSERT INTO "public"."mesa" VALUES (5, 1, 't');
INSERT INTO "public"."mesa" VALUES (6, 1, 't');
INSERT INTO "public"."mesa" VALUES (7, 1, 't');
INSERT INTO "public"."mesa" VALUES (8, 1, 't');
INSERT INTO "public"."mesa" VALUES (9, 1, 't');
INSERT INTO "public"."mesa" VALUES (10, 1, 't');
INSERT INTO "public"."mesa" VALUES (11, 3, 't');
INSERT INTO "public"."mesa" VALUES (12, 3, 't');
INSERT INTO "public"."mesa" VALUES (13, 3, 't');
INSERT INTO "public"."mesa" VALUES (14, 3, 't');
INSERT INTO "public"."mesa" VALUES (15, 3, 't');
INSERT INTO "public"."mesa" VALUES (16, 3, 't');
INSERT INTO "public"."mesa" VALUES (17, 3, 't');
INSERT INTO "public"."mesa" VALUES (18, 3, 't');
INSERT INTO "public"."mesa" VALUES (19, 3, 't');
INSERT INTO "public"."mesa" VALUES (20, 3, 't');
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
INSERT INTO "public"."mesero" VALUES (1, 1, 1, 42);
INSERT INTO "public"."mesero" VALUES (2, 1, 1, 43);
INSERT INTO "public"."mesero" VALUES (3, 1, 1, 44);
INSERT INTO "public"."mesero" VALUES (4, 1, 1, 45);
INSERT INTO "public"."mesero" VALUES (5, 1, 1, 46);
INSERT INTO "public"."mesero" VALUES (6, 1, 1, 47);
INSERT INTO "public"."mesero" VALUES (7, 1, 1, 48);
INSERT INTO "public"."mesero" VALUES (8, 1, 1, 49);
INSERT INTO "public"."mesero" VALUES (9, 1, 1, 50);
INSERT INTO "public"."mesero" VALUES (10, 1, 1, 51);
INSERT INTO "public"."mesero" VALUES (11, 2, 2, 53);
INSERT INTO "public"."mesero" VALUES (12, 2, 2, 54);
INSERT INTO "public"."mesero" VALUES (13, 2, 2, 55);
INSERT INTO "public"."mesero" VALUES (14, 2, 2, 56);
INSERT INTO "public"."mesero" VALUES (15, 2, 2, 57);
INSERT INTO "public"."mesero" VALUES (16, 2, 2, 58);
INSERT INTO "public"."mesero" VALUES (17, 2, 2, 59);
INSERT INTO "public"."mesero" VALUES (18, 2, 2, 60);
INSERT INTO "public"."mesero" VALUES (19, 2, 2, 61);
INSERT INTO "public"."mesero" VALUES (20, 2, 2, 62);
INSERT INTO "public"."mesero" VALUES (21, 3, 3, 104);
INSERT INTO "public"."mesero" VALUES (22, 3, 3, 105);
INSERT INTO "public"."mesero" VALUES (23, 3, 3, 106);
INSERT INTO "public"."mesero" VALUES (24, 3, 3, 107);
INSERT INTO "public"."mesero" VALUES (25, 3, 3, 108);
INSERT INTO "public"."mesero" VALUES (26, 3, 3, 109);
INSERT INTO "public"."mesero" VALUES (27, 3, 3, 110);
INSERT INTO "public"."mesero" VALUES (28, 3, 3, 111);
INSERT INTO "public"."mesero" VALUES (29, 3, 3, 112);
INSERT INTO "public"."mesero" VALUES (30, 3, 3, 113);
INSERT INTO "public"."mesero" VALUES (31, 4, 4, 115);
INSERT INTO "public"."mesero" VALUES (32, 4, 4, 116);
INSERT INTO "public"."mesero" VALUES (33, 4, 4, 117);
INSERT INTO "public"."mesero" VALUES (34, 4, 4, 118);
INSERT INTO "public"."mesero" VALUES (35, 4, 4, 119);
INSERT INTO "public"."mesero" VALUES (36, 4, 4, 120);
INSERT INTO "public"."mesero" VALUES (37, 4, 4, 121);
INSERT INTO "public"."mesero" VALUES (38, 4, 4, 122);
INSERT INTO "public"."mesero" VALUES (39, 4, 4, 123);
INSERT INTO "public"."mesero" VALUES (40, 4, 4, 124);
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
INSERT INTO "public"."orden" VALUES (2, 2, 1, 2, 'periferico norte 1', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (3, 3, 1, 3, 'periferico norte 1', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (4, 4, 1, 4, 'periferico norte 1', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (5, 5, 1, 5, 'periferico norte 1', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (6, 6, 1, 6, 'periferico norte 1', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (7, 7, 1, 7, 'periferico norte 1', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (8, 8, 1, 8, 'periferico norte 1', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (9, 9, 1, 9, 'periferico norte 1', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (10, 10, 1, 10, 'periferico norte 1', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (11, 11, 3, 11, 'periferico norte 1', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (12, 12, 3, 12, 'periferico norte 1', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (13, 13, 3, 13, 'periferico norte 1', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (14, 14, 3, 14, 'periferico norte 1', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (15, 15, 3, 15, 'periferico norte 1', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (16, 16, 3, 16, 'periferico norte 1', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (17, 17, 3, 17, 'periferico norte 1', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (18, 18, 3, 18, 'periferico norte 1', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (19, 19, 3, 19, 'periferico norte 1', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (20, 20, 3, 20, 'periferico norte 1', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (1, 1, 1, 1, 'periferico norte 1', 'ENTREGADA', 'f', 't', 100);
COMMIT;

-- ----------------------------
-- Table structure for platillo
-- ----------------------------
DROP TABLE IF EXISTS "public"."platillo";
CREATE TABLE "public"."platillo" (
  "idplatillo" int4 NOT NULL DEFAULT nextval('platillo_idplatillo_seq'::regclass),
  "idmenu" int4 NOT NULL,
  "idrestaurante" int4 NOT NULL,
  "img" varchar(1000) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "costo" int4 NOT NULL
)
;
ALTER TABLE "public"."platillo" OWNER TO "root";

-- ----------------------------
-- Records of platillo
-- ----------------------------
BEGIN;
INSERT INTO "public"."platillo" VALUES (1, 1, 1, NULL, 'Handmade Metal Ball', 873);
INSERT INTO "public"."platillo" VALUES (2, 1, 1, NULL, 'Recycled Concrete Towels', 179);
INSERT INTO "public"."platillo" VALUES (3, 1, 1, NULL, 'Oriental Fresh Shoes', 508);
INSERT INTO "public"."platillo" VALUES (4, 1, 1, NULL, 'Tasty Metal Soap', 315);
INSERT INTO "public"."platillo" VALUES (5, 1, 1, NULL, 'Ergonomic Rubber Salad', 875);
INSERT INTO "public"."platillo" VALUES (6, 1, 1, NULL, 'Oriental Concrete Pizza', 439);
INSERT INTO "public"."platillo" VALUES (7, 1, 1, NULL, 'Electronic Soft Sausages', 51);
INSERT INTO "public"."platillo" VALUES (8, 1, 1, NULL, 'Handmade Frozen Hat', 182);
INSERT INTO "public"."platillo" VALUES (9, 1, 1, NULL, 'Gorgeous Bronze Pants', 908);
INSERT INTO "public"."platillo" VALUES (10, 1, 1, NULL, 'Rustic Bronze Pizza', 97);
INSERT INTO "public"."platillo" VALUES (11, 1, 1, NULL, 'Recycled Cotton Computer', 792);
INSERT INTO "public"."platillo" VALUES (12, 1, 1, NULL, 'Sleek Steel Cheese', 100);
INSERT INTO "public"."platillo" VALUES (13, 1, 1, NULL, 'Bespoke Bronze Chicken', 61);
INSERT INTO "public"."platillo" VALUES (14, 1, 1, NULL, 'Awesome Rubber Fish', 13);
INSERT INTO "public"."platillo" VALUES (15, 1, 1, NULL, 'Small Concrete Bike', 455);
INSERT INTO "public"."platillo" VALUES (16, 1, 1, NULL, 'Gorgeous Granite Car', 296);
INSERT INTO "public"."platillo" VALUES (17, 1, 1, NULL, 'Intelligent Rubber Keyboard', 35);
INSERT INTO "public"."platillo" VALUES (18, 1, 1, NULL, 'Tasty Fresh Soap', 232);
INSERT INTO "public"."platillo" VALUES (19, 1, 1, NULL, 'Refined Fresh Soap', 69);
INSERT INTO "public"."platillo" VALUES (20, 1, 1, NULL, 'Awesome Concrete Bacon', 273);
INSERT INTO "public"."platillo" VALUES (21, 2, 2, NULL, 'Handcrafted Granite Table', 540);
INSERT INTO "public"."platillo" VALUES (22, 2, 2, NULL, 'Intelligent Cotton Shirt', 974);
INSERT INTO "public"."platillo" VALUES (23, 2, 2, NULL, 'Electronic Frozen Bike', 760);
INSERT INTO "public"."platillo" VALUES (24, 2, 2, NULL, 'Handmade Frozen Chips', 518);
INSERT INTO "public"."platillo" VALUES (25, 2, 2, NULL, 'Refined Bronze Chips', 209);
INSERT INTO "public"."platillo" VALUES (26, 2, 2, NULL, 'Unbranded Fresh Car', 304);
INSERT INTO "public"."platillo" VALUES (27, 2, 2, NULL, 'Recycled Soft Chips', 905);
INSERT INTO "public"."platillo" VALUES (28, 2, 2, NULL, 'Luxurious Bronze Hat', 649);
INSERT INTO "public"."platillo" VALUES (29, 2, 2, NULL, 'Elegant Wooden Keyboard', 802);
INSERT INTO "public"."platillo" VALUES (30, 2, 2, NULL, 'Unbranded Bronze Tuna', 503);
INSERT INTO "public"."platillo" VALUES (31, 2, 2, NULL, 'Handcrafted Wooden Soap', 22);
INSERT INTO "public"."platillo" VALUES (32, 2, 2, NULL, 'Intelligent Granite Chicken', 403);
INSERT INTO "public"."platillo" VALUES (33, 2, 2, NULL, 'Unbranded Soft Cheese', 980);
INSERT INTO "public"."platillo" VALUES (34, 2, 2, NULL, 'Generic Cotton Shoes', 167);
INSERT INTO "public"."platillo" VALUES (35, 2, 2, NULL, 'Electronic Concrete Chicken', 845);
INSERT INTO "public"."platillo" VALUES (36, 2, 2, NULL, 'Tasty Plastic Ball', 578);
INSERT INTO "public"."platillo" VALUES (37, 2, 2, NULL, 'Electronic Steel Bacon', 716);
INSERT INTO "public"."platillo" VALUES (38, 2, 2, NULL, 'Licensed Metal Table', 748);
INSERT INTO "public"."platillo" VALUES (39, 2, 2, NULL, 'Bespoke Plastic Fish', 304);
INSERT INTO "public"."platillo" VALUES (40, 2, 2, NULL, 'Elegant Fresh Ball', 475);
INSERT INTO "public"."platillo" VALUES (41, 3, 3, NULL, 'Recycled Soft Table', 638);
INSERT INTO "public"."platillo" VALUES (42, 3, 3, NULL, 'Fantastic Cotton Sausages', 312);
INSERT INTO "public"."platillo" VALUES (43, 3, 3, NULL, 'Elegant Rubber Shirt', 498);
INSERT INTO "public"."platillo" VALUES (44, 3, 3, NULL, 'Rustic Metal Fish', 936);
INSERT INTO "public"."platillo" VALUES (45, 3, 3, NULL, 'Bespoke Rubber Gloves', 627);
INSERT INTO "public"."platillo" VALUES (46, 3, 3, NULL, 'Intelligent Fresh Tuna', 866);
INSERT INTO "public"."platillo" VALUES (47, 3, 3, NULL, 'Generic Concrete Chips', 620);
INSERT INTO "public"."platillo" VALUES (48, 3, 3, NULL, 'Bespoke Rubber Salad', 776);
INSERT INTO "public"."platillo" VALUES (49, 3, 3, NULL, 'Refined Soft Ball', 599);
INSERT INTO "public"."platillo" VALUES (50, 3, 3, NULL, 'Electronic Frozen Tuna', 125);
INSERT INTO "public"."platillo" VALUES (51, 3, 3, NULL, 'Ergonomic Cotton Keyboard', 725);
INSERT INTO "public"."platillo" VALUES (52, 3, 3, NULL, 'Unbranded Concrete Fish', 298);
INSERT INTO "public"."platillo" VALUES (53, 3, 3, NULL, 'Small Steel Sausages', 33);
INSERT INTO "public"."platillo" VALUES (54, 3, 3, NULL, 'Licensed Concrete Salad', 285);
INSERT INTO "public"."platillo" VALUES (55, 3, 3, NULL, 'Modern Fresh Keyboard', 830);
INSERT INTO "public"."platillo" VALUES (56, 3, 3, NULL, 'Fantastic Granite Tuna', 993);
INSERT INTO "public"."platillo" VALUES (57, 3, 3, NULL, 'Fantastic Granite Towels', 607);
INSERT INTO "public"."platillo" VALUES (58, 3, 3, NULL, 'Luxurious Metal Cheese', 932);
INSERT INTO "public"."platillo" VALUES (59, 3, 3, NULL, 'Refined Cotton Ball', 307);
INSERT INTO "public"."platillo" VALUES (60, 3, 3, NULL, 'Intelligent Metal Bacon', 795);
INSERT INTO "public"."platillo" VALUES (61, 4, 4, NULL, 'Generic Concrete Table', 924);
INSERT INTO "public"."platillo" VALUES (62, 4, 4, NULL, 'Gorgeous Bronze Chips', 223);
INSERT INTO "public"."platillo" VALUES (63, 4, 4, NULL, 'Luxurious Fresh Soap', 236);
INSERT INTO "public"."platillo" VALUES (64, 4, 4, NULL, 'Unbranded Granite Chips', 849);
INSERT INTO "public"."platillo" VALUES (65, 4, 4, NULL, 'Gorgeous Fresh Pants', 774);
INSERT INTO "public"."platillo" VALUES (66, 4, 4, NULL, 'Modern Granite Mouse', 967);
INSERT INTO "public"."platillo" VALUES (67, 4, 4, NULL, 'Rustic Fresh Bacon', 765);
INSERT INTO "public"."platillo" VALUES (68, 4, 4, NULL, 'Bespoke Rubber Sausages', 774);
INSERT INTO "public"."platillo" VALUES (69, 4, 4, NULL, 'Generic Cotton Keyboard', 269);
INSERT INTO "public"."platillo" VALUES (70, 4, 4, NULL, 'Modern Frozen Salad', 872);
INSERT INTO "public"."platillo" VALUES (71, 4, 4, NULL, 'Unbranded Soft Bacon', 119);
INSERT INTO "public"."platillo" VALUES (72, 4, 4, NULL, 'Ergonomic Concrete Towels', 794);
INSERT INTO "public"."platillo" VALUES (73, 4, 4, NULL, 'Licensed Fresh Bike', 377);
INSERT INTO "public"."platillo" VALUES (74, 4, 4, NULL, 'Refined Bronze Towels', 451);
INSERT INTO "public"."platillo" VALUES (75, 4, 4, NULL, 'Handcrafted Concrete Gloves', 139);
INSERT INTO "public"."platillo" VALUES (76, 4, 4, NULL, 'Sleek Steel Pants', 766);
INSERT INTO "public"."platillo" VALUES (77, 4, 4, NULL, 'Oriental Granite Car', 768);
INSERT INTO "public"."platillo" VALUES (78, 4, 4, NULL, 'Practical Granite Cheese', 554);
INSERT INTO "public"."platillo" VALUES (79, 4, 4, NULL, 'Handcrafted Bronze Fish', 950);
INSERT INTO "public"."platillo" VALUES (80, 4, 4, NULL, 'Intelligent Steel Pants', 288);
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
INSERT INTO "public"."repartidor" VALUES (2, NULL);
INSERT INTO "public"."repartidor" VALUES (3, NULL);
INSERT INTO "public"."repartidor" VALUES (4, NULL);
INSERT INTO "public"."repartidor" VALUES (5, NULL);
INSERT INTO "public"."repartidor" VALUES (6, NULL);
INSERT INTO "public"."repartidor" VALUES (7, NULL);
INSERT INTO "public"."repartidor" VALUES (8, NULL);
INSERT INTO "public"."repartidor" VALUES (9, NULL);
INSERT INTO "public"."repartidor" VALUES (10, NULL);
INSERT INTO "public"."repartidor" VALUES (11, NULL);
INSERT INTO "public"."repartidor" VALUES (12, NULL);
INSERT INTO "public"."repartidor" VALUES (13, NULL);
INSERT INTO "public"."repartidor" VALUES (14, NULL);
INSERT INTO "public"."repartidor" VALUES (15, NULL);
INSERT INTO "public"."repartidor" VALUES (16, NULL);
INSERT INTO "public"."repartidor" VALUES (17, NULL);
INSERT INTO "public"."repartidor" VALUES (18, NULL);
INSERT INTO "public"."repartidor" VALUES (19, NULL);
INSERT INTO "public"."repartidor" VALUES (20, NULL);
INSERT INTO "public"."repartidor" VALUES (1, 128);
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
INSERT INTO "public"."resena" VALUES (1, 1, 1, 4, '2022-03-03', 'iusto eveniet voluptatem');
INSERT INTO "public"."resena" VALUES (2, 1, 2, 2, '2022-03-18', 'voluptatem labore doloremque');
INSERT INTO "public"."resena" VALUES (3, 1, 3, 2, '2022-02-14', 'recusandae atque incidunt');
INSERT INTO "public"."resena" VALUES (4, 1, 4, 2, '2021-09-06', 'et quibusdam qui');
INSERT INTO "public"."resena" VALUES (5, 1, 5, 2, '2021-12-25', 'doloremque neque voluptas');
INSERT INTO "public"."resena" VALUES (6, 1, 6, 3, '2021-12-17', 'dolore consequatur aut');
INSERT INTO "public"."resena" VALUES (7, 1, 7, 2, '2022-04-25', 'accusamus esse aut');
INSERT INTO "public"."resena" VALUES (8, 1, 8, 5, '2022-03-19', 'quia non facere');
INSERT INTO "public"."resena" VALUES (9, 1, 9, 3, '2021-09-12', 'ducimus a dolorem');
INSERT INTO "public"."resena" VALUES (10, 1, 10, 3, '2021-10-22', 'laborum libero dolor');
INSERT INTO "public"."resena" VALUES (11, 1, 11, 0, '2021-09-19', 'rem iure voluptatem');
INSERT INTO "public"."resena" VALUES (12, 1, 12, 5, '2021-07-11', 'omnis blanditiis commodi');
INSERT INTO "public"."resena" VALUES (13, 1, 13, 2, '2021-09-25', 'totam enim qui');
INSERT INTO "public"."resena" VALUES (14, 1, 14, 1, '2022-01-13', 'dolorum cupiditate quam');
INSERT INTO "public"."resena" VALUES (15, 1, 15, 1, '2022-03-25', 'perferendis ab qui');
INSERT INTO "public"."resena" VALUES (16, 1, 16, 0, '2021-07-04', 'vitae architecto voluptas');
INSERT INTO "public"."resena" VALUES (17, 1, 17, 2, '2021-07-02', 'vel et neque');
INSERT INTO "public"."resena" VALUES (18, 1, 18, 0, '2021-11-26', 'officiis iste ea');
INSERT INTO "public"."resena" VALUES (19, 1, 19, 5, '2021-10-15', 'aut minima aliquid');
INSERT INTO "public"."resena" VALUES (20, 1, 20, 5, '2021-09-27', 'rem non et');
INSERT INTO "public"."resena" VALUES (21, 1, 21, 5, '2022-05-19', 'autem incidunt qui');
INSERT INTO "public"."resena" VALUES (22, 1, 22, 2, '2022-03-12', 'libero at similique');
INSERT INTO "public"."resena" VALUES (23, 1, 23, 4, '2022-03-14', 'reiciendis rem sit');
INSERT INTO "public"."resena" VALUES (24, 1, 24, 5, '2021-10-23', 'dignissimos est quo');
INSERT INTO "public"."resena" VALUES (25, 1, 25, 2, '2021-09-05', 'ducimus nobis reprehenderit');
INSERT INTO "public"."resena" VALUES (26, 1, 26, 5, '2021-06-07', 'autem placeat ut');
INSERT INTO "public"."resena" VALUES (27, 1, 27, 3, '2021-10-18', 'nobis animi quasi');
INSERT INTO "public"."resena" VALUES (28, 1, 28, 0, '2022-05-11', 'alias ea nulla');
INSERT INTO "public"."resena" VALUES (29, 1, 29, 5, '2022-02-03', 'nesciunt ab nemo');
INSERT INTO "public"."resena" VALUES (30, 1, 30, 1, '2021-06-10', 'inventore sint autem');
INSERT INTO "public"."resena" VALUES (32, 3, 31, 0, '2021-07-09', 'dolor enim ea');
INSERT INTO "public"."resena" VALUES (33, 3, 32, 3, '2022-03-24', 'eos commodi non');
INSERT INTO "public"."resena" VALUES (34, 3, 33, 3, '2022-04-13', 'voluptatibus itaque sed');
INSERT INTO "public"."resena" VALUES (35, 3, 34, 4, '2021-07-07', 'voluptatum commodi rerum');
INSERT INTO "public"."resena" VALUES (36, 3, 35, 3, '2022-05-09', 'vitae facilis totam');
INSERT INTO "public"."resena" VALUES (37, 3, 36, 5, '2021-06-06', 'et deleniti velit');
INSERT INTO "public"."resena" VALUES (38, 3, 37, 4, '2022-04-12', 'distinctio ut eum');
INSERT INTO "public"."resena" VALUES (39, 3, 38, 5, '2021-12-18', 'cupiditate est autem');
INSERT INTO "public"."resena" VALUES (40, 3, 39, 5, '2021-08-29', 'architecto qui iure');
INSERT INTO "public"."resena" VALUES (41, 3, 40, 5, '2021-09-12', 'est quibusdam velit');
INSERT INTO "public"."resena" VALUES (42, 3, 41, 4, '2021-06-15', 'molestiae deserunt omnis');
INSERT INTO "public"."resena" VALUES (43, 3, 42, 0, '2021-12-09', 'sunt rerum dolorem');
INSERT INTO "public"."resena" VALUES (44, 3, 43, 1, '2021-10-11', 'enim et magni');
INSERT INTO "public"."resena" VALUES (45, 3, 44, 5, '2022-02-03', 'et veniam aperiam');
INSERT INTO "public"."resena" VALUES (46, 3, 45, 1, '2021-10-30', 'sunt voluptatem cum');
INSERT INTO "public"."resena" VALUES (47, 3, 46, 3, '2021-07-19', 'rem neque explicabo');
INSERT INTO "public"."resena" VALUES (48, 3, 47, 5, '2022-02-14', 'autem ut quisquam');
INSERT INTO "public"."resena" VALUES (49, 3, 48, 1, '2022-02-08', 'eius et expedita');
INSERT INTO "public"."resena" VALUES (50, 3, 49, 5, '2021-06-21', 'nisi earum ut');
INSERT INTO "public"."resena" VALUES (51, 3, 50, 5, '2021-11-23', 'qui autem ad');
INSERT INTO "public"."resena" VALUES (52, 3, 51, 5, '2022-02-11', 'accusantium numquam earum');
INSERT INTO "public"."resena" VALUES (53, 3, 52, 1, '2022-04-29', 'suscipit nisi dolorem');
INSERT INTO "public"."resena" VALUES (54, 3, 53, 4, '2021-08-16', 'culpa at dolor');
INSERT INTO "public"."resena" VALUES (55, 3, 54, 0, '2022-03-09', 'qui a provident');
INSERT INTO "public"."resena" VALUES (56, 3, 55, 0, '2022-05-03', 'cupiditate tempore et');
INSERT INTO "public"."resena" VALUES (57, 3, 56, 4, '2021-10-27', 'cupiditate repudiandae veritatis');
INSERT INTO "public"."resena" VALUES (58, 3, 57, 0, '2022-04-29', 'quaerat eum voluptatem');
INSERT INTO "public"."resena" VALUES (59, 3, 58, 3, '2021-07-27', 'officiis adipisci quia');
INSERT INTO "public"."resena" VALUES (60, 3, 59, 4, '2021-11-03', 'nemo architecto itaque');
INSERT INTO "public"."resena" VALUES (61, 3, 60, 4, '2021-11-12', 'magni iure vel');
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
INSERT INTO "public"."restaurante" VALUES (1, 'Walker and Sons', 'Vermont', 'Demario Plains', 7892, 59834, 'Bogisichside');
INSERT INTO "public"."restaurante" VALUES (2, 'Shanahan, Keebler and Cassin', 'Indiana', 'Lakin Fork', 49072, 52281, 'West Sophieport');
INSERT INTO "public"."restaurante" VALUES (3, 'Jaskolski, Cassin and Douglas', 'Connecticut', 'Katheryn Square', 13405, 40734, 'East Deannaborough');
INSERT INTO "public"."restaurante" VALUES (4, 'Anderson Inc', 'New Mexico', 'Mueller Orchard', 19673, 14967, 'Fordberg');
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
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 1, 'f', 'Mose                                                                                                ', 'Hammes                                                                                              ', 'Nader                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 2, 'f', 'Krystal                                                                                             ', 'Hermann                                                                                             ', 'Rutherford                                                                                          ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 3, 'f', 'Lonzo                                                                                               ', 'Anderson                                                                                            ', 'Weber                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 4, 'f', 'Rosemary                                                                                            ', 'Crona                                                                                               ', 'Schimmel                                                                                            ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 5, 'f', 'Bradly                                                                                              ', 'Hand                                                                                                ', 'Medhurst                                                                                            ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 6, 'f', 'Jaida                                                                                               ', 'Bechtelar                                                                                           ', 'Kshlerin                                                                                            ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 7, 'f', 'Augustine                                                                                           ', 'Corkery                                                                                             ', 'Becker                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 8, 'f', 'Sandra                                                                                              ', 'Hegmann                                                                                             ', 'Hackett                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 9, 'f', 'Randal                                                                                              ', 'Keebler                                                                                             ', 'Quigley                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 10, 'f', 'Monroe                                                                                              ', 'Rice                                                                                                ', 'O''Kon                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 11, 'f', 'Joanny                                                                                              ', 'Durgan                                                                                              ', 'Phoenix                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 12, 'f', 'Mina                                                                                                ', 'Kerluke                                                                                             ', 'Jamie                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 13, 'f', 'Miracle                                                                                             ', 'Kertzmann                                                                                           ', 'Corey                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 14, 'f', 'Queenie                                                                                             ', 'Fisher                                                                                              ', 'Micah                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 15, 'f', 'Skye                                                                                                ', 'Reilly                                                                                              ', 'Reagan                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 16, 'f', 'Willy                                                                                               ', 'Block                                                                                               ', 'Elliott                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 17, 'f', 'Burdette                                                                                            ', 'Schulist                                                                                            ', 'Hayden                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 18, 'f', 'Mae                                                                                                 ', 'McKenzie                                                                                            ', 'Rory                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 19, 'f', 'Louvenia                                                                                            ', 'Effertz                                                                                             ', 'Skyler                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 20, 'f', 'Jay                                                                                                 ', 'Feil                                                                                                ', 'Taylor                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 21, 'f', 'Arvel                                                                                               ', 'Deckow                                                                                              ', 'Taylor                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 22, 'f', 'Sheldon                                                                                             ', 'Corwin                                                                                              ', 'Finley                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 23, 'f', 'Marianna                                                                                            ', 'Block                                                                                               ', 'Anderson                                                                                            ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 24, 'f', 'Nakia                                                                                               ', 'Kirlin                                                                                              ', 'Austin                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 25, 'f', 'Mariela                                                                                             ', 'Dooley                                                                                              ', 'Billie                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 26, 'f', 'Savion                                                                                              ', 'Cummings                                                                                            ', 'Shiloh                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 27, 'f', 'Tiana                                                                                               ', 'Swift                                                                                               ', 'River                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 28, 'f', 'Yazmin                                                                                              ', 'West                                                                                                ', 'Bowie                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 29, 'f', 'Brenna                                                                                              ', 'Okuneva                                                                                             ', 'Billie                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 30, 'f', 'Jerrod                                                                                              ', 'Schmitt                                                                                             ', 'Jules                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 31, 'f', 'Joshuah                                                                                             ', 'Ledner                                                                                              ', 'Kennedy                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 32, 'f', 'Margot                                                                                              ', 'Botsford                                                                                            ', 'Sasha                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 33, 'f', 'Fabiola                                                                                             ', 'Mosciski                                                                                            ', 'Bailey                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 34, 'f', 'Holly                                                                                               ', 'Jakubowski                                                                                          ', 'Kennedy                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 35, 'f', 'Diamond                                                                                             ', 'Legros                                                                                              ', 'Phoenix                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 36, 'f', 'Favian                                                                                              ', 'Emmerich                                                                                            ', 'Sage                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 37, 'f', 'Rachel                                                                                              ', 'Mann                                                                                                ', 'Kai                                                                                                 ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 38, 'f', 'Deborah                                                                                             ', 'Greenholt                                                                                           ', 'Kennedy                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 39, 'f', 'Hayden                                                                                              ', 'Stehr                                                                                               ', 'Sawyer                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 40, 'f', 'Lavada                                                                                              ', 'Murray                                                                                              ', 'Harper                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 41, 'f', 'Delmer                                                                                              ', 'Jacobs                                                                                              ', 'Robin                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 42, 'f', 'Freeman                                                                                             ', 'Rutherford                                                                                          ', 'Robin                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 43, 'f', 'Mustafa                                                                                             ', 'Von                                                                                                 ', 'Jules                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 44, 'f', 'Ahmed                                                                                               ', 'Fritsch                                                                                             ', 'Shawn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 45, 'f', 'Serenity                                                                                            ', 'Schumm                                                                                              ', 'Shiloh                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 46, 'f', 'Adelle                                                                                              ', 'Hackett                                                                                             ', 'Alex                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 47, 'f', 'Gracie                                                                                              ', 'Weissnat                                                                                            ', 'Emerson                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 48, 'f', 'Theo                                                                                                ', 'Lebsack                                                                                             ', 'Angel                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 49, 'f', 'Willie                                                                                              ', 'Bernier                                                                                             ', 'Ellis                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 50, 'f', 'Garth                                                                                               ', 'Durgan                                                                                              ', 'Bailey                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 51, 'f', 'Maybell                                                                                             ', 'Ankunding                                                                                           ', 'North                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 52, 'f', 'Efren                                                                                               ', 'Mertz                                                                                               ', 'Hayden                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 53, 'f', 'Carleton                                                                                            ', 'Luettgen                                                                                            ', 'Arden                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 54, 'f', 'Elouise                                                                                             ', 'Dooley                                                                                              ', 'Bowie                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 55, 'f', 'Tatum                                                                                               ', 'Bogan                                                                                               ', 'Ryan                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 56, 'f', 'Giuseppe                                                                                            ', 'O''Conner                                                                                            ', 'Sawyer                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 57, 'f', 'Merl                                                                                                ', 'Towne                                                                                               ', 'Shiloh                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 58, 'f', 'Karina                                                                                              ', 'Luettgen                                                                                            ', 'Jaden                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 59, 'f', 'Ernestine                                                                                           ', 'Dietrich                                                                                            ', 'London                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 60, 'f', 'Keyshawn                                                                                            ', 'Welch                                                                                               ', 'Arden                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 61, 'f', 'Taryn                                                                                               ', 'Veum                                                                                                ', 'Sawyer                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 62, 'f', 'Lorenz                                                                                              ', 'Schinner                                                                                            ', 'Kendall                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 63, 'f', 'Baby                                                                                                ', 'Graham                                                                                              ', 'Franecki                                                                                            ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 64, 'f', 'Jerel                                                                                               ', 'Weber                                                                                               ', 'Feeney                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 65, 'f', 'Keshawn                                                                                             ', 'DuBuque                                                                                             ', 'Jerde                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 66, 'f', 'Katelin                                                                                             ', 'Grady                                                                                               ', 'Walter                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 67, 'f', 'Ulices                                                                                              ', 'Schumm                                                                                              ', 'Reynolds                                                                                            ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 68, 'f', 'Adriel                                                                                              ', 'Hartmann                                                                                            ', 'Veum                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 69, 'f', 'Alfred                                                                                              ', 'Funk                                                                                                ', 'Kovacek                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 70, 'f', 'Chanel                                                                                              ', 'Altenwerth                                                                                          ', 'Armstrong                                                                                           ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 71, 'f', 'Osvaldo                                                                                             ', 'Nolan                                                                                               ', 'Strosin                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 72, 'f', 'Lemuel                                                                                              ', 'Ward                                                                                                ', 'Auer                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 73, 'f', 'Verona                                                                                              ', 'Tillman                                                                                             ', 'Arden                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 74, 'f', 'Kennith                                                                                             ', 'Barrows                                                                                             ', 'Emerson                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 75, 'f', 'Durward                                                                                             ', 'Bogisich                                                                                            ', 'Angel                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 76, 'f', 'Trace                                                                                               ', 'Braun                                                                                               ', 'Bowie                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 77, 'f', 'Al                                                                                                  ', 'Welch                                                                                               ', 'Riley                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 78, 'f', 'Madeline                                                                                            ', 'Altenwerth                                                                                          ', 'Harper                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 79, 'f', 'Violet                                                                                              ', 'Hills                                                                                               ', 'Sawyer                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 80, 'f', 'Corbin                                                                                              ', 'Hirthe                                                                                              ', 'Reese                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 81, 'f', 'Dan                                                                                                 ', 'Price                                                                                               ', 'Hayden                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 82, 'f', 'Kiarra                                                                                              ', 'Bechtelar                                                                                           ', 'Kendall                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 83, 'f', 'Fabiola                                                                                             ', 'Mosciski                                                                                            ', 'Noah                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 84, 'f', 'Irwin                                                                                               ', 'Orn                                                                                                 ', 'James                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 85, 'f', 'Leslie                                                                                              ', 'Nader                                                                                               ', 'Ellis                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 86, 'f', 'Mellie                                                                                              ', 'Pollich                                                                                             ', 'Skyler                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 87, 'f', 'Morris                                                                                              ', 'Robel                                                                                               ', 'Dakota                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 88, 'f', 'Emmalee                                                                                             ', 'Dickens                                                                                             ', 'Finley                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 89, 'f', 'Tamia                                                                                               ', 'Heidenreich                                                                                         ', 'Greer                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 90, 'f', 'Nathaniel                                                                                           ', 'Schaefer                                                                                            ', 'Jordan                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 91, 'f', 'Daisha                                                                                              ', 'Kerluke                                                                                             ', 'Finley                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 92, 'f', 'Karlee                                                                                              ', 'Ziemann                                                                                             ', 'Charlie                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 93, 'f', 'Dayne                                                                                               ', 'Huel                                                                                                ', 'Parker                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 94, 'f', 'Jordon                                                                                              ', 'Daniel                                                                                              ', 'Rowan                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 95, 'f', 'Blanche                                                                                             ', 'Fadel                                                                                               ', 'Shawn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 96, 'f', 'Eddie                                                                                               ', 'Spencer                                                                                             ', 'Angel                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 97, 'f', 'Freddy                                                                                              ', 'Wisoky                                                                                              ', 'Emerson                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 98, 'f', 'Maurice                                                                                             ', 'Vandervort                                                                                          ', 'Charlie                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 99, 'f', 'Julius                                                                                              ', 'Krajcik                                                                                             ', 'Gray                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 100, 'f', 'Kale                                                                                                ', 'Klein                                                                                               ', 'Sawyer                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 101, 'f', 'Sylvester                                                                                           ', 'Feest                                                                                               ', 'Reese                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 102, 'f', 'Jarret                                                                                              ', 'Hills                                                                                               ', 'Dakota                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 103, 'f', 'Rosalinda                                                                                           ', 'Runolfsson                                                                                          ', 'Jules                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 104, 'f', 'Leo                                                                                                 ', 'Kuhic                                                                                               ', 'August                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 105, 'f', 'Kamron                                                                                              ', 'Herman                                                                                              ', 'Quinn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 106, 'f', 'Katharina                                                                                           ', 'Shields                                                                                             ', 'River                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 107, 'f', 'Jean                                                                                                ', 'Zulauf                                                                                              ', 'Riley                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 108, 'f', 'Ezequiel                                                                                            ', 'Kautzer                                                                                             ', 'Rowan                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 109, 'f', 'Liana                                                                                               ', 'Marks                                                                                               ', 'Brooklyn                                                                                            ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 110, 'f', 'Hiram                                                                                               ', 'Ortiz                                                                                               ', 'Charlie                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 111, 'f', 'Darrel                                                                                              ', 'Roberts                                                                                             ', 'Addison                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 112, 'f', 'Tremaine                                                                                            ', 'Hane                                                                                                ', 'Kyle                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 113, 'f', 'Dasia                                                                                               ', 'Jenkins                                                                                             ', 'Noah                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 114, 'f', 'Ruthie                                                                                              ', 'Farrell                                                                                             ', 'Parker                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 115, 'f', 'Aryanna                                                                                             ', 'Franey                                                                                              ', 'Gray                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 116, 'f', 'Shannon                                                                                             ', 'Hyatt                                                                                               ', 'Sawyer                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 117, 'f', 'Erin                                                                                                ', 'Becker                                                                                              ', 'Brooklyn                                                                                            ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 118, 'f', 'Tiana                                                                                               ', 'White                                                                                               ', 'Jordan                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 119, 'f', 'Dewayne                                                                                             ', 'Hane                                                                                                ', 'Micah                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 120, 'f', 'Watson                                                                                              ', 'Rogahn                                                                                              ', 'Leslie                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 121, 'f', 'Vivienne                                                                                            ', 'Watsica                                                                                             ', 'Kai                                                                                                 ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 122, 'f', 'Kayley                                                                                              ', 'DuBuque                                                                                             ', 'Kai                                                                                                 ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 123, 'f', 'Erwin                                                                                               ', 'Torphy                                                                                              ', 'Noah                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 124, 'f', 'Winfield                                                                                            ', 'Gaylord                                                                                             ', 'North                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES ('usuario@ciencias.unam.mx', '$2b$12$MYjPp/dyx5/pr7WMATm..uddfbdMSfyBibv50sqKn4.o3I9xk55SK', '6faece56b6b88aa6efb5f7a6e9bb8eb85805392773c643676dffc2beb667c33d4e4edaebf172763c', 'cliente', 125, 'f', 'usuario                                                                                             ', NULL, NULL, 'Ciudad de México', 'Insurgentes Sur', 3493, 14020, 'Tlalpan');
INSERT INTO "public"."usuario" VALUES ('otra@ciencias.unam.mx', '$2b$12$Wjd3wXyOHzSuH0A5l4rZ0uHLe5nfzSNvE5r2xO0AIjM21UWpLMzJy', NULL, 'cliente', 127, 'f', 'otra                                                                                                ', NULL, NULL, 'CDMX', 'Insurgentes Sur', 3493, 14020, 'tlalpan');
INSERT INTO "public"."usuario" VALUES ('canek@ciencias.unam.mx', '$2b$12$4pA6J/HnyY0KkW0INCD97.3q/htnfjSJeWKe0aF5ebfK/2L2XAH4y', '3d8de10e8a652d0e22a93c214773e35128dafafb2f8b22f250991019c36280c2a2bbf5725d3007dc', 'cliente', 126, 'f', 'Canek                                                                                               ', NULL, NULL, 'CDMX', 'Insurgentes Sur', 3493, 14020, 'N/A');
INSERT INTO "public"."usuario" VALUES ('rep@ciencias.unam.mx', '$2b$12$HwaKJ.wyCdBclqeczDTgFuL6G3JqXtAuDeqepHrFDJjr5wuzRxvoe', '51a2521fd13850a81fa5f4b553a613e520aa1fcb0ff1aec987a43548637e764be41af103c7599322', 'repartidor', 128, 'f', 'rep                                                                                                 ', NULL, NULL, 'CDMX', 'Insurgentes Sur', 3493, 14020, 'weffaw');
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."administrador_idadmin_seq"
OWNED BY "public"."administrador"."idadmin";
SELECT setval('"public"."administrador_idadmin_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cliente_idcliente_seq"
OWNED BY "public"."cliente"."idcliente";
SELECT setval('"public"."cliente_idcliente_seq"', 61, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."contenidoorden_idcontenidoorden_seq"
OWNED BY "public"."contenidoorden"."idcontenidoorden";
SELECT setval('"public"."contenidoorden_idcontenidoorden_seq"', 21, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."entregadomicilio_identregadomicilio_seq"
OWNED BY "public"."entregadomicilio"."identregadomicilio";
SELECT setval('"public"."entregadomicilio_identregadomicilio_seq"', 21, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."menu_idmenu_seq"
OWNED BY "public"."menu"."idmenu";
SELECT setval('"public"."menu_idmenu_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."mesa_idmesa_seq"
OWNED BY "public"."mesa"."idmesa";
SELECT setval('"public"."mesa_idmesa_seq"', 21, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."mesero_idmesero_seq"
OWNED BY "public"."mesero"."idmesero";
SELECT setval('"public"."mesero_idmesero_seq"', 41, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."orden_idorden_seq"
OWNED BY "public"."orden"."idorden";
SELECT setval('"public"."orden_idorden_seq"', 21, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."platillo_idplatillo_seq"
OWNED BY "public"."platillo"."idplatillo";
SELECT setval('"public"."platillo_idplatillo_seq"', 81, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."repartidor_idrepartidor_seq"
OWNED BY "public"."repartidor"."idrepartidor";
SELECT setval('"public"."repartidor_idrepartidor_seq"', 21, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."resena_idresena_seq"
OWNED BY "public"."resena"."idresena";
SELECT setval('"public"."resena_idresena_seq"', 63, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."restaurante_idrestaurante_seq"
OWNED BY "public"."restaurante"."idrestaurante";
SELECT setval('"public"."restaurante_idrestaurante_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."usuario_idusuario_seq"
OWNED BY "public"."usuario"."idusuario";
SELECT setval('"public"."usuario_idusuario_seq"', 129, true);

-- ----------------------------
-- Indexes structure for table administrador
-- ----------------------------
CREATE UNIQUE INDEX "administrador_idrestaurante_key" ON "public"."administrador" USING btree (
  "idrestaurante" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "administrador_idusuario_key" ON "public"."administrador" USING btree (
  "idusuario" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table administrador
-- ----------------------------
ALTER TABLE "public"."administrador" ADD CONSTRAINT "administrador_pkey" PRIMARY KEY ("idadmin");

-- ----------------------------
-- Indexes structure for table cliente
-- ----------------------------
CREATE UNIQUE INDEX "cliente_idusuario_key" ON "public"."cliente" USING btree (
  "idusuario" "pg_catalog"."int4_ops" ASC NULLS LAST
);

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
-- Indexes structure for table mesero
-- ----------------------------
CREATE UNIQUE INDEX "mesero_idusuario_key" ON "public"."mesero" USING btree (
  "idusuario" "pg_catalog"."int4_ops" ASC NULLS LAST
);

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
-- Indexes structure for table resena
-- ----------------------------
CREATE UNIQUE INDEX "resena_idcliente_key" ON "public"."resena" USING btree (
  "idcliente" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table resena
-- ----------------------------
ALTER TABLE "public"."resena" ADD CONSTRAINT "resena_pkey" PRIMARY KEY ("idresena");

-- ----------------------------
-- Primary Key structure for table restaurante
-- ----------------------------
ALTER TABLE "public"."restaurante" ADD CONSTRAINT "restaurante_pkey" PRIMARY KEY ("idrestaurante");

-- ----------------------------
-- Indexes structure for table usuario
-- ----------------------------
CREATE UNIQUE INDEX "usuario_email_key" ON "public"."usuario" USING btree (
  "email" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

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
