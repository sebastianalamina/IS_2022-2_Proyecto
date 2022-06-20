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

 Date: 20/06/2022 13:52:30
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
INSERT INTO "public"."administrador" VALUES (3, 3, 63);
INSERT INTO "public"."administrador" VALUES (4, 4, 74);
INSERT INTO "public"."administrador" VALUES (5, 5, 85);
INSERT INTO "public"."administrador" VALUES (6, 6, 96);
INSERT INTO "public"."administrador" VALUES (7, 7, 107);
INSERT INTO "public"."administrador" VALUES (8, 8, 118);
INSERT INTO "public"."administrador" VALUES (9, 9, 129);
INSERT INTO "public"."administrador" VALUES (10, 10, 140);
INSERT INTO "public"."administrador" VALUES (11, 11, 151);
INSERT INTO "public"."administrador" VALUES (12, 12, 162);
INSERT INTO "public"."administrador" VALUES (13, 13, 173);
INSERT INTO "public"."administrador" VALUES (14, 14, 184);
INSERT INTO "public"."administrador" VALUES (15, 15, 195);
INSERT INTO "public"."administrador" VALUES (16, 16, 206);
INSERT INTO "public"."administrador" VALUES (17, 17, 217);
INSERT INTO "public"."administrador" VALUES (18, 18, 228);
INSERT INTO "public"."administrador" VALUES (19, 19, 239);
INSERT INTO "public"."administrador" VALUES (20, 20, 250);
INSERT INTO "public"."administrador" VALUES (21, 21, 261);
INSERT INTO "public"."administrador" VALUES (22, 22, 272);
INSERT INTO "public"."administrador" VALUES (23, 23, 283);
INSERT INTO "public"."administrador" VALUES (24, 24, 294);
INSERT INTO "public"."administrador" VALUES (25, 25, 305);
INSERT INTO "public"."administrador" VALUES (26, 26, 316);
INSERT INTO "public"."administrador" VALUES (27, 27, 327);
INSERT INTO "public"."administrador" VALUES (28, 28, 338);
INSERT INTO "public"."administrador" VALUES (29, 29, 349);
INSERT INTO "public"."administrador" VALUES (30, 30, 360);
INSERT INTO "public"."administrador" VALUES (31, 31, 371);
INSERT INTO "public"."administrador" VALUES (32, NULL, 382);
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
INSERT INTO "public"."cliente" VALUES (31, 383);
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
INSERT INTO "public"."contenidoorden" VALUES (11, 11, 21);
INSERT INTO "public"."contenidoorden" VALUES (12, 12, 21);
INSERT INTO "public"."contenidoorden" VALUES (13, 13, 21);
INSERT INTO "public"."contenidoorden" VALUES (14, 14, 21);
INSERT INTO "public"."contenidoorden" VALUES (15, 15, 21);
INSERT INTO "public"."contenidoorden" VALUES (16, 16, 21);
INSERT INTO "public"."contenidoorden" VALUES (17, 17, 21);
INSERT INTO "public"."contenidoorden" VALUES (18, 18, 21);
INSERT INTO "public"."contenidoorden" VALUES (19, 19, 21);
INSERT INTO "public"."contenidoorden" VALUES (20, 20, 21);
INSERT INTO "public"."contenidoorden" VALUES (21, 21, 41);
INSERT INTO "public"."contenidoorden" VALUES (22, 22, 41);
INSERT INTO "public"."contenidoorden" VALUES (23, 23, 41);
INSERT INTO "public"."contenidoorden" VALUES (24, 24, 41);
INSERT INTO "public"."contenidoorden" VALUES (25, 25, 41);
INSERT INTO "public"."contenidoorden" VALUES (26, 26, 41);
INSERT INTO "public"."contenidoorden" VALUES (27, 27, 41);
INSERT INTO "public"."contenidoorden" VALUES (28, 28, 41);
INSERT INTO "public"."contenidoorden" VALUES (29, 29, 41);
INSERT INTO "public"."contenidoorden" VALUES (30, 30, 41);
INSERT INTO "public"."contenidoorden" VALUES (31, 31, 61);
INSERT INTO "public"."contenidoorden" VALUES (32, 32, 61);
INSERT INTO "public"."contenidoorden" VALUES (33, 33, 61);
INSERT INTO "public"."contenidoorden" VALUES (34, 34, 61);
INSERT INTO "public"."contenidoorden" VALUES (35, 35, 61);
INSERT INTO "public"."contenidoorden" VALUES (36, 36, 61);
INSERT INTO "public"."contenidoorden" VALUES (37, 37, 61);
INSERT INTO "public"."contenidoorden" VALUES (38, 38, 61);
INSERT INTO "public"."contenidoorden" VALUES (39, 39, 61);
INSERT INTO "public"."contenidoorden" VALUES (40, 40, 61);
INSERT INTO "public"."contenidoorden" VALUES (41, 41, 81);
INSERT INTO "public"."contenidoorden" VALUES (42, 42, 81);
INSERT INTO "public"."contenidoorden" VALUES (43, 43, 81);
INSERT INTO "public"."contenidoorden" VALUES (44, 44, 81);
INSERT INTO "public"."contenidoorden" VALUES (45, 45, 81);
INSERT INTO "public"."contenidoorden" VALUES (46, 46, 81);
INSERT INTO "public"."contenidoorden" VALUES (47, 47, 81);
INSERT INTO "public"."contenidoorden" VALUES (48, 48, 81);
INSERT INTO "public"."contenidoorden" VALUES (49, 49, 81);
INSERT INTO "public"."contenidoorden" VALUES (50, 50, 81);
INSERT INTO "public"."contenidoorden" VALUES (51, 51, 101);
INSERT INTO "public"."contenidoorden" VALUES (52, 52, 101);
INSERT INTO "public"."contenidoorden" VALUES (53, 53, 101);
INSERT INTO "public"."contenidoorden" VALUES (54, 54, 101);
INSERT INTO "public"."contenidoorden" VALUES (55, 55, 101);
INSERT INTO "public"."contenidoorden" VALUES (56, 56, 101);
INSERT INTO "public"."contenidoorden" VALUES (57, 57, 101);
INSERT INTO "public"."contenidoorden" VALUES (58, 58, 101);
INSERT INTO "public"."contenidoorden" VALUES (59, 59, 101);
INSERT INTO "public"."contenidoorden" VALUES (60, 60, 101);
INSERT INTO "public"."contenidoorden" VALUES (61, 61, 121);
INSERT INTO "public"."contenidoorden" VALUES (62, 62, 121);
INSERT INTO "public"."contenidoorden" VALUES (63, 63, 121);
INSERT INTO "public"."contenidoorden" VALUES (64, 64, 121);
INSERT INTO "public"."contenidoorden" VALUES (65, 65, 121);
INSERT INTO "public"."contenidoorden" VALUES (66, 66, 121);
INSERT INTO "public"."contenidoorden" VALUES (67, 67, 121);
INSERT INTO "public"."contenidoorden" VALUES (68, 68, 121);
INSERT INTO "public"."contenidoorden" VALUES (69, 69, 121);
INSERT INTO "public"."contenidoorden" VALUES (70, 70, 121);
INSERT INTO "public"."contenidoorden" VALUES (71, 71, 141);
INSERT INTO "public"."contenidoorden" VALUES (72, 72, 141);
INSERT INTO "public"."contenidoorden" VALUES (73, 73, 141);
INSERT INTO "public"."contenidoorden" VALUES (74, 74, 141);
INSERT INTO "public"."contenidoorden" VALUES (75, 75, 141);
INSERT INTO "public"."contenidoorden" VALUES (76, 76, 141);
INSERT INTO "public"."contenidoorden" VALUES (77, 77, 141);
INSERT INTO "public"."contenidoorden" VALUES (78, 78, 141);
INSERT INTO "public"."contenidoorden" VALUES (79, 79, 141);
INSERT INTO "public"."contenidoorden" VALUES (80, 80, 141);
INSERT INTO "public"."contenidoorden" VALUES (81, 81, 161);
INSERT INTO "public"."contenidoorden" VALUES (82, 82, 161);
INSERT INTO "public"."contenidoorden" VALUES (83, 83, 161);
INSERT INTO "public"."contenidoorden" VALUES (84, 84, 161);
INSERT INTO "public"."contenidoorden" VALUES (85, 85, 161);
INSERT INTO "public"."contenidoorden" VALUES (86, 86, 161);
INSERT INTO "public"."contenidoorden" VALUES (87, 87, 161);
INSERT INTO "public"."contenidoorden" VALUES (88, 88, 161);
INSERT INTO "public"."contenidoorden" VALUES (89, 89, 161);
INSERT INTO "public"."contenidoorden" VALUES (90, 90, 161);
INSERT INTO "public"."contenidoorden" VALUES (91, 91, 181);
INSERT INTO "public"."contenidoorden" VALUES (92, 92, 181);
INSERT INTO "public"."contenidoorden" VALUES (93, 93, 181);
INSERT INTO "public"."contenidoorden" VALUES (94, 94, 181);
INSERT INTO "public"."contenidoorden" VALUES (95, 95, 181);
INSERT INTO "public"."contenidoorden" VALUES (96, 96, 181);
INSERT INTO "public"."contenidoorden" VALUES (97, 97, 181);
INSERT INTO "public"."contenidoorden" VALUES (98, 98, 181);
INSERT INTO "public"."contenidoorden" VALUES (99, 99, 181);
INSERT INTO "public"."contenidoorden" VALUES (100, 100, 181);
INSERT INTO "public"."contenidoorden" VALUES (101, 101, 201);
INSERT INTO "public"."contenidoorden" VALUES (102, 102, 201);
INSERT INTO "public"."contenidoorden" VALUES (103, 103, 201);
INSERT INTO "public"."contenidoorden" VALUES (104, 104, 201);
INSERT INTO "public"."contenidoorden" VALUES (105, 105, 201);
INSERT INTO "public"."contenidoorden" VALUES (106, 106, 201);
INSERT INTO "public"."contenidoorden" VALUES (107, 107, 201);
INSERT INTO "public"."contenidoorden" VALUES (108, 108, 201);
INSERT INTO "public"."contenidoorden" VALUES (109, 109, 201);
INSERT INTO "public"."contenidoorden" VALUES (110, 110, 201);
INSERT INTO "public"."contenidoorden" VALUES (111, 111, 221);
INSERT INTO "public"."contenidoorden" VALUES (112, 112, 221);
INSERT INTO "public"."contenidoorden" VALUES (113, 113, 221);
INSERT INTO "public"."contenidoorden" VALUES (114, 114, 221);
INSERT INTO "public"."contenidoorden" VALUES (115, 115, 221);
INSERT INTO "public"."contenidoorden" VALUES (116, 116, 221);
INSERT INTO "public"."contenidoorden" VALUES (117, 117, 221);
INSERT INTO "public"."contenidoorden" VALUES (118, 118, 221);
INSERT INTO "public"."contenidoorden" VALUES (119, 119, 221);
INSERT INTO "public"."contenidoorden" VALUES (120, 120, 221);
INSERT INTO "public"."contenidoorden" VALUES (121, 121, 241);
INSERT INTO "public"."contenidoorden" VALUES (122, 122, 241);
INSERT INTO "public"."contenidoorden" VALUES (123, 123, 241);
INSERT INTO "public"."contenidoorden" VALUES (124, 124, 241);
INSERT INTO "public"."contenidoorden" VALUES (125, 125, 241);
INSERT INTO "public"."contenidoorden" VALUES (126, 126, 241);
INSERT INTO "public"."contenidoorden" VALUES (127, 127, 241);
INSERT INTO "public"."contenidoorden" VALUES (128, 128, 241);
INSERT INTO "public"."contenidoorden" VALUES (129, 129, 241);
INSERT INTO "public"."contenidoorden" VALUES (130, 130, 241);
INSERT INTO "public"."contenidoorden" VALUES (131, 131, 261);
INSERT INTO "public"."contenidoorden" VALUES (132, 132, 261);
INSERT INTO "public"."contenidoorden" VALUES (133, 133, 261);
INSERT INTO "public"."contenidoorden" VALUES (134, 134, 261);
INSERT INTO "public"."contenidoorden" VALUES (135, 135, 261);
INSERT INTO "public"."contenidoorden" VALUES (136, 136, 261);
INSERT INTO "public"."contenidoorden" VALUES (137, 137, 261);
INSERT INTO "public"."contenidoorden" VALUES (138, 138, 261);
INSERT INTO "public"."contenidoorden" VALUES (139, 139, 261);
INSERT INTO "public"."contenidoorden" VALUES (140, 140, 261);
INSERT INTO "public"."contenidoorden" VALUES (141, 141, 281);
INSERT INTO "public"."contenidoorden" VALUES (142, 142, 281);
INSERT INTO "public"."contenidoorden" VALUES (143, 143, 281);
INSERT INTO "public"."contenidoorden" VALUES (144, 144, 281);
INSERT INTO "public"."contenidoorden" VALUES (145, 145, 281);
INSERT INTO "public"."contenidoorden" VALUES (146, 146, 281);
INSERT INTO "public"."contenidoorden" VALUES (147, 147, 281);
INSERT INTO "public"."contenidoorden" VALUES (148, 148, 281);
INSERT INTO "public"."contenidoorden" VALUES (149, 149, 281);
INSERT INTO "public"."contenidoorden" VALUES (150, 150, 281);
INSERT INTO "public"."contenidoorden" VALUES (151, 151, 301);
INSERT INTO "public"."contenidoorden" VALUES (152, 152, 301);
INSERT INTO "public"."contenidoorden" VALUES (153, 153, 301);
INSERT INTO "public"."contenidoorden" VALUES (154, 154, 301);
INSERT INTO "public"."contenidoorden" VALUES (155, 155, 301);
INSERT INTO "public"."contenidoorden" VALUES (156, 156, 301);
INSERT INTO "public"."contenidoorden" VALUES (157, 157, 301);
INSERT INTO "public"."contenidoorden" VALUES (158, 158, 301);
INSERT INTO "public"."contenidoorden" VALUES (159, 159, 301);
INSERT INTO "public"."contenidoorden" VALUES (160, 160, 301);
INSERT INTO "public"."contenidoorden" VALUES (161, 161, 321);
INSERT INTO "public"."contenidoorden" VALUES (162, 162, 321);
INSERT INTO "public"."contenidoorden" VALUES (163, 163, 321);
INSERT INTO "public"."contenidoorden" VALUES (164, 164, 321);
INSERT INTO "public"."contenidoorden" VALUES (165, 165, 321);
INSERT INTO "public"."contenidoorden" VALUES (166, 166, 321);
INSERT INTO "public"."contenidoorden" VALUES (167, 167, 321);
INSERT INTO "public"."contenidoorden" VALUES (168, 168, 321);
INSERT INTO "public"."contenidoorden" VALUES (169, 169, 321);
INSERT INTO "public"."contenidoorden" VALUES (170, 170, 321);
INSERT INTO "public"."contenidoorden" VALUES (171, 171, 341);
INSERT INTO "public"."contenidoorden" VALUES (172, 172, 341);
INSERT INTO "public"."contenidoorden" VALUES (173, 173, 341);
INSERT INTO "public"."contenidoorden" VALUES (174, 174, 341);
INSERT INTO "public"."contenidoorden" VALUES (175, 175, 341);
INSERT INTO "public"."contenidoorden" VALUES (176, 176, 341);
INSERT INTO "public"."contenidoorden" VALUES (177, 177, 341);
INSERT INTO "public"."contenidoorden" VALUES (178, 178, 341);
INSERT INTO "public"."contenidoorden" VALUES (179, 179, 341);
INSERT INTO "public"."contenidoorden" VALUES (180, 180, 341);
INSERT INTO "public"."contenidoorden" VALUES (181, 181, 361);
INSERT INTO "public"."contenidoorden" VALUES (182, 182, 361);
INSERT INTO "public"."contenidoorden" VALUES (183, 183, 361);
INSERT INTO "public"."contenidoorden" VALUES (184, 184, 361);
INSERT INTO "public"."contenidoorden" VALUES (185, 185, 361);
INSERT INTO "public"."contenidoorden" VALUES (186, 186, 361);
INSERT INTO "public"."contenidoorden" VALUES (187, 187, 361);
INSERT INTO "public"."contenidoorden" VALUES (188, 188, 361);
INSERT INTO "public"."contenidoorden" VALUES (189, 189, 361);
INSERT INTO "public"."contenidoorden" VALUES (190, 190, 361);
INSERT INTO "public"."contenidoorden" VALUES (191, 191, 381);
INSERT INTO "public"."contenidoorden" VALUES (192, 192, 381);
INSERT INTO "public"."contenidoorden" VALUES (193, 193, 381);
INSERT INTO "public"."contenidoorden" VALUES (194, 194, 381);
INSERT INTO "public"."contenidoorden" VALUES (195, 195, 381);
INSERT INTO "public"."contenidoorden" VALUES (196, 196, 381);
INSERT INTO "public"."contenidoorden" VALUES (197, 197, 381);
INSERT INTO "public"."contenidoorden" VALUES (198, 198, 381);
INSERT INTO "public"."contenidoorden" VALUES (199, 199, 381);
INSERT INTO "public"."contenidoorden" VALUES (200, 200, 381);
INSERT INTO "public"."contenidoorden" VALUES (201, 201, 401);
INSERT INTO "public"."contenidoorden" VALUES (202, 202, 401);
INSERT INTO "public"."contenidoorden" VALUES (203, 203, 401);
INSERT INTO "public"."contenidoorden" VALUES (204, 204, 401);
INSERT INTO "public"."contenidoorden" VALUES (205, 205, 401);
INSERT INTO "public"."contenidoorden" VALUES (206, 206, 401);
INSERT INTO "public"."contenidoorden" VALUES (207, 207, 401);
INSERT INTO "public"."contenidoorden" VALUES (208, 208, 401);
INSERT INTO "public"."contenidoorden" VALUES (209, 209, 401);
INSERT INTO "public"."contenidoorden" VALUES (210, 210, 401);
INSERT INTO "public"."contenidoorden" VALUES (211, 211, 421);
INSERT INTO "public"."contenidoorden" VALUES (212, 212, 421);
INSERT INTO "public"."contenidoorden" VALUES (213, 213, 421);
INSERT INTO "public"."contenidoorden" VALUES (214, 214, 421);
INSERT INTO "public"."contenidoorden" VALUES (215, 215, 421);
INSERT INTO "public"."contenidoorden" VALUES (216, 216, 421);
INSERT INTO "public"."contenidoorden" VALUES (217, 217, 421);
INSERT INTO "public"."contenidoorden" VALUES (218, 218, 421);
INSERT INTO "public"."contenidoorden" VALUES (219, 219, 421);
INSERT INTO "public"."contenidoorden" VALUES (220, 220, 421);
INSERT INTO "public"."contenidoorden" VALUES (221, 221, 441);
INSERT INTO "public"."contenidoorden" VALUES (222, 222, 441);
INSERT INTO "public"."contenidoorden" VALUES (223, 223, 441);
INSERT INTO "public"."contenidoorden" VALUES (224, 224, 441);
INSERT INTO "public"."contenidoorden" VALUES (225, 225, 441);
INSERT INTO "public"."contenidoorden" VALUES (226, 226, 441);
INSERT INTO "public"."contenidoorden" VALUES (227, 227, 441);
INSERT INTO "public"."contenidoorden" VALUES (228, 228, 441);
INSERT INTO "public"."contenidoorden" VALUES (229, 229, 441);
INSERT INTO "public"."contenidoorden" VALUES (230, 230, 441);
INSERT INTO "public"."contenidoorden" VALUES (231, 231, 461);
INSERT INTO "public"."contenidoorden" VALUES (232, 232, 461);
INSERT INTO "public"."contenidoorden" VALUES (233, 233, 461);
INSERT INTO "public"."contenidoorden" VALUES (234, 234, 461);
INSERT INTO "public"."contenidoorden" VALUES (235, 235, 461);
INSERT INTO "public"."contenidoorden" VALUES (236, 236, 461);
INSERT INTO "public"."contenidoorden" VALUES (237, 237, 461);
INSERT INTO "public"."contenidoorden" VALUES (238, 238, 461);
INSERT INTO "public"."contenidoorden" VALUES (239, 239, 461);
INSERT INTO "public"."contenidoorden" VALUES (240, 240, 461);
INSERT INTO "public"."contenidoorden" VALUES (241, 241, 481);
INSERT INTO "public"."contenidoorden" VALUES (242, 242, 481);
INSERT INTO "public"."contenidoorden" VALUES (243, 243, 481);
INSERT INTO "public"."contenidoorden" VALUES (244, 244, 481);
INSERT INTO "public"."contenidoorden" VALUES (245, 245, 481);
INSERT INTO "public"."contenidoorden" VALUES (246, 246, 481);
INSERT INTO "public"."contenidoorden" VALUES (247, 247, 481);
INSERT INTO "public"."contenidoorden" VALUES (248, 248, 481);
INSERT INTO "public"."contenidoorden" VALUES (249, 249, 481);
INSERT INTO "public"."contenidoorden" VALUES (250, 250, 481);
INSERT INTO "public"."contenidoorden" VALUES (251, 251, 501);
INSERT INTO "public"."contenidoorden" VALUES (252, 252, 501);
INSERT INTO "public"."contenidoorden" VALUES (253, 253, 501);
INSERT INTO "public"."contenidoorden" VALUES (254, 254, 501);
INSERT INTO "public"."contenidoorden" VALUES (255, 255, 501);
INSERT INTO "public"."contenidoorden" VALUES (256, 256, 501);
INSERT INTO "public"."contenidoorden" VALUES (257, 257, 501);
INSERT INTO "public"."contenidoorden" VALUES (258, 258, 501);
INSERT INTO "public"."contenidoorden" VALUES (259, 259, 501);
INSERT INTO "public"."contenidoorden" VALUES (260, 260, 501);
INSERT INTO "public"."contenidoorden" VALUES (261, 261, 521);
INSERT INTO "public"."contenidoorden" VALUES (262, 262, 521);
INSERT INTO "public"."contenidoorden" VALUES (263, 263, 521);
INSERT INTO "public"."contenidoorden" VALUES (264, 264, 521);
INSERT INTO "public"."contenidoorden" VALUES (265, 265, 521);
INSERT INTO "public"."contenidoorden" VALUES (266, 266, 521);
INSERT INTO "public"."contenidoorden" VALUES (267, 267, 521);
INSERT INTO "public"."contenidoorden" VALUES (268, 268, 521);
INSERT INTO "public"."contenidoorden" VALUES (269, 269, 521);
INSERT INTO "public"."contenidoorden" VALUES (270, 270, 521);
INSERT INTO "public"."contenidoorden" VALUES (271, 271, 541);
INSERT INTO "public"."contenidoorden" VALUES (272, 272, 541);
INSERT INTO "public"."contenidoorden" VALUES (273, 273, 541);
INSERT INTO "public"."contenidoorden" VALUES (274, 274, 541);
INSERT INTO "public"."contenidoorden" VALUES (275, 275, 541);
INSERT INTO "public"."contenidoorden" VALUES (276, 276, 541);
INSERT INTO "public"."contenidoorden" VALUES (277, 277, 541);
INSERT INTO "public"."contenidoorden" VALUES (278, 278, 541);
INSERT INTO "public"."contenidoorden" VALUES (279, 279, 541);
INSERT INTO "public"."contenidoorden" VALUES (280, 280, 541);
INSERT INTO "public"."contenidoorden" VALUES (281, 281, 561);
INSERT INTO "public"."contenidoorden" VALUES (282, 282, 561);
INSERT INTO "public"."contenidoorden" VALUES (283, 283, 561);
INSERT INTO "public"."contenidoorden" VALUES (284, 284, 561);
INSERT INTO "public"."contenidoorden" VALUES (285, 285, 561);
INSERT INTO "public"."contenidoorden" VALUES (286, 286, 561);
INSERT INTO "public"."contenidoorden" VALUES (287, 287, 561);
INSERT INTO "public"."contenidoorden" VALUES (288, 288, 561);
INSERT INTO "public"."contenidoorden" VALUES (289, 289, 561);
INSERT INTO "public"."contenidoorden" VALUES (290, 290, 561);
INSERT INTO "public"."contenidoorden" VALUES (291, 291, 581);
INSERT INTO "public"."contenidoorden" VALUES (292, 292, 581);
INSERT INTO "public"."contenidoorden" VALUES (293, 293, 581);
INSERT INTO "public"."contenidoorden" VALUES (294, 294, 581);
INSERT INTO "public"."contenidoorden" VALUES (295, 295, 581);
INSERT INTO "public"."contenidoorden" VALUES (296, 296, 581);
INSERT INTO "public"."contenidoorden" VALUES (297, 297, 581);
INSERT INTO "public"."contenidoorden" VALUES (298, 298, 581);
INSERT INTO "public"."contenidoorden" VALUES (299, 299, 581);
INSERT INTO "public"."contenidoorden" VALUES (300, 300, 581);
INSERT INTO "public"."contenidoorden" VALUES (301, 301, 601);
INSERT INTO "public"."contenidoorden" VALUES (302, 302, 601);
INSERT INTO "public"."contenidoorden" VALUES (303, 303, 601);
INSERT INTO "public"."contenidoorden" VALUES (304, 304, 601);
INSERT INTO "public"."contenidoorden" VALUES (305, 305, 601);
INSERT INTO "public"."contenidoorden" VALUES (306, 306, 601);
INSERT INTO "public"."contenidoorden" VALUES (307, 307, 601);
INSERT INTO "public"."contenidoorden" VALUES (308, 308, 601);
INSERT INTO "public"."contenidoorden" VALUES (309, 309, 601);
INSERT INTO "public"."contenidoorden" VALUES (310, 310, 601);
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
INSERT INTO "public"."entregadomicilio" VALUES (6, 1, 11);
INSERT INTO "public"."entregadomicilio" VALUES (7, 2, 12);
INSERT INTO "public"."entregadomicilio" VALUES (8, 3, 13);
INSERT INTO "public"."entregadomicilio" VALUES (9, 4, 14);
INSERT INTO "public"."entregadomicilio" VALUES (10, 5, 15);
INSERT INTO "public"."entregadomicilio" VALUES (11, 1, 21);
INSERT INTO "public"."entregadomicilio" VALUES (12, 2, 22);
INSERT INTO "public"."entregadomicilio" VALUES (13, 3, 23);
INSERT INTO "public"."entregadomicilio" VALUES (14, 4, 24);
INSERT INTO "public"."entregadomicilio" VALUES (15, 5, 25);
INSERT INTO "public"."entregadomicilio" VALUES (16, 1, 31);
INSERT INTO "public"."entregadomicilio" VALUES (17, 2, 32);
INSERT INTO "public"."entregadomicilio" VALUES (18, 3, 33);
INSERT INTO "public"."entregadomicilio" VALUES (19, 4, 34);
INSERT INTO "public"."entregadomicilio" VALUES (20, 5, 35);
INSERT INTO "public"."entregadomicilio" VALUES (21, 1, 41);
INSERT INTO "public"."entregadomicilio" VALUES (22, 2, 42);
INSERT INTO "public"."entregadomicilio" VALUES (23, 3, 43);
INSERT INTO "public"."entregadomicilio" VALUES (24, 4, 44);
INSERT INTO "public"."entregadomicilio" VALUES (25, 5, 45);
INSERT INTO "public"."entregadomicilio" VALUES (26, 1, 51);
INSERT INTO "public"."entregadomicilio" VALUES (27, 2, 52);
INSERT INTO "public"."entregadomicilio" VALUES (28, 3, 53);
INSERT INTO "public"."entregadomicilio" VALUES (29, 4, 54);
INSERT INTO "public"."entregadomicilio" VALUES (30, 5, 55);
INSERT INTO "public"."entregadomicilio" VALUES (31, 1, 61);
INSERT INTO "public"."entregadomicilio" VALUES (32, 2, 62);
INSERT INTO "public"."entregadomicilio" VALUES (33, 3, 63);
INSERT INTO "public"."entregadomicilio" VALUES (34, 4, 64);
INSERT INTO "public"."entregadomicilio" VALUES (35, 5, 65);
INSERT INTO "public"."entregadomicilio" VALUES (36, 1, 71);
INSERT INTO "public"."entregadomicilio" VALUES (37, 2, 72);
INSERT INTO "public"."entregadomicilio" VALUES (38, 3, 73);
INSERT INTO "public"."entregadomicilio" VALUES (39, 4, 74);
INSERT INTO "public"."entregadomicilio" VALUES (40, 5, 75);
INSERT INTO "public"."entregadomicilio" VALUES (41, 1, 81);
INSERT INTO "public"."entregadomicilio" VALUES (42, 2, 82);
INSERT INTO "public"."entregadomicilio" VALUES (43, 3, 83);
INSERT INTO "public"."entregadomicilio" VALUES (44, 4, 84);
INSERT INTO "public"."entregadomicilio" VALUES (45, 5, 85);
INSERT INTO "public"."entregadomicilio" VALUES (46, 1, 91);
INSERT INTO "public"."entregadomicilio" VALUES (47, 2, 92);
INSERT INTO "public"."entregadomicilio" VALUES (48, 3, 93);
INSERT INTO "public"."entregadomicilio" VALUES (49, 4, 94);
INSERT INTO "public"."entregadomicilio" VALUES (50, 5, 95);
INSERT INTO "public"."entregadomicilio" VALUES (51, 1, 101);
INSERT INTO "public"."entregadomicilio" VALUES (52, 2, 102);
INSERT INTO "public"."entregadomicilio" VALUES (53, 3, 103);
INSERT INTO "public"."entregadomicilio" VALUES (54, 4, 104);
INSERT INTO "public"."entregadomicilio" VALUES (55, 5, 105);
INSERT INTO "public"."entregadomicilio" VALUES (56, 1, 111);
INSERT INTO "public"."entregadomicilio" VALUES (57, 2, 112);
INSERT INTO "public"."entregadomicilio" VALUES (58, 3, 113);
INSERT INTO "public"."entregadomicilio" VALUES (59, 4, 114);
INSERT INTO "public"."entregadomicilio" VALUES (60, 5, 115);
INSERT INTO "public"."entregadomicilio" VALUES (61, 1, 121);
INSERT INTO "public"."entregadomicilio" VALUES (62, 2, 122);
INSERT INTO "public"."entregadomicilio" VALUES (63, 3, 123);
INSERT INTO "public"."entregadomicilio" VALUES (64, 4, 124);
INSERT INTO "public"."entregadomicilio" VALUES (65, 5, 125);
INSERT INTO "public"."entregadomicilio" VALUES (66, 1, 131);
INSERT INTO "public"."entregadomicilio" VALUES (67, 2, 132);
INSERT INTO "public"."entregadomicilio" VALUES (68, 3, 133);
INSERT INTO "public"."entregadomicilio" VALUES (69, 4, 134);
INSERT INTO "public"."entregadomicilio" VALUES (70, 5, 135);
INSERT INTO "public"."entregadomicilio" VALUES (71, 1, 141);
INSERT INTO "public"."entregadomicilio" VALUES (72, 2, 142);
INSERT INTO "public"."entregadomicilio" VALUES (73, 3, 143);
INSERT INTO "public"."entregadomicilio" VALUES (74, 4, 144);
INSERT INTO "public"."entregadomicilio" VALUES (75, 5, 145);
INSERT INTO "public"."entregadomicilio" VALUES (76, 1, 151);
INSERT INTO "public"."entregadomicilio" VALUES (77, 2, 152);
INSERT INTO "public"."entregadomicilio" VALUES (78, 3, 153);
INSERT INTO "public"."entregadomicilio" VALUES (79, 4, 154);
INSERT INTO "public"."entregadomicilio" VALUES (80, 5, 155);
INSERT INTO "public"."entregadomicilio" VALUES (81, 1, 161);
INSERT INTO "public"."entregadomicilio" VALUES (82, 2, 162);
INSERT INTO "public"."entregadomicilio" VALUES (83, 3, 163);
INSERT INTO "public"."entregadomicilio" VALUES (84, 4, 164);
INSERT INTO "public"."entregadomicilio" VALUES (85, 5, 165);
INSERT INTO "public"."entregadomicilio" VALUES (86, 1, 171);
INSERT INTO "public"."entregadomicilio" VALUES (87, 2, 172);
INSERT INTO "public"."entregadomicilio" VALUES (88, 3, 173);
INSERT INTO "public"."entregadomicilio" VALUES (89, 4, 174);
INSERT INTO "public"."entregadomicilio" VALUES (90, 5, 175);
INSERT INTO "public"."entregadomicilio" VALUES (91, 1, 181);
INSERT INTO "public"."entregadomicilio" VALUES (92, 2, 182);
INSERT INTO "public"."entregadomicilio" VALUES (93, 3, 183);
INSERT INTO "public"."entregadomicilio" VALUES (94, 4, 184);
INSERT INTO "public"."entregadomicilio" VALUES (95, 5, 185);
INSERT INTO "public"."entregadomicilio" VALUES (96, 1, 191);
INSERT INTO "public"."entregadomicilio" VALUES (97, 2, 192);
INSERT INTO "public"."entregadomicilio" VALUES (98, 3, 193);
INSERT INTO "public"."entregadomicilio" VALUES (99, 4, 194);
INSERT INTO "public"."entregadomicilio" VALUES (100, 5, 195);
INSERT INTO "public"."entregadomicilio" VALUES (101, 1, 201);
INSERT INTO "public"."entregadomicilio" VALUES (102, 2, 202);
INSERT INTO "public"."entregadomicilio" VALUES (103, 3, 203);
INSERT INTO "public"."entregadomicilio" VALUES (104, 4, 204);
INSERT INTO "public"."entregadomicilio" VALUES (105, 5, 205);
INSERT INTO "public"."entregadomicilio" VALUES (106, 1, 211);
INSERT INTO "public"."entregadomicilio" VALUES (107, 2, 212);
INSERT INTO "public"."entregadomicilio" VALUES (108, 3, 213);
INSERT INTO "public"."entregadomicilio" VALUES (109, 4, 214);
INSERT INTO "public"."entregadomicilio" VALUES (110, 5, 215);
INSERT INTO "public"."entregadomicilio" VALUES (111, 1, 221);
INSERT INTO "public"."entregadomicilio" VALUES (112, 2, 222);
INSERT INTO "public"."entregadomicilio" VALUES (113, 3, 223);
INSERT INTO "public"."entregadomicilio" VALUES (114, 4, 224);
INSERT INTO "public"."entregadomicilio" VALUES (115, 5, 225);
INSERT INTO "public"."entregadomicilio" VALUES (116, 1, 231);
INSERT INTO "public"."entregadomicilio" VALUES (117, 2, 232);
INSERT INTO "public"."entregadomicilio" VALUES (118, 3, 233);
INSERT INTO "public"."entregadomicilio" VALUES (119, 4, 234);
INSERT INTO "public"."entregadomicilio" VALUES (120, 5, 235);
INSERT INTO "public"."entregadomicilio" VALUES (121, 1, 241);
INSERT INTO "public"."entregadomicilio" VALUES (122, 2, 242);
INSERT INTO "public"."entregadomicilio" VALUES (123, 3, 243);
INSERT INTO "public"."entregadomicilio" VALUES (124, 4, 244);
INSERT INTO "public"."entregadomicilio" VALUES (125, 5, 245);
INSERT INTO "public"."entregadomicilio" VALUES (126, 1, 251);
INSERT INTO "public"."entregadomicilio" VALUES (127, 2, 252);
INSERT INTO "public"."entregadomicilio" VALUES (128, 3, 253);
INSERT INTO "public"."entregadomicilio" VALUES (129, 4, 254);
INSERT INTO "public"."entregadomicilio" VALUES (130, 5, 255);
INSERT INTO "public"."entregadomicilio" VALUES (131, 1, 261);
INSERT INTO "public"."entregadomicilio" VALUES (132, 2, 262);
INSERT INTO "public"."entregadomicilio" VALUES (133, 3, 263);
INSERT INTO "public"."entregadomicilio" VALUES (134, 4, 264);
INSERT INTO "public"."entregadomicilio" VALUES (135, 5, 265);
INSERT INTO "public"."entregadomicilio" VALUES (136, 1, 271);
INSERT INTO "public"."entregadomicilio" VALUES (137, 2, 272);
INSERT INTO "public"."entregadomicilio" VALUES (138, 3, 273);
INSERT INTO "public"."entregadomicilio" VALUES (139, 4, 274);
INSERT INTO "public"."entregadomicilio" VALUES (140, 5, 275);
INSERT INTO "public"."entregadomicilio" VALUES (141, 1, 281);
INSERT INTO "public"."entregadomicilio" VALUES (142, 2, 282);
INSERT INTO "public"."entregadomicilio" VALUES (143, 3, 283);
INSERT INTO "public"."entregadomicilio" VALUES (144, 4, 284);
INSERT INTO "public"."entregadomicilio" VALUES (145, 5, 285);
INSERT INTO "public"."entregadomicilio" VALUES (146, 1, 291);
INSERT INTO "public"."entregadomicilio" VALUES (147, 2, 292);
INSERT INTO "public"."entregadomicilio" VALUES (148, 3, 293);
INSERT INTO "public"."entregadomicilio" VALUES (149, 4, 294);
INSERT INTO "public"."entregadomicilio" VALUES (150, 5, 295);
INSERT INTO "public"."entregadomicilio" VALUES (151, 1, 301);
INSERT INTO "public"."entregadomicilio" VALUES (152, 2, 302);
INSERT INTO "public"."entregadomicilio" VALUES (153, 3, 303);
INSERT INTO "public"."entregadomicilio" VALUES (154, 4, 304);
INSERT INTO "public"."entregadomicilio" VALUES (155, 5, 305);
INSERT INTO "public"."entregadomicilio" VALUES (156, 11, 158);
INSERT INTO "public"."entregadomicilio" VALUES (157, 11, 157);
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
INSERT INTO "public"."menu" VALUES (5, 5);
INSERT INTO "public"."menu" VALUES (6, 6);
INSERT INTO "public"."menu" VALUES (7, 7);
INSERT INTO "public"."menu" VALUES (8, 8);
INSERT INTO "public"."menu" VALUES (9, 9);
INSERT INTO "public"."menu" VALUES (10, 10);
INSERT INTO "public"."menu" VALUES (11, 11);
INSERT INTO "public"."menu" VALUES (12, 12);
INSERT INTO "public"."menu" VALUES (13, 13);
INSERT INTO "public"."menu" VALUES (14, 14);
INSERT INTO "public"."menu" VALUES (15, 15);
INSERT INTO "public"."menu" VALUES (16, 16);
INSERT INTO "public"."menu" VALUES (17, 17);
INSERT INTO "public"."menu" VALUES (18, 18);
INSERT INTO "public"."menu" VALUES (19, 19);
INSERT INTO "public"."menu" VALUES (20, 20);
INSERT INTO "public"."menu" VALUES (21, 21);
INSERT INTO "public"."menu" VALUES (22, 22);
INSERT INTO "public"."menu" VALUES (23, 23);
INSERT INTO "public"."menu" VALUES (24, 24);
INSERT INTO "public"."menu" VALUES (25, 25);
INSERT INTO "public"."menu" VALUES (26, 26);
INSERT INTO "public"."menu" VALUES (27, 27);
INSERT INTO "public"."menu" VALUES (28, 28);
INSERT INTO "public"."menu" VALUES (29, 29);
INSERT INTO "public"."menu" VALUES (30, 30);
INSERT INTO "public"."menu" VALUES (31, 31);
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
INSERT INTO "public"."mesa" VALUES (11, 2, 't');
INSERT INTO "public"."mesa" VALUES (12, 2, 't');
INSERT INTO "public"."mesa" VALUES (13, 2, 't');
INSERT INTO "public"."mesa" VALUES (14, 2, 't');
INSERT INTO "public"."mesa" VALUES (15, 2, 't');
INSERT INTO "public"."mesa" VALUES (16, 2, 't');
INSERT INTO "public"."mesa" VALUES (17, 2, 't');
INSERT INTO "public"."mesa" VALUES (18, 2, 't');
INSERT INTO "public"."mesa" VALUES (19, 2, 't');
INSERT INTO "public"."mesa" VALUES (20, 2, 't');
INSERT INTO "public"."mesa" VALUES (21, 3, 't');
INSERT INTO "public"."mesa" VALUES (22, 3, 't');
INSERT INTO "public"."mesa" VALUES (23, 3, 't');
INSERT INTO "public"."mesa" VALUES (24, 3, 't');
INSERT INTO "public"."mesa" VALUES (25, 3, 't');
INSERT INTO "public"."mesa" VALUES (26, 3, 't');
INSERT INTO "public"."mesa" VALUES (27, 3, 't');
INSERT INTO "public"."mesa" VALUES (28, 3, 't');
INSERT INTO "public"."mesa" VALUES (29, 3, 't');
INSERT INTO "public"."mesa" VALUES (30, 3, 't');
INSERT INTO "public"."mesa" VALUES (31, 4, 't');
INSERT INTO "public"."mesa" VALUES (32, 4, 't');
INSERT INTO "public"."mesa" VALUES (33, 4, 't');
INSERT INTO "public"."mesa" VALUES (34, 4, 't');
INSERT INTO "public"."mesa" VALUES (35, 4, 't');
INSERT INTO "public"."mesa" VALUES (36, 4, 't');
INSERT INTO "public"."mesa" VALUES (37, 4, 't');
INSERT INTO "public"."mesa" VALUES (38, 4, 't');
INSERT INTO "public"."mesa" VALUES (39, 4, 't');
INSERT INTO "public"."mesa" VALUES (40, 4, 't');
INSERT INTO "public"."mesa" VALUES (41, 5, 't');
INSERT INTO "public"."mesa" VALUES (42, 5, 't');
INSERT INTO "public"."mesa" VALUES (43, 5, 't');
INSERT INTO "public"."mesa" VALUES (44, 5, 't');
INSERT INTO "public"."mesa" VALUES (45, 5, 't');
INSERT INTO "public"."mesa" VALUES (46, 5, 't');
INSERT INTO "public"."mesa" VALUES (47, 5, 't');
INSERT INTO "public"."mesa" VALUES (48, 5, 't');
INSERT INTO "public"."mesa" VALUES (49, 5, 't');
INSERT INTO "public"."mesa" VALUES (50, 5, 't');
INSERT INTO "public"."mesa" VALUES (51, 6, 't');
INSERT INTO "public"."mesa" VALUES (52, 6, 't');
INSERT INTO "public"."mesa" VALUES (53, 6, 't');
INSERT INTO "public"."mesa" VALUES (54, 6, 't');
INSERT INTO "public"."mesa" VALUES (55, 6, 't');
INSERT INTO "public"."mesa" VALUES (56, 6, 't');
INSERT INTO "public"."mesa" VALUES (57, 6, 't');
INSERT INTO "public"."mesa" VALUES (58, 6, 't');
INSERT INTO "public"."mesa" VALUES (59, 6, 't');
INSERT INTO "public"."mesa" VALUES (60, 6, 't');
INSERT INTO "public"."mesa" VALUES (61, 7, 't');
INSERT INTO "public"."mesa" VALUES (62, 7, 't');
INSERT INTO "public"."mesa" VALUES (63, 7, 't');
INSERT INTO "public"."mesa" VALUES (64, 7, 't');
INSERT INTO "public"."mesa" VALUES (65, 7, 't');
INSERT INTO "public"."mesa" VALUES (66, 7, 't');
INSERT INTO "public"."mesa" VALUES (67, 7, 't');
INSERT INTO "public"."mesa" VALUES (68, 7, 't');
INSERT INTO "public"."mesa" VALUES (69, 7, 't');
INSERT INTO "public"."mesa" VALUES (70, 7, 't');
INSERT INTO "public"."mesa" VALUES (71, 8, 't');
INSERT INTO "public"."mesa" VALUES (72, 8, 't');
INSERT INTO "public"."mesa" VALUES (73, 8, 't');
INSERT INTO "public"."mesa" VALUES (74, 8, 't');
INSERT INTO "public"."mesa" VALUES (75, 8, 't');
INSERT INTO "public"."mesa" VALUES (76, 8, 't');
INSERT INTO "public"."mesa" VALUES (77, 8, 't');
INSERT INTO "public"."mesa" VALUES (78, 8, 't');
INSERT INTO "public"."mesa" VALUES (79, 8, 't');
INSERT INTO "public"."mesa" VALUES (80, 8, 't');
INSERT INTO "public"."mesa" VALUES (81, 9, 't');
INSERT INTO "public"."mesa" VALUES (82, 9, 't');
INSERT INTO "public"."mesa" VALUES (83, 9, 't');
INSERT INTO "public"."mesa" VALUES (84, 9, 't');
INSERT INTO "public"."mesa" VALUES (85, 9, 't');
INSERT INTO "public"."mesa" VALUES (86, 9, 't');
INSERT INTO "public"."mesa" VALUES (87, 9, 't');
INSERT INTO "public"."mesa" VALUES (88, 9, 't');
INSERT INTO "public"."mesa" VALUES (89, 9, 't');
INSERT INTO "public"."mesa" VALUES (90, 9, 't');
INSERT INTO "public"."mesa" VALUES (91, 10, 't');
INSERT INTO "public"."mesa" VALUES (92, 10, 't');
INSERT INTO "public"."mesa" VALUES (93, 10, 't');
INSERT INTO "public"."mesa" VALUES (94, 10, 't');
INSERT INTO "public"."mesa" VALUES (95, 10, 't');
INSERT INTO "public"."mesa" VALUES (96, 10, 't');
INSERT INTO "public"."mesa" VALUES (97, 10, 't');
INSERT INTO "public"."mesa" VALUES (98, 10, 't');
INSERT INTO "public"."mesa" VALUES (99, 10, 't');
INSERT INTO "public"."mesa" VALUES (100, 10, 't');
INSERT INTO "public"."mesa" VALUES (101, 11, 't');
INSERT INTO "public"."mesa" VALUES (102, 11, 't');
INSERT INTO "public"."mesa" VALUES (103, 11, 't');
INSERT INTO "public"."mesa" VALUES (104, 11, 't');
INSERT INTO "public"."mesa" VALUES (105, 11, 't');
INSERT INTO "public"."mesa" VALUES (106, 11, 't');
INSERT INTO "public"."mesa" VALUES (107, 11, 't');
INSERT INTO "public"."mesa" VALUES (108, 11, 't');
INSERT INTO "public"."mesa" VALUES (109, 11, 't');
INSERT INTO "public"."mesa" VALUES (110, 11, 't');
INSERT INTO "public"."mesa" VALUES (111, 12, 't');
INSERT INTO "public"."mesa" VALUES (112, 12, 't');
INSERT INTO "public"."mesa" VALUES (113, 12, 't');
INSERT INTO "public"."mesa" VALUES (114, 12, 't');
INSERT INTO "public"."mesa" VALUES (115, 12, 't');
INSERT INTO "public"."mesa" VALUES (116, 12, 't');
INSERT INTO "public"."mesa" VALUES (117, 12, 't');
INSERT INTO "public"."mesa" VALUES (118, 12, 't');
INSERT INTO "public"."mesa" VALUES (119, 12, 't');
INSERT INTO "public"."mesa" VALUES (120, 12, 't');
INSERT INTO "public"."mesa" VALUES (121, 13, 't');
INSERT INTO "public"."mesa" VALUES (122, 13, 't');
INSERT INTO "public"."mesa" VALUES (123, 13, 't');
INSERT INTO "public"."mesa" VALUES (124, 13, 't');
INSERT INTO "public"."mesa" VALUES (125, 13, 't');
INSERT INTO "public"."mesa" VALUES (126, 13, 't');
INSERT INTO "public"."mesa" VALUES (127, 13, 't');
INSERT INTO "public"."mesa" VALUES (128, 13, 't');
INSERT INTO "public"."mesa" VALUES (129, 13, 't');
INSERT INTO "public"."mesa" VALUES (130, 13, 't');
INSERT INTO "public"."mesa" VALUES (131, 14, 't');
INSERT INTO "public"."mesa" VALUES (132, 14, 't');
INSERT INTO "public"."mesa" VALUES (133, 14, 't');
INSERT INTO "public"."mesa" VALUES (134, 14, 't');
INSERT INTO "public"."mesa" VALUES (135, 14, 't');
INSERT INTO "public"."mesa" VALUES (136, 14, 't');
INSERT INTO "public"."mesa" VALUES (137, 14, 't');
INSERT INTO "public"."mesa" VALUES (138, 14, 't');
INSERT INTO "public"."mesa" VALUES (139, 14, 't');
INSERT INTO "public"."mesa" VALUES (140, 14, 't');
INSERT INTO "public"."mesa" VALUES (141, 15, 't');
INSERT INTO "public"."mesa" VALUES (142, 15, 't');
INSERT INTO "public"."mesa" VALUES (143, 15, 't');
INSERT INTO "public"."mesa" VALUES (144, 15, 't');
INSERT INTO "public"."mesa" VALUES (145, 15, 't');
INSERT INTO "public"."mesa" VALUES (146, 15, 't');
INSERT INTO "public"."mesa" VALUES (147, 15, 't');
INSERT INTO "public"."mesa" VALUES (148, 15, 't');
INSERT INTO "public"."mesa" VALUES (149, 15, 't');
INSERT INTO "public"."mesa" VALUES (150, 15, 't');
INSERT INTO "public"."mesa" VALUES (151, 16, 't');
INSERT INTO "public"."mesa" VALUES (152, 16, 't');
INSERT INTO "public"."mesa" VALUES (153, 16, 't');
INSERT INTO "public"."mesa" VALUES (154, 16, 't');
INSERT INTO "public"."mesa" VALUES (155, 16, 't');
INSERT INTO "public"."mesa" VALUES (156, 16, 't');
INSERT INTO "public"."mesa" VALUES (157, 16, 't');
INSERT INTO "public"."mesa" VALUES (158, 16, 't');
INSERT INTO "public"."mesa" VALUES (159, 16, 't');
INSERT INTO "public"."mesa" VALUES (160, 16, 't');
INSERT INTO "public"."mesa" VALUES (161, 17, 't');
INSERT INTO "public"."mesa" VALUES (162, 17, 't');
INSERT INTO "public"."mesa" VALUES (163, 17, 't');
INSERT INTO "public"."mesa" VALUES (164, 17, 't');
INSERT INTO "public"."mesa" VALUES (165, 17, 't');
INSERT INTO "public"."mesa" VALUES (166, 17, 't');
INSERT INTO "public"."mesa" VALUES (167, 17, 't');
INSERT INTO "public"."mesa" VALUES (168, 17, 't');
INSERT INTO "public"."mesa" VALUES (169, 17, 't');
INSERT INTO "public"."mesa" VALUES (170, 17, 't');
INSERT INTO "public"."mesa" VALUES (171, 18, 't');
INSERT INTO "public"."mesa" VALUES (172, 18, 't');
INSERT INTO "public"."mesa" VALUES (173, 18, 't');
INSERT INTO "public"."mesa" VALUES (174, 18, 't');
INSERT INTO "public"."mesa" VALUES (175, 18, 't');
INSERT INTO "public"."mesa" VALUES (176, 18, 't');
INSERT INTO "public"."mesa" VALUES (177, 18, 't');
INSERT INTO "public"."mesa" VALUES (178, 18, 't');
INSERT INTO "public"."mesa" VALUES (179, 18, 't');
INSERT INTO "public"."mesa" VALUES (180, 18, 't');
INSERT INTO "public"."mesa" VALUES (181, 19, 't');
INSERT INTO "public"."mesa" VALUES (182, 19, 't');
INSERT INTO "public"."mesa" VALUES (183, 19, 't');
INSERT INTO "public"."mesa" VALUES (184, 19, 't');
INSERT INTO "public"."mesa" VALUES (185, 19, 't');
INSERT INTO "public"."mesa" VALUES (186, 19, 't');
INSERT INTO "public"."mesa" VALUES (187, 19, 't');
INSERT INTO "public"."mesa" VALUES (188, 19, 't');
INSERT INTO "public"."mesa" VALUES (189, 19, 't');
INSERT INTO "public"."mesa" VALUES (190, 19, 't');
INSERT INTO "public"."mesa" VALUES (191, 20, 't');
INSERT INTO "public"."mesa" VALUES (192, 20, 't');
INSERT INTO "public"."mesa" VALUES (193, 20, 't');
INSERT INTO "public"."mesa" VALUES (194, 20, 't');
INSERT INTO "public"."mesa" VALUES (195, 20, 't');
INSERT INTO "public"."mesa" VALUES (196, 20, 't');
INSERT INTO "public"."mesa" VALUES (197, 20, 't');
INSERT INTO "public"."mesa" VALUES (198, 20, 't');
INSERT INTO "public"."mesa" VALUES (199, 20, 't');
INSERT INTO "public"."mesa" VALUES (200, 20, 't');
INSERT INTO "public"."mesa" VALUES (201, 21, 't');
INSERT INTO "public"."mesa" VALUES (202, 21, 't');
INSERT INTO "public"."mesa" VALUES (203, 21, 't');
INSERT INTO "public"."mesa" VALUES (204, 21, 't');
INSERT INTO "public"."mesa" VALUES (205, 21, 't');
INSERT INTO "public"."mesa" VALUES (206, 21, 't');
INSERT INTO "public"."mesa" VALUES (207, 21, 't');
INSERT INTO "public"."mesa" VALUES (208, 21, 't');
INSERT INTO "public"."mesa" VALUES (209, 21, 't');
INSERT INTO "public"."mesa" VALUES (210, 21, 't');
INSERT INTO "public"."mesa" VALUES (211, 22, 't');
INSERT INTO "public"."mesa" VALUES (212, 22, 't');
INSERT INTO "public"."mesa" VALUES (213, 22, 't');
INSERT INTO "public"."mesa" VALUES (214, 22, 't');
INSERT INTO "public"."mesa" VALUES (215, 22, 't');
INSERT INTO "public"."mesa" VALUES (216, 22, 't');
INSERT INTO "public"."mesa" VALUES (217, 22, 't');
INSERT INTO "public"."mesa" VALUES (218, 22, 't');
INSERT INTO "public"."mesa" VALUES (219, 22, 't');
INSERT INTO "public"."mesa" VALUES (220, 22, 't');
INSERT INTO "public"."mesa" VALUES (221, 23, 't');
INSERT INTO "public"."mesa" VALUES (222, 23, 't');
INSERT INTO "public"."mesa" VALUES (223, 23, 't');
INSERT INTO "public"."mesa" VALUES (224, 23, 't');
INSERT INTO "public"."mesa" VALUES (225, 23, 't');
INSERT INTO "public"."mesa" VALUES (226, 23, 't');
INSERT INTO "public"."mesa" VALUES (227, 23, 't');
INSERT INTO "public"."mesa" VALUES (228, 23, 't');
INSERT INTO "public"."mesa" VALUES (229, 23, 't');
INSERT INTO "public"."mesa" VALUES (230, 23, 't');
INSERT INTO "public"."mesa" VALUES (231, 24, 't');
INSERT INTO "public"."mesa" VALUES (232, 24, 't');
INSERT INTO "public"."mesa" VALUES (233, 24, 't');
INSERT INTO "public"."mesa" VALUES (234, 24, 't');
INSERT INTO "public"."mesa" VALUES (235, 24, 't');
INSERT INTO "public"."mesa" VALUES (236, 24, 't');
INSERT INTO "public"."mesa" VALUES (237, 24, 't');
INSERT INTO "public"."mesa" VALUES (238, 24, 't');
INSERT INTO "public"."mesa" VALUES (239, 24, 't');
INSERT INTO "public"."mesa" VALUES (240, 24, 't');
INSERT INTO "public"."mesa" VALUES (241, 25, 't');
INSERT INTO "public"."mesa" VALUES (242, 25, 't');
INSERT INTO "public"."mesa" VALUES (243, 25, 't');
INSERT INTO "public"."mesa" VALUES (244, 25, 't');
INSERT INTO "public"."mesa" VALUES (245, 25, 't');
INSERT INTO "public"."mesa" VALUES (246, 25, 't');
INSERT INTO "public"."mesa" VALUES (247, 25, 't');
INSERT INTO "public"."mesa" VALUES (248, 25, 't');
INSERT INTO "public"."mesa" VALUES (249, 25, 't');
INSERT INTO "public"."mesa" VALUES (250, 25, 't');
INSERT INTO "public"."mesa" VALUES (251, 26, 't');
INSERT INTO "public"."mesa" VALUES (252, 26, 't');
INSERT INTO "public"."mesa" VALUES (253, 26, 't');
INSERT INTO "public"."mesa" VALUES (254, 26, 't');
INSERT INTO "public"."mesa" VALUES (255, 26, 't');
INSERT INTO "public"."mesa" VALUES (256, 26, 't');
INSERT INTO "public"."mesa" VALUES (257, 26, 't');
INSERT INTO "public"."mesa" VALUES (258, 26, 't');
INSERT INTO "public"."mesa" VALUES (259, 26, 't');
INSERT INTO "public"."mesa" VALUES (260, 26, 't');
INSERT INTO "public"."mesa" VALUES (261, 27, 't');
INSERT INTO "public"."mesa" VALUES (262, 27, 't');
INSERT INTO "public"."mesa" VALUES (263, 27, 't');
INSERT INTO "public"."mesa" VALUES (264, 27, 't');
INSERT INTO "public"."mesa" VALUES (265, 27, 't');
INSERT INTO "public"."mesa" VALUES (266, 27, 't');
INSERT INTO "public"."mesa" VALUES (267, 27, 't');
INSERT INTO "public"."mesa" VALUES (268, 27, 't');
INSERT INTO "public"."mesa" VALUES (269, 27, 't');
INSERT INTO "public"."mesa" VALUES (270, 27, 't');
INSERT INTO "public"."mesa" VALUES (271, 28, 't');
INSERT INTO "public"."mesa" VALUES (272, 28, 't');
INSERT INTO "public"."mesa" VALUES (273, 28, 't');
INSERT INTO "public"."mesa" VALUES (274, 28, 't');
INSERT INTO "public"."mesa" VALUES (275, 28, 't');
INSERT INTO "public"."mesa" VALUES (276, 28, 't');
INSERT INTO "public"."mesa" VALUES (277, 28, 't');
INSERT INTO "public"."mesa" VALUES (278, 28, 't');
INSERT INTO "public"."mesa" VALUES (279, 28, 't');
INSERT INTO "public"."mesa" VALUES (280, 28, 't');
INSERT INTO "public"."mesa" VALUES (281, 29, 't');
INSERT INTO "public"."mesa" VALUES (282, 29, 't');
INSERT INTO "public"."mesa" VALUES (283, 29, 't');
INSERT INTO "public"."mesa" VALUES (284, 29, 't');
INSERT INTO "public"."mesa" VALUES (285, 29, 't');
INSERT INTO "public"."mesa" VALUES (286, 29, 't');
INSERT INTO "public"."mesa" VALUES (287, 29, 't');
INSERT INTO "public"."mesa" VALUES (288, 29, 't');
INSERT INTO "public"."mesa" VALUES (289, 29, 't');
INSERT INTO "public"."mesa" VALUES (290, 29, 't');
INSERT INTO "public"."mesa" VALUES (291, 30, 't');
INSERT INTO "public"."mesa" VALUES (292, 30, 't');
INSERT INTO "public"."mesa" VALUES (293, 30, 't');
INSERT INTO "public"."mesa" VALUES (294, 30, 't');
INSERT INTO "public"."mesa" VALUES (295, 30, 't');
INSERT INTO "public"."mesa" VALUES (296, 30, 't');
INSERT INTO "public"."mesa" VALUES (297, 30, 't');
INSERT INTO "public"."mesa" VALUES (298, 30, 't');
INSERT INTO "public"."mesa" VALUES (299, 30, 't');
INSERT INTO "public"."mesa" VALUES (300, 30, 't');
INSERT INTO "public"."mesa" VALUES (301, 31, 't');
INSERT INTO "public"."mesa" VALUES (302, 31, 't');
INSERT INTO "public"."mesa" VALUES (303, 31, 't');
INSERT INTO "public"."mesa" VALUES (304, 31, 't');
INSERT INTO "public"."mesa" VALUES (305, 31, 't');
INSERT INTO "public"."mesa" VALUES (306, 31, 't');
INSERT INTO "public"."mesa" VALUES (307, 31, 't');
INSERT INTO "public"."mesa" VALUES (308, 31, 't');
INSERT INTO "public"."mesa" VALUES (309, 31, 't');
INSERT INTO "public"."mesa" VALUES (310, 31, 't');
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
INSERT INTO "public"."mesero" VALUES (21, 3, 3, 64);
INSERT INTO "public"."mesero" VALUES (22, 3, 3, 65);
INSERT INTO "public"."mesero" VALUES (23, 3, 3, 66);
INSERT INTO "public"."mesero" VALUES (24, 3, 3, 67);
INSERT INTO "public"."mesero" VALUES (25, 3, 3, 68);
INSERT INTO "public"."mesero" VALUES (26, 3, 3, 69);
INSERT INTO "public"."mesero" VALUES (27, 3, 3, 70);
INSERT INTO "public"."mesero" VALUES (28, 3, 3, 71);
INSERT INTO "public"."mesero" VALUES (29, 3, 3, 72);
INSERT INTO "public"."mesero" VALUES (30, 3, 3, 73);
INSERT INTO "public"."mesero" VALUES (31, 4, 4, 75);
INSERT INTO "public"."mesero" VALUES (32, 4, 4, 76);
INSERT INTO "public"."mesero" VALUES (33, 4, 4, 77);
INSERT INTO "public"."mesero" VALUES (34, 4, 4, 78);
INSERT INTO "public"."mesero" VALUES (35, 4, 4, 79);
INSERT INTO "public"."mesero" VALUES (36, 4, 4, 80);
INSERT INTO "public"."mesero" VALUES (37, 4, 4, 81);
INSERT INTO "public"."mesero" VALUES (38, 4, 4, 82);
INSERT INTO "public"."mesero" VALUES (39, 4, 4, 83);
INSERT INTO "public"."mesero" VALUES (40, 4, 4, 84);
INSERT INTO "public"."mesero" VALUES (41, 5, 5, 86);
INSERT INTO "public"."mesero" VALUES (42, 5, 5, 87);
INSERT INTO "public"."mesero" VALUES (43, 5, 5, 88);
INSERT INTO "public"."mesero" VALUES (44, 5, 5, 89);
INSERT INTO "public"."mesero" VALUES (45, 5, 5, 90);
INSERT INTO "public"."mesero" VALUES (46, 5, 5, 91);
INSERT INTO "public"."mesero" VALUES (47, 5, 5, 92);
INSERT INTO "public"."mesero" VALUES (48, 5, 5, 93);
INSERT INTO "public"."mesero" VALUES (49, 5, 5, 94);
INSERT INTO "public"."mesero" VALUES (50, 5, 5, 95);
INSERT INTO "public"."mesero" VALUES (51, 6, 6, 97);
INSERT INTO "public"."mesero" VALUES (52, 6, 6, 98);
INSERT INTO "public"."mesero" VALUES (53, 6, 6, 99);
INSERT INTO "public"."mesero" VALUES (54, 6, 6, 100);
INSERT INTO "public"."mesero" VALUES (55, 6, 6, 101);
INSERT INTO "public"."mesero" VALUES (56, 6, 6, 102);
INSERT INTO "public"."mesero" VALUES (57, 6, 6, 103);
INSERT INTO "public"."mesero" VALUES (58, 6, 6, 104);
INSERT INTO "public"."mesero" VALUES (59, 6, 6, 105);
INSERT INTO "public"."mesero" VALUES (60, 6, 6, 106);
INSERT INTO "public"."mesero" VALUES (61, 7, 7, 108);
INSERT INTO "public"."mesero" VALUES (62, 7, 7, 109);
INSERT INTO "public"."mesero" VALUES (63, 7, 7, 110);
INSERT INTO "public"."mesero" VALUES (64, 7, 7, 111);
INSERT INTO "public"."mesero" VALUES (65, 7, 7, 112);
INSERT INTO "public"."mesero" VALUES (66, 7, 7, 113);
INSERT INTO "public"."mesero" VALUES (67, 7, 7, 114);
INSERT INTO "public"."mesero" VALUES (68, 7, 7, 115);
INSERT INTO "public"."mesero" VALUES (69, 7, 7, 116);
INSERT INTO "public"."mesero" VALUES (70, 7, 7, 117);
INSERT INTO "public"."mesero" VALUES (71, 8, 8, 119);
INSERT INTO "public"."mesero" VALUES (72, 8, 8, 120);
INSERT INTO "public"."mesero" VALUES (73, 8, 8, 121);
INSERT INTO "public"."mesero" VALUES (74, 8, 8, 122);
INSERT INTO "public"."mesero" VALUES (75, 8, 8, 123);
INSERT INTO "public"."mesero" VALUES (76, 8, 8, 124);
INSERT INTO "public"."mesero" VALUES (77, 8, 8, 125);
INSERT INTO "public"."mesero" VALUES (78, 8, 8, 126);
INSERT INTO "public"."mesero" VALUES (79, 8, 8, 127);
INSERT INTO "public"."mesero" VALUES (80, 8, 8, 128);
INSERT INTO "public"."mesero" VALUES (81, 9, 9, 130);
INSERT INTO "public"."mesero" VALUES (82, 9, 9, 131);
INSERT INTO "public"."mesero" VALUES (83, 9, 9, 132);
INSERT INTO "public"."mesero" VALUES (84, 9, 9, 133);
INSERT INTO "public"."mesero" VALUES (85, 9, 9, 134);
INSERT INTO "public"."mesero" VALUES (86, 9, 9, 135);
INSERT INTO "public"."mesero" VALUES (87, 9, 9, 136);
INSERT INTO "public"."mesero" VALUES (88, 9, 9, 137);
INSERT INTO "public"."mesero" VALUES (89, 9, 9, 138);
INSERT INTO "public"."mesero" VALUES (90, 9, 9, 139);
INSERT INTO "public"."mesero" VALUES (91, 10, 10, 141);
INSERT INTO "public"."mesero" VALUES (92, 10, 10, 142);
INSERT INTO "public"."mesero" VALUES (93, 10, 10, 143);
INSERT INTO "public"."mesero" VALUES (94, 10, 10, 144);
INSERT INTO "public"."mesero" VALUES (95, 10, 10, 145);
INSERT INTO "public"."mesero" VALUES (96, 10, 10, 146);
INSERT INTO "public"."mesero" VALUES (97, 10, 10, 147);
INSERT INTO "public"."mesero" VALUES (98, 10, 10, 148);
INSERT INTO "public"."mesero" VALUES (99, 10, 10, 149);
INSERT INTO "public"."mesero" VALUES (100, 10, 10, 150);
INSERT INTO "public"."mesero" VALUES (101, 11, 11, 152);
INSERT INTO "public"."mesero" VALUES (102, 11, 11, 153);
INSERT INTO "public"."mesero" VALUES (103, 11, 11, 154);
INSERT INTO "public"."mesero" VALUES (104, 11, 11, 155);
INSERT INTO "public"."mesero" VALUES (105, 11, 11, 156);
INSERT INTO "public"."mesero" VALUES (106, 11, 11, 157);
INSERT INTO "public"."mesero" VALUES (107, 11, 11, 158);
INSERT INTO "public"."mesero" VALUES (108, 11, 11, 159);
INSERT INTO "public"."mesero" VALUES (109, 11, 11, 160);
INSERT INTO "public"."mesero" VALUES (110, 11, 11, 161);
INSERT INTO "public"."mesero" VALUES (111, 12, 12, 163);
INSERT INTO "public"."mesero" VALUES (112, 12, 12, 164);
INSERT INTO "public"."mesero" VALUES (113, 12, 12, 165);
INSERT INTO "public"."mesero" VALUES (114, 12, 12, 166);
INSERT INTO "public"."mesero" VALUES (115, 12, 12, 167);
INSERT INTO "public"."mesero" VALUES (116, 12, 12, 168);
INSERT INTO "public"."mesero" VALUES (117, 12, 12, 169);
INSERT INTO "public"."mesero" VALUES (118, 12, 12, 170);
INSERT INTO "public"."mesero" VALUES (119, 12, 12, 171);
INSERT INTO "public"."mesero" VALUES (120, 12, 12, 172);
INSERT INTO "public"."mesero" VALUES (121, 13, 13, 174);
INSERT INTO "public"."mesero" VALUES (122, 13, 13, 175);
INSERT INTO "public"."mesero" VALUES (123, 13, 13, 176);
INSERT INTO "public"."mesero" VALUES (124, 13, 13, 177);
INSERT INTO "public"."mesero" VALUES (125, 13, 13, 178);
INSERT INTO "public"."mesero" VALUES (126, 13, 13, 179);
INSERT INTO "public"."mesero" VALUES (127, 13, 13, 180);
INSERT INTO "public"."mesero" VALUES (128, 13, 13, 181);
INSERT INTO "public"."mesero" VALUES (129, 13, 13, 182);
INSERT INTO "public"."mesero" VALUES (130, 13, 13, 183);
INSERT INTO "public"."mesero" VALUES (131, 14, 14, 185);
INSERT INTO "public"."mesero" VALUES (132, 14, 14, 186);
INSERT INTO "public"."mesero" VALUES (133, 14, 14, 187);
INSERT INTO "public"."mesero" VALUES (134, 14, 14, 188);
INSERT INTO "public"."mesero" VALUES (135, 14, 14, 189);
INSERT INTO "public"."mesero" VALUES (136, 14, 14, 190);
INSERT INTO "public"."mesero" VALUES (137, 14, 14, 191);
INSERT INTO "public"."mesero" VALUES (138, 14, 14, 192);
INSERT INTO "public"."mesero" VALUES (139, 14, 14, 193);
INSERT INTO "public"."mesero" VALUES (140, 14, 14, 194);
INSERT INTO "public"."mesero" VALUES (141, 15, 15, 196);
INSERT INTO "public"."mesero" VALUES (142, 15, 15, 197);
INSERT INTO "public"."mesero" VALUES (143, 15, 15, 198);
INSERT INTO "public"."mesero" VALUES (144, 15, 15, 199);
INSERT INTO "public"."mesero" VALUES (145, 15, 15, 200);
INSERT INTO "public"."mesero" VALUES (146, 15, 15, 201);
INSERT INTO "public"."mesero" VALUES (147, 15, 15, 202);
INSERT INTO "public"."mesero" VALUES (148, 15, 15, 203);
INSERT INTO "public"."mesero" VALUES (149, 15, 15, 204);
INSERT INTO "public"."mesero" VALUES (150, 15, 15, 205);
INSERT INTO "public"."mesero" VALUES (151, 16, 16, 207);
INSERT INTO "public"."mesero" VALUES (152, 16, 16, 208);
INSERT INTO "public"."mesero" VALUES (153, 16, 16, 209);
INSERT INTO "public"."mesero" VALUES (154, 16, 16, 210);
INSERT INTO "public"."mesero" VALUES (155, 16, 16, 211);
INSERT INTO "public"."mesero" VALUES (156, 16, 16, 212);
INSERT INTO "public"."mesero" VALUES (157, 16, 16, 213);
INSERT INTO "public"."mesero" VALUES (158, 16, 16, 214);
INSERT INTO "public"."mesero" VALUES (159, 16, 16, 215);
INSERT INTO "public"."mesero" VALUES (160, 16, 16, 216);
INSERT INTO "public"."mesero" VALUES (161, 17, 17, 218);
INSERT INTO "public"."mesero" VALUES (162, 17, 17, 219);
INSERT INTO "public"."mesero" VALUES (163, 17, 17, 220);
INSERT INTO "public"."mesero" VALUES (164, 17, 17, 221);
INSERT INTO "public"."mesero" VALUES (165, 17, 17, 222);
INSERT INTO "public"."mesero" VALUES (166, 17, 17, 223);
INSERT INTO "public"."mesero" VALUES (167, 17, 17, 224);
INSERT INTO "public"."mesero" VALUES (168, 17, 17, 225);
INSERT INTO "public"."mesero" VALUES (169, 17, 17, 226);
INSERT INTO "public"."mesero" VALUES (170, 17, 17, 227);
INSERT INTO "public"."mesero" VALUES (171, 18, 18, 229);
INSERT INTO "public"."mesero" VALUES (172, 18, 18, 230);
INSERT INTO "public"."mesero" VALUES (173, 18, 18, 231);
INSERT INTO "public"."mesero" VALUES (174, 18, 18, 232);
INSERT INTO "public"."mesero" VALUES (175, 18, 18, 233);
INSERT INTO "public"."mesero" VALUES (176, 18, 18, 234);
INSERT INTO "public"."mesero" VALUES (177, 18, 18, 235);
INSERT INTO "public"."mesero" VALUES (178, 18, 18, 236);
INSERT INTO "public"."mesero" VALUES (179, 18, 18, 237);
INSERT INTO "public"."mesero" VALUES (180, 18, 18, 238);
INSERT INTO "public"."mesero" VALUES (181, 19, 19, 240);
INSERT INTO "public"."mesero" VALUES (182, 19, 19, 241);
INSERT INTO "public"."mesero" VALUES (183, 19, 19, 242);
INSERT INTO "public"."mesero" VALUES (184, 19, 19, 243);
INSERT INTO "public"."mesero" VALUES (185, 19, 19, 244);
INSERT INTO "public"."mesero" VALUES (186, 19, 19, 245);
INSERT INTO "public"."mesero" VALUES (187, 19, 19, 246);
INSERT INTO "public"."mesero" VALUES (188, 19, 19, 247);
INSERT INTO "public"."mesero" VALUES (189, 19, 19, 248);
INSERT INTO "public"."mesero" VALUES (190, 19, 19, 249);
INSERT INTO "public"."mesero" VALUES (191, 20, 20, 251);
INSERT INTO "public"."mesero" VALUES (192, 20, 20, 252);
INSERT INTO "public"."mesero" VALUES (193, 20, 20, 253);
INSERT INTO "public"."mesero" VALUES (194, 20, 20, 254);
INSERT INTO "public"."mesero" VALUES (195, 20, 20, 255);
INSERT INTO "public"."mesero" VALUES (196, 20, 20, 256);
INSERT INTO "public"."mesero" VALUES (197, 20, 20, 257);
INSERT INTO "public"."mesero" VALUES (198, 20, 20, 258);
INSERT INTO "public"."mesero" VALUES (199, 20, 20, 259);
INSERT INTO "public"."mesero" VALUES (200, 20, 20, 260);
INSERT INTO "public"."mesero" VALUES (201, 21, 21, 262);
INSERT INTO "public"."mesero" VALUES (202, 21, 21, 263);
INSERT INTO "public"."mesero" VALUES (203, 21, 21, 264);
INSERT INTO "public"."mesero" VALUES (204, 21, 21, 265);
INSERT INTO "public"."mesero" VALUES (205, 21, 21, 266);
INSERT INTO "public"."mesero" VALUES (206, 21, 21, 267);
INSERT INTO "public"."mesero" VALUES (207, 21, 21, 268);
INSERT INTO "public"."mesero" VALUES (208, 21, 21, 269);
INSERT INTO "public"."mesero" VALUES (209, 21, 21, 270);
INSERT INTO "public"."mesero" VALUES (210, 21, 21, 271);
INSERT INTO "public"."mesero" VALUES (211, 22, 22, 273);
INSERT INTO "public"."mesero" VALUES (212, 22, 22, 274);
INSERT INTO "public"."mesero" VALUES (213, 22, 22, 275);
INSERT INTO "public"."mesero" VALUES (214, 22, 22, 276);
INSERT INTO "public"."mesero" VALUES (215, 22, 22, 277);
INSERT INTO "public"."mesero" VALUES (216, 22, 22, 278);
INSERT INTO "public"."mesero" VALUES (217, 22, 22, 279);
INSERT INTO "public"."mesero" VALUES (218, 22, 22, 280);
INSERT INTO "public"."mesero" VALUES (219, 22, 22, 281);
INSERT INTO "public"."mesero" VALUES (220, 22, 22, 282);
INSERT INTO "public"."mesero" VALUES (221, 23, 23, 284);
INSERT INTO "public"."mesero" VALUES (222, 23, 23, 285);
INSERT INTO "public"."mesero" VALUES (223, 23, 23, 286);
INSERT INTO "public"."mesero" VALUES (224, 23, 23, 287);
INSERT INTO "public"."mesero" VALUES (225, 23, 23, 288);
INSERT INTO "public"."mesero" VALUES (226, 23, 23, 289);
INSERT INTO "public"."mesero" VALUES (227, 23, 23, 290);
INSERT INTO "public"."mesero" VALUES (228, 23, 23, 291);
INSERT INTO "public"."mesero" VALUES (229, 23, 23, 292);
INSERT INTO "public"."mesero" VALUES (230, 23, 23, 293);
INSERT INTO "public"."mesero" VALUES (231, 24, 24, 295);
INSERT INTO "public"."mesero" VALUES (232, 24, 24, 296);
INSERT INTO "public"."mesero" VALUES (233, 24, 24, 297);
INSERT INTO "public"."mesero" VALUES (234, 24, 24, 298);
INSERT INTO "public"."mesero" VALUES (235, 24, 24, 299);
INSERT INTO "public"."mesero" VALUES (236, 24, 24, 300);
INSERT INTO "public"."mesero" VALUES (237, 24, 24, 301);
INSERT INTO "public"."mesero" VALUES (238, 24, 24, 302);
INSERT INTO "public"."mesero" VALUES (239, 24, 24, 303);
INSERT INTO "public"."mesero" VALUES (240, 24, 24, 304);
INSERT INTO "public"."mesero" VALUES (241, 25, 25, 306);
INSERT INTO "public"."mesero" VALUES (242, 25, 25, 307);
INSERT INTO "public"."mesero" VALUES (243, 25, 25, 308);
INSERT INTO "public"."mesero" VALUES (244, 25, 25, 309);
INSERT INTO "public"."mesero" VALUES (245, 25, 25, 310);
INSERT INTO "public"."mesero" VALUES (246, 25, 25, 311);
INSERT INTO "public"."mesero" VALUES (247, 25, 25, 312);
INSERT INTO "public"."mesero" VALUES (248, 25, 25, 313);
INSERT INTO "public"."mesero" VALUES (249, 25, 25, 314);
INSERT INTO "public"."mesero" VALUES (250, 25, 25, 315);
INSERT INTO "public"."mesero" VALUES (251, 26, 26, 317);
INSERT INTO "public"."mesero" VALUES (252, 26, 26, 318);
INSERT INTO "public"."mesero" VALUES (253, 26, 26, 319);
INSERT INTO "public"."mesero" VALUES (254, 26, 26, 320);
INSERT INTO "public"."mesero" VALUES (255, 26, 26, 321);
INSERT INTO "public"."mesero" VALUES (256, 26, 26, 322);
INSERT INTO "public"."mesero" VALUES (257, 26, 26, 323);
INSERT INTO "public"."mesero" VALUES (258, 26, 26, 324);
INSERT INTO "public"."mesero" VALUES (259, 26, 26, 325);
INSERT INTO "public"."mesero" VALUES (260, 26, 26, 326);
INSERT INTO "public"."mesero" VALUES (261, 27, 27, 328);
INSERT INTO "public"."mesero" VALUES (262, 27, 27, 329);
INSERT INTO "public"."mesero" VALUES (263, 27, 27, 330);
INSERT INTO "public"."mesero" VALUES (264, 27, 27, 331);
INSERT INTO "public"."mesero" VALUES (265, 27, 27, 332);
INSERT INTO "public"."mesero" VALUES (266, 27, 27, 333);
INSERT INTO "public"."mesero" VALUES (267, 27, 27, 334);
INSERT INTO "public"."mesero" VALUES (268, 27, 27, 335);
INSERT INTO "public"."mesero" VALUES (269, 27, 27, 336);
INSERT INTO "public"."mesero" VALUES (270, 27, 27, 337);
INSERT INTO "public"."mesero" VALUES (271, 28, 28, 339);
INSERT INTO "public"."mesero" VALUES (272, 28, 28, 340);
INSERT INTO "public"."mesero" VALUES (273, 28, 28, 341);
INSERT INTO "public"."mesero" VALUES (274, 28, 28, 342);
INSERT INTO "public"."mesero" VALUES (275, 28, 28, 343);
INSERT INTO "public"."mesero" VALUES (276, 28, 28, 344);
INSERT INTO "public"."mesero" VALUES (277, 28, 28, 345);
INSERT INTO "public"."mesero" VALUES (278, 28, 28, 346);
INSERT INTO "public"."mesero" VALUES (279, 28, 28, 347);
INSERT INTO "public"."mesero" VALUES (280, 28, 28, 348);
INSERT INTO "public"."mesero" VALUES (281, 29, 29, 350);
INSERT INTO "public"."mesero" VALUES (282, 29, 29, 351);
INSERT INTO "public"."mesero" VALUES (283, 29, 29, 352);
INSERT INTO "public"."mesero" VALUES (284, 29, 29, 353);
INSERT INTO "public"."mesero" VALUES (285, 29, 29, 354);
INSERT INTO "public"."mesero" VALUES (286, 29, 29, 355);
INSERT INTO "public"."mesero" VALUES (287, 29, 29, 356);
INSERT INTO "public"."mesero" VALUES (288, 29, 29, 357);
INSERT INTO "public"."mesero" VALUES (289, 29, 29, 358);
INSERT INTO "public"."mesero" VALUES (290, 29, 29, 359);
INSERT INTO "public"."mesero" VALUES (291, 30, 30, 361);
INSERT INTO "public"."mesero" VALUES (292, 30, 30, 362);
INSERT INTO "public"."mesero" VALUES (293, 30, 30, 363);
INSERT INTO "public"."mesero" VALUES (294, 30, 30, 364);
INSERT INTO "public"."mesero" VALUES (295, 30, 30, 365);
INSERT INTO "public"."mesero" VALUES (296, 30, 30, 366);
INSERT INTO "public"."mesero" VALUES (297, 30, 30, 367);
INSERT INTO "public"."mesero" VALUES (298, 30, 30, 368);
INSERT INTO "public"."mesero" VALUES (299, 30, 30, 369);
INSERT INTO "public"."mesero" VALUES (300, 30, 30, 370);
INSERT INTO "public"."mesero" VALUES (301, 31, 31, 372);
INSERT INTO "public"."mesero" VALUES (302, 31, 31, 373);
INSERT INTO "public"."mesero" VALUES (303, 31, 31, 374);
INSERT INTO "public"."mesero" VALUES (304, 31, 31, 375);
INSERT INTO "public"."mesero" VALUES (305, 31, 31, 376);
INSERT INTO "public"."mesero" VALUES (306, 31, 31, 377);
INSERT INTO "public"."mesero" VALUES (307, 31, 31, 378);
INSERT INTO "public"."mesero" VALUES (308, 31, 31, 379);
INSERT INTO "public"."mesero" VALUES (309, 31, 31, 380);
INSERT INTO "public"."mesero" VALUES (310, 31, 31, 381);
COMMIT;

-- ----------------------------
-- Table structure for orden
-- ----------------------------
DROP TABLE IF EXISTS "public"."orden";
CREATE TABLE "public"."orden" (
  "idorden" int4 NOT NULL DEFAULT nextval('orden_idorden_seq'::regclass),
  "idmesa" int4,
  "idrestaurante" int4 NOT NULL,
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
INSERT INTO "public"."orden" VALUES (1, 1, 1, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (2, 2, 1, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (3, 3, 1, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (4, 4, 1, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (5, 5, 1, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (6, 6, 1, 6, '905 Bode Wells', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (7, 7, 1, 7, '677 White Rapids', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (8, 8, 1, 8, '394 Jeramy Forks', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (9, 9, 1, 9, '746 Durgan Shoal', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (10, 10, 1, 10, '60480 Brenden Inlet', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (11, 11, 2, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (12, 12, 2, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (13, 13, 2, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (14, 14, 2, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (15, 15, 2, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (16, 16, 2, 6, '13940 Keeling Key', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (17, 17, 2, 7, '1458 Spinka Park', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (18, 18, 2, 8, '8531 O''Kon Village', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (19, 19, 2, 9, '112 O''Kon Square', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (20, 20, 2, 10, '76340 Hackett Port', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (21, 21, 3, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (22, 22, 3, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (23, 23, 3, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (24, 24, 3, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (25, 25, 3, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (26, 26, 3, 6, '25748 Skiles Fort', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (27, 27, 3, 7, '3651 Dare Walk', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (28, 28, 3, 8, '268 Dessie Centers', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (29, 29, 3, 9, '757 Isom Fords', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (30, 30, 3, 10, '816 Erling Keys', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (31, 31, 4, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (32, 32, 4, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (33, 33, 4, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (34, 34, 4, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (35, 35, 4, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (36, 36, 4, 6, '17260 Beatty Run', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (37, 37, 4, 7, '85768 Howe Estate', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (38, 38, 4, 8, '41231 Wyman Expressway', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (39, 39, 4, 9, '33546 Coralie Terrace', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (40, 40, 4, 10, '534 Johnathan Glens', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (41, 41, 5, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (42, 42, 5, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (43, 43, 5, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (44, 44, 5, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (45, 45, 5, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (46, 46, 5, 6, '9836 Rowan Landing', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (47, 47, 5, 7, '667 Johns Radial', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (48, 48, 5, 8, '14203 Lindgren Radial', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (49, 49, 5, 9, '417 Kenya Tunnel', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (50, 50, 5, 10, '96161 Pfannerstill Freeway', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (51, 51, 6, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (52, 52, 6, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (53, 53, 6, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (54, 54, 6, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (55, 55, 6, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (56, 56, 6, 6, '729 Loma Glen', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (57, 57, 6, 7, '134 Konopelski Rapid', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (58, 58, 6, 8, '2234 Wisozk Passage', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (59, 59, 6, 9, '760 Hodkiewicz Estates', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (60, 60, 6, 10, '1586 Rice Estate', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (61, 61, 7, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (62, 62, 7, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (63, 63, 7, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (64, 64, 7, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (65, 65, 7, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (66, 66, 7, 6, '5660 Schroeder Flat', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (67, 67, 7, 7, '7475 Grimes View', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (68, 68, 7, 8, '7816 Gerlach Fork', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (69, 69, 7, 9, '2295 Josh Trail', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (70, 70, 7, 10, '1292 Sonny Village', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (71, 71, 8, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (72, 72, 8, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (73, 73, 8, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (74, 74, 8, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (75, 75, 8, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (76, 76, 8, 6, '2688 Wintheiser Tunnel', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (77, 77, 8, 7, '2188 Kayli Mountain', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (78, 78, 8, 8, '83133 Stephon Harbors', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (79, 79, 8, 9, '7967 Jaden Forge', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (80, 80, 8, 10, '8600 Melba Ferry', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (81, 81, 9, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (82, 82, 9, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (83, 83, 9, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (84, 84, 9, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (85, 85, 9, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (86, 86, 9, 6, '2872 Rossie Gardens', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (87, 87, 9, 7, '564 Dejuan Loaf', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (88, 88, 9, 8, '090 Wiegand Shore', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (89, 89, 9, 9, '545 Cristopher Squares', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (90, 90, 9, 10, '37551 Sammy Walks', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (91, 91, 10, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (92, 92, 10, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (93, 93, 10, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (94, 94, 10, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (95, 95, 10, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (96, 96, 10, 6, '631 Toni Park', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (97, 97, 10, 7, '593 Mann Centers', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (98, 98, 10, 8, '9479 Matteo Knoll', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (99, 99, 10, 9, '4812 Breitenberg Burgs', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (100, 100, 10, 10, '50445 Cummings Islands', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (101, 101, 11, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (102, 102, 11, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (103, 103, 11, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (104, 104, 11, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (105, 105, 11, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (106, 106, 11, 6, '3159 Lafayette Forest', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (107, 107, 11, 7, '9757 Murazik Street', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (108, 108, 11, 8, '4234 Cindy Island', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (109, 109, 11, 9, '5337 Toy Mission', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (110, 110, 11, 10, '874 Hellen Squares', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (111, 111, 12, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (112, 112, 12, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (113, 113, 12, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (114, 114, 12, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (115, 115, 12, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (116, 116, 12, 6, '281 Schimmel Lodge', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (117, 117, 12, 7, '8095 Bogisich Ramp', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (118, 118, 12, 8, '06357 Hirthe Bridge', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (119, 119, 12, 9, '4127 Ruthe Terrace', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (120, 120, 12, 10, '606 Brekke Curve', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (121, 121, 13, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (122, 122, 13, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (123, 123, 13, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (124, 124, 13, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (125, 125, 13, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (126, 126, 13, 6, '3623 Junius Mews', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (127, 127, 13, 7, '296 Meggie Bridge', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (128, 128, 13, 8, '56283 Adams Track', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (129, 129, 13, 9, '96411 Ada Neck', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (130, 130, 13, 10, '87577 Corkery Drive', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (131, 131, 14, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (132, 132, 14, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (133, 133, 14, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (134, 134, 14, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (135, 135, 14, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (136, 136, 14, 6, '89175 Hilton Centers', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (137, 137, 14, 7, '0114 Madonna Motorway', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (138, 138, 14, 8, '8922 Hahn Pike', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (139, 139, 14, 9, '39450 Ziemann Streets', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (140, 140, 14, 10, '5568 Reichel Ways', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (141, 141, 15, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (142, 142, 15, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (143, 143, 15, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (144, 144, 15, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (145, 145, 15, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (146, 146, 15, 6, '2817 Harris Junctions', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (147, 147, 15, 7, '492 Erdman Spur', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (148, 148, 15, 8, '2234 Baumbach Mountain', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (149, 149, 15, 9, '325 Jimmy Garden', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (150, 150, 15, 10, '314 Pauline Neck', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (151, 151, 16, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (152, 152, 16, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (153, 153, 16, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (154, 154, 16, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (155, 155, 16, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (156, 156, 16, 6, '0144 Emard Plaza', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (157, 157, 16, 7, '38365 Mills Meadow', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (159, 159, 16, 9, '17562 Brakus Summit', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (160, 160, 16, 10, '423 Timothy Isle', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (161, 161, 17, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (162, 162, 17, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (163, 163, 17, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (164, 164, 17, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (165, 165, 17, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (166, 166, 17, 6, '428 Kaitlin Mews', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (167, 167, 17, 7, '42638 Lexie Point', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (168, 168, 17, 8, '5203 Marisa Heights', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (169, 169, 17, 9, '9738 Lionel Trace', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (170, 170, 17, 10, '7766 Swift Flats', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (171, 171, 18, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (172, 172, 18, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (173, 173, 18, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (174, 174, 18, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (175, 175, 18, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (176, 176, 18, 6, '81351 Yundt Stream', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (177, 177, 18, 7, '2120 Burley Cliff', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (178, 178, 18, 8, '90005 Schroeder Courts', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (179, 179, 18, 9, '98805 Johnson Curve', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (180, 180, 18, 10, '0570 Velda Divide', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (181, 181, 19, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (182, 182, 19, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (183, 183, 19, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (184, 184, 19, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (185, 185, 19, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (186, 186, 19, 6, '09169 Spencer Drive', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (187, 187, 19, 7, '205 Koch Glen', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (188, 188, 19, 8, '454 Darwin Bridge', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (189, 189, 19, 9, '044 Karolann Hill', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (190, 190, 19, 10, '7122 Williamson Lights', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (191, 191, 20, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (192, 192, 20, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (193, 193, 20, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (194, 194, 20, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (195, 195, 20, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (196, 196, 20, 6, '5258 Carlee Street', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (197, 197, 20, 7, '613 Bernice Branch', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (198, 198, 20, 8, '4308 Reynolds Wells', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (199, 199, 20, 9, '129 Kuhn Ports', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (200, 200, 20, 10, '048 Durgan Vista', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (201, 201, 21, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (202, 202, 21, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (203, 203, 21, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (204, 204, 21, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (205, 205, 21, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (206, 206, 21, 6, '75746 Gulgowski Drive', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (207, 207, 21, 7, '02238 Durgan Spurs', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (208, 208, 21, 8, '36775 Pansy Prairie', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (209, 209, 21, 9, '4647 Aiden Tunnel', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (210, 210, 21, 10, '45148 Liliana Locks', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (211, 211, 22, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (212, 212, 22, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (213, 213, 22, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (214, 214, 22, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (215, 215, 22, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (216, 216, 22, 6, '43137 Daugherty Shoal', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (217, 217, 22, 7, '226 Julie Road', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (218, 218, 22, 8, '15467 Stehr Station', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (219, 219, 22, 9, '30189 Rolfson Skyway', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (220, 220, 22, 10, '108 Laurel Lodge', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (221, 221, 23, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (222, 222, 23, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (223, 223, 23, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (224, 224, 23, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (225, 225, 23, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (226, 226, 23, 6, '83237 Raynor Trail', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (227, 227, 23, 7, '234 Cartwright Mall', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (228, 228, 23, 8, '18142 Watsica Flat', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (229, 229, 23, 9, '20224 Matteo Gardens', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (230, 230, 23, 10, '6595 Kathlyn Centers', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (231, 231, 24, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (232, 232, 24, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (233, 233, 24, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (234, 234, 24, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (235, 235, 24, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (236, 236, 24, 6, '56038 Rosenbaum Dam', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (237, 237, 24, 7, '8986 Koss Centers', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (238, 238, 24, 8, '2298 Bryon Ridges', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (239, 239, 24, 9, '3830 Waelchi Throughway', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (240, 240, 24, 10, '7466 Fadel Mountains', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (241, 241, 25, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (242, 242, 25, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (243, 243, 25, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (244, 244, 25, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (245, 245, 25, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (246, 246, 25, 6, '92188 Talon Mountain', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (247, 247, 25, 7, '8897 Aliza Glens', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (248, 248, 25, 8, '807 Mattie Canyon', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (249, 249, 25, 9, '91177 Dean Grove', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (250, 250, 25, 10, '602 Kirk Harbors', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (251, 251, 26, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (252, 252, 26, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (253, 253, 26, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (254, 254, 26, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (255, 255, 26, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (256, 256, 26, 6, '7008 Murray Greens', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (257, 257, 26, 7, '7582 Alessia Islands', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (258, 258, 26, 8, '62373 Lockman Courts', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (259, 259, 26, 9, '1280 Stracke Summit', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (260, 260, 26, 10, '1280 Weber Underpass', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (261, 261, 27, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (262, 262, 27, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (263, 263, 27, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (264, 264, 27, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (265, 265, 27, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (266, 266, 27, 6, '511 Tyshawn Spurs', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (267, 267, 27, 7, '82654 Orin Glens', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (268, 268, 27, 8, '012 Carmine Passage', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (269, 269, 27, 9, '67840 Hauck Bypass', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (270, 270, 27, 10, '9601 Ivory Inlet', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (271, 271, 28, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (272, 272, 28, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (273, 273, 28, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (274, 274, 28, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (275, 275, 28, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (276, 276, 28, 6, '478 Rickey Fork', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (277, 277, 28, 7, '11669 Hayes Lake', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (278, 278, 28, 8, '0597 Baumbach Harbors', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (279, 279, 28, 9, '889 Brody Rapids', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (280, 280, 28, 10, '985 Crooks Gateway', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (281, 281, 29, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (282, 282, 29, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (283, 283, 29, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (284, 284, 29, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (285, 285, 29, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (286, 286, 29, 6, '655 Madyson Points', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (287, 287, 29, 7, '780 Justyn Corners', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (288, 288, 29, 8, '6654 Magdalen Knoll', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (289, 289, 29, 9, '002 Runolfsdottir Street', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (290, 290, 29, 10, '828 Elta Shoal', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (291, 291, 30, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (292, 292, 30, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (293, 293, 30, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (294, 294, 30, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (295, 295, 30, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (296, 296, 30, 6, '5324 Shana Islands', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (297, 297, 30, 7, '878 Lexus Meadows', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (298, 298, 30, 8, '5912 Hickle Well', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (299, 299, 30, 9, '2680 Lea Stravenue', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (300, 300, 30, 10, '667 Greenholt Spurs', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (301, 301, 31, 1, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (302, 302, 31, 2, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (303, 303, 31, 3, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (304, 304, 31, 4, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (305, 305, 31, 5, NULL, 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (306, 306, 31, 6, '9707 Greenholt Estate', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (307, 307, 31, 7, '23400 Jack Parkway', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (308, 308, 31, 8, '255 Elroy Overpass', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (309, 309, 31, 9, '9527 Dicki Rue', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (310, 310, 31, 10, '6218 Bashirian Corner', 'EN_PROCESO', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (158, 158, 16, 8, '414 Layne Dale', 'ENTREGADA', 'f', 't', 100);
INSERT INTO "public"."orden" VALUES (311, NULL, 1, 31, NULL, 'RECIBIDA', 't', 'f', 0);
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
INSERT INTO "public"."platillo" VALUES (1, 1, 1, 'http://loremflickr.com/640/480/food?69012', 'Oriental Bronze Cheese', 749);
INSERT INTO "public"."platillo" VALUES (2, 1, 1, 'http://loremflickr.com/640/480/food?4610', 'Elegant Rubber Chicken', 288);
INSERT INTO "public"."platillo" VALUES (3, 1, 1, 'http://loremflickr.com/640/480/food?80594', 'Generic Frozen Ball', 479);
INSERT INTO "public"."platillo" VALUES (4, 1, 1, 'http://loremflickr.com/640/480/food?41276', 'Fantastic Fresh Chicken', 703);
INSERT INTO "public"."platillo" VALUES (5, 1, 1, 'http://loremflickr.com/640/480/food?24607', 'Generic Steel Chips', 579);
INSERT INTO "public"."platillo" VALUES (6, 1, 1, 'http://loremflickr.com/640/480/food?46271', 'Refined Fresh Computer', 89);
INSERT INTO "public"."platillo" VALUES (7, 1, 1, 'http://loremflickr.com/640/480/food?17866', 'Gorgeous Granite Chicken', 197);
INSERT INTO "public"."platillo" VALUES (8, 1, 1, 'http://loremflickr.com/640/480/food?84818', 'Gorgeous Wooden Ball', 125);
INSERT INTO "public"."platillo" VALUES (9, 1, 1, 'http://loremflickr.com/640/480/food?63675', 'Luxurious Soft Salad', 163);
INSERT INTO "public"."platillo" VALUES (10, 1, 1, 'http://loremflickr.com/640/480/food?95399', 'Luxurious Concrete Pizza', 304);
INSERT INTO "public"."platillo" VALUES (11, 1, 1, 'http://loremflickr.com/640/480/food?75158', 'Sleek Bronze Chair', 988);
INSERT INTO "public"."platillo" VALUES (12, 1, 1, 'http://loremflickr.com/640/480/food?57580', 'Oriental Granite Chair', 788);
INSERT INTO "public"."platillo" VALUES (13, 1, 1, 'http://loremflickr.com/640/480/food?22375', 'Elegant Steel Mouse', 541);
INSERT INTO "public"."platillo" VALUES (14, 1, 1, 'http://loremflickr.com/640/480/food?20011', 'Generic Fresh Chicken', 22);
INSERT INTO "public"."platillo" VALUES (15, 1, 1, 'http://loremflickr.com/640/480/food?16181', 'Tasty Steel Shirt', 135);
INSERT INTO "public"."platillo" VALUES (16, 1, 1, 'http://loremflickr.com/640/480/food?37633', 'Elegant Soft Car', 812);
INSERT INTO "public"."platillo" VALUES (17, 1, 1, 'http://loremflickr.com/640/480/food?94916', 'Refined Fresh Bacon', 416);
INSERT INTO "public"."platillo" VALUES (18, 1, 1, 'http://loremflickr.com/640/480/food?6810', 'Elegant Steel Pizza', 233);
INSERT INTO "public"."platillo" VALUES (19, 1, 1, 'http://loremflickr.com/640/480/food?24734', 'Recycled Cotton Shoes', 576);
INSERT INTO "public"."platillo" VALUES (20, 1, 1, 'http://loremflickr.com/640/480/food?15516', 'Oriental Plastic Bacon', 760);
INSERT INTO "public"."platillo" VALUES (21, 2, 2, 'http://loremflickr.com/640/480/food?80367', 'Oriental Soft Ball', 748);
INSERT INTO "public"."platillo" VALUES (22, 2, 2, 'http://loremflickr.com/640/480/food?8964', 'Tasty Plastic Chips', 509);
INSERT INTO "public"."platillo" VALUES (23, 2, 2, 'http://loremflickr.com/640/480/food?10299', 'Unbranded Bronze Shoes', 845);
INSERT INTO "public"."platillo" VALUES (24, 2, 2, 'http://loremflickr.com/640/480/food?29555', 'Refined Frozen Salad', 70);
INSERT INTO "public"."platillo" VALUES (25, 2, 2, 'http://loremflickr.com/640/480/food?81919', 'Practical Soft Tuna', 336);
INSERT INTO "public"."platillo" VALUES (26, 2, 2, 'http://loremflickr.com/640/480/food?29252', 'Refined Rubber Ball', 810);
INSERT INTO "public"."platillo" VALUES (27, 2, 2, 'http://loremflickr.com/640/480/food?94331', 'Electronic Wooden Chair', 723);
INSERT INTO "public"."platillo" VALUES (28, 2, 2, 'http://loremflickr.com/640/480/food?7446', 'Elegant Bronze Ball', 373);
INSERT INTO "public"."platillo" VALUES (29, 2, 2, 'http://loremflickr.com/640/480/food?83544', 'Unbranded Soft Soap', 420);
INSERT INTO "public"."platillo" VALUES (30, 2, 2, 'http://loremflickr.com/640/480/food?97929', 'Practical Frozen Gloves', 263);
INSERT INTO "public"."platillo" VALUES (31, 2, 2, 'http://loremflickr.com/640/480/food?48641', 'Bespoke Metal Tuna', 611);
INSERT INTO "public"."platillo" VALUES (32, 2, 2, 'http://loremflickr.com/640/480/food?76170', 'Sleek Metal Cheese', 311);
INSERT INTO "public"."platillo" VALUES (33, 2, 2, 'http://loremflickr.com/640/480/food?59859', 'Oriental Bronze Tuna', 869);
INSERT INTO "public"."platillo" VALUES (34, 2, 2, 'http://loremflickr.com/640/480/food?6347', 'Small Concrete Chicken', 55);
INSERT INTO "public"."platillo" VALUES (35, 2, 2, 'http://loremflickr.com/640/480/food?67416', 'Bespoke Plastic Ball', 752);
INSERT INTO "public"."platillo" VALUES (36, 2, 2, 'http://loremflickr.com/640/480/food?73836', 'Unbranded Steel Salad', 946);
INSERT INTO "public"."platillo" VALUES (37, 2, 2, 'http://loremflickr.com/640/480/food?8262', 'Gorgeous Concrete Keyboard', 944);
INSERT INTO "public"."platillo" VALUES (38, 2, 2, 'http://loremflickr.com/640/480/food?34778', 'Ergonomic Fresh Pizza', 536);
INSERT INTO "public"."platillo" VALUES (39, 2, 2, 'http://loremflickr.com/640/480/food?37661', 'Awesome Frozen Mouse', 615);
INSERT INTO "public"."platillo" VALUES (40, 2, 2, 'http://loremflickr.com/640/480/food?60727', 'Recycled Soft Salad', 177);
INSERT INTO "public"."platillo" VALUES (41, 3, 3, 'http://loremflickr.com/640/480/food?58557', 'Generic Concrete Gloves', 679);
INSERT INTO "public"."platillo" VALUES (42, 3, 3, 'http://loremflickr.com/640/480/food?26337', 'Handmade Granite Pants', 453);
INSERT INTO "public"."platillo" VALUES (43, 3, 3, 'http://loremflickr.com/640/480/food?44049', 'Handmade Frozen Chicken', 296);
INSERT INTO "public"."platillo" VALUES (44, 3, 3, 'http://loremflickr.com/640/480/food?5570', 'Fantastic Cotton Gloves', 836);
INSERT INTO "public"."platillo" VALUES (45, 3, 3, 'http://loremflickr.com/640/480/food?76828', 'Oriental Granite Chicken', 146);
INSERT INTO "public"."platillo" VALUES (46, 3, 3, 'http://loremflickr.com/640/480/food?98957', 'Generic Bronze Pizza', 919);
INSERT INTO "public"."platillo" VALUES (47, 3, 3, 'http://loremflickr.com/640/480/food?21353', 'Unbranded Steel Mouse', 735);
INSERT INTO "public"."platillo" VALUES (48, 3, 3, 'http://loremflickr.com/640/480/food?59396', 'Refined Fresh Hat', 587);
INSERT INTO "public"."platillo" VALUES (49, 3, 3, 'http://loremflickr.com/640/480/food?47483', 'Tasty Metal Bacon', 853);
INSERT INTO "public"."platillo" VALUES (50, 3, 3, 'http://loremflickr.com/640/480/food?41113', 'Practical Wooden Bacon', 772);
INSERT INTO "public"."platillo" VALUES (51, 3, 3, 'http://loremflickr.com/640/480/food?43303', 'Bespoke Plastic Chips', 680);
INSERT INTO "public"."platillo" VALUES (52, 3, 3, 'http://loremflickr.com/640/480/food?38507', 'Sleek Steel Car', 473);
INSERT INTO "public"."platillo" VALUES (53, 3, 3, 'http://loremflickr.com/640/480/food?22143', 'Handmade Cotton Chicken', 115);
INSERT INTO "public"."platillo" VALUES (54, 3, 3, 'http://loremflickr.com/640/480/food?43485', 'Ergonomic Metal Bike', 569);
INSERT INTO "public"."platillo" VALUES (55, 3, 3, 'http://loremflickr.com/640/480/food?60534', 'Elegant Rubber Towels', 185);
INSERT INTO "public"."platillo" VALUES (56, 3, 3, 'http://loremflickr.com/640/480/food?16652', 'Refined Wooden Tuna', 699);
INSERT INTO "public"."platillo" VALUES (57, 3, 3, 'http://loremflickr.com/640/480/food?9202', 'Handcrafted Steel Computer', 124);
INSERT INTO "public"."platillo" VALUES (58, 3, 3, 'http://loremflickr.com/640/480/food?98749', 'Incredible Wooden Cheese', 177);
INSERT INTO "public"."platillo" VALUES (59, 3, 3, 'http://loremflickr.com/640/480/food?90044', 'Luxurious Bronze Ball', 398);
INSERT INTO "public"."platillo" VALUES (60, 3, 3, 'http://loremflickr.com/640/480/food?79385', 'Fantastic Cotton Towels', 254);
INSERT INTO "public"."platillo" VALUES (61, 4, 4, 'http://loremflickr.com/640/480/food?7463', 'Sleek Fresh Mouse', 826);
INSERT INTO "public"."platillo" VALUES (62, 4, 4, 'http://loremflickr.com/640/480/food?4201', 'Handmade Wooden Towels', 255);
INSERT INTO "public"."platillo" VALUES (63, 4, 4, 'http://loremflickr.com/640/480/food?84022', 'Awesome Granite Car', 408);
INSERT INTO "public"."platillo" VALUES (64, 4, 4, 'http://loremflickr.com/640/480/food?27261', 'Licensed Fresh Keyboard', 794);
INSERT INTO "public"."platillo" VALUES (65, 4, 4, 'http://loremflickr.com/640/480/food?74910', 'Handmade Cotton Salad', 583);
INSERT INTO "public"."platillo" VALUES (66, 4, 4, 'http://loremflickr.com/640/480/food?13987', 'Small Rubber Sausages', 481);
INSERT INTO "public"."platillo" VALUES (67, 4, 4, 'http://loremflickr.com/640/480/food?12890', 'Awesome Frozen Chicken', 514);
INSERT INTO "public"."platillo" VALUES (68, 4, 4, 'http://loremflickr.com/640/480/food?85568', 'Rustic Metal Sausages', 907);
INSERT INTO "public"."platillo" VALUES (69, 4, 4, 'http://loremflickr.com/640/480/food?30270', 'Refined Concrete Towels', 360);
INSERT INTO "public"."platillo" VALUES (70, 4, 4, 'http://loremflickr.com/640/480/food?35573', 'Generic Bronze Tuna', 994);
INSERT INTO "public"."platillo" VALUES (71, 4, 4, 'http://loremflickr.com/640/480/food?3593', 'Elegant Fresh Computer', 809);
INSERT INTO "public"."platillo" VALUES (72, 4, 4, 'http://loremflickr.com/640/480/food?15429', 'Intelligent Fresh Pizza', 924);
INSERT INTO "public"."platillo" VALUES (73, 4, 4, 'http://loremflickr.com/640/480/food?55836', 'Unbranded Fresh Chair', 387);
INSERT INTO "public"."platillo" VALUES (74, 4, 4, 'http://loremflickr.com/640/480/food?18564', 'Ergonomic Plastic Chair', 217);
INSERT INTO "public"."platillo" VALUES (75, 4, 4, 'http://loremflickr.com/640/480/food?70695', 'Electronic Cotton Table', 497);
INSERT INTO "public"."platillo" VALUES (76, 4, 4, 'http://loremflickr.com/640/480/food?4974', 'Rustic Metal Tuna', 656);
INSERT INTO "public"."platillo" VALUES (77, 4, 4, 'http://loremflickr.com/640/480/food?13411', 'Oriental Plastic Pizza', 568);
INSERT INTO "public"."platillo" VALUES (78, 4, 4, 'http://loremflickr.com/640/480/food?43672', 'Luxurious Metal Fish', 459);
INSERT INTO "public"."platillo" VALUES (79, 4, 4, 'http://loremflickr.com/640/480/food?22370', 'Handcrafted Bronze Chicken', 103);
INSERT INTO "public"."platillo" VALUES (80, 4, 4, 'http://loremflickr.com/640/480/food?2690', 'Small Steel Tuna', 378);
INSERT INTO "public"."platillo" VALUES (81, 5, 5, 'http://loremflickr.com/640/480/food?56415', 'Rustic Rubber Chicken', 847);
INSERT INTO "public"."platillo" VALUES (82, 5, 5, 'http://loremflickr.com/640/480/food?22378', 'Electronic Soft Hat', 29);
INSERT INTO "public"."platillo" VALUES (83, 5, 5, 'http://loremflickr.com/640/480/food?73351', 'Small Metal Chair', 948);
INSERT INTO "public"."platillo" VALUES (84, 5, 5, 'http://loremflickr.com/640/480/food?13448', 'Oriental Wooden Soap', 778);
INSERT INTO "public"."platillo" VALUES (85, 5, 5, 'http://loremflickr.com/640/480/food?25232', 'Bespoke Plastic Gloves', 390);
INSERT INTO "public"."platillo" VALUES (86, 5, 5, 'http://loremflickr.com/640/480/food?51898', 'Generic Wooden Keyboard', 291);
INSERT INTO "public"."platillo" VALUES (87, 5, 5, 'http://loremflickr.com/640/480/food?6782', 'Tasty Metal Chicken', 402);
INSERT INTO "public"."platillo" VALUES (88, 5, 5, 'http://loremflickr.com/640/480/food?63246', 'Generic Soft Keyboard', 915);
INSERT INTO "public"."platillo" VALUES (89, 5, 5, 'http://loremflickr.com/640/480/food?51296', 'Refined Concrete Bacon', 911);
INSERT INTO "public"."platillo" VALUES (90, 5, 5, 'http://loremflickr.com/640/480/food?27542', 'Recycled Bronze Ball', 994);
INSERT INTO "public"."platillo" VALUES (91, 5, 5, 'http://loremflickr.com/640/480/food?31383', 'Refined Concrete Table', 623);
INSERT INTO "public"."platillo" VALUES (92, 5, 5, 'http://loremflickr.com/640/480/food?19832', 'Unbranded Concrete Car', 728);
INSERT INTO "public"."platillo" VALUES (93, 5, 5, 'http://loremflickr.com/640/480/food?13571', 'Tasty Granite Chicken', 571);
INSERT INTO "public"."platillo" VALUES (94, 5, 5, 'http://loremflickr.com/640/480/food?67000', 'Fantastic Rubber Chair', 156);
INSERT INTO "public"."platillo" VALUES (95, 5, 5, 'http://loremflickr.com/640/480/food?80123', 'Fantastic Concrete Mouse', 128);
INSERT INTO "public"."platillo" VALUES (96, 5, 5, 'http://loremflickr.com/640/480/food?26626', 'Luxurious Cotton Fish', 126);
INSERT INTO "public"."platillo" VALUES (97, 5, 5, 'http://loremflickr.com/640/480/food?63390', 'Bespoke Fresh Tuna', 899);
INSERT INTO "public"."platillo" VALUES (98, 5, 5, 'http://loremflickr.com/640/480/food?84788', 'Generic Metal Keyboard', 354);
INSERT INTO "public"."platillo" VALUES (99, 5, 5, 'http://loremflickr.com/640/480/food?64279', 'Generic Granite Tuna', 706);
INSERT INTO "public"."platillo" VALUES (100, 5, 5, 'http://loremflickr.com/640/480/food?87032', 'Unbranded Plastic Mouse', 728);
INSERT INTO "public"."platillo" VALUES (101, 6, 6, 'http://loremflickr.com/640/480/food?29680', 'Unbranded Rubber Shoes', 768);
INSERT INTO "public"."platillo" VALUES (102, 6, 6, 'http://loremflickr.com/640/480/food?29518', 'Intelligent Plastic Bacon', 213);
INSERT INTO "public"."platillo" VALUES (103, 6, 6, 'http://loremflickr.com/640/480/food?13130', 'Ergonomic Granite Table', 976);
INSERT INTO "public"."platillo" VALUES (104, 6, 6, 'http://loremflickr.com/640/480/food?19612', 'Elegant Bronze Pizza', 976);
INSERT INTO "public"."platillo" VALUES (105, 6, 6, 'http://loremflickr.com/640/480/food?68011', 'Fantastic Fresh Pizza', 244);
INSERT INTO "public"."platillo" VALUES (106, 6, 6, 'http://loremflickr.com/640/480/food?73396', 'Gorgeous Cotton Gloves', 47);
INSERT INTO "public"."platillo" VALUES (107, 6, 6, 'http://loremflickr.com/640/480/food?88616', 'Handcrafted Metal Keyboard', 784);
INSERT INTO "public"."platillo" VALUES (108, 6, 6, 'http://loremflickr.com/640/480/food?10623', 'Bespoke Metal Fish', 313);
INSERT INTO "public"."platillo" VALUES (109, 6, 6, 'http://loremflickr.com/640/480/food?92796', 'Licensed Fresh Keyboard', 823);
INSERT INTO "public"."platillo" VALUES (110, 6, 6, 'http://loremflickr.com/640/480/food?46785', 'Practical Rubber Chips', 314);
INSERT INTO "public"."platillo" VALUES (111, 6, 6, 'http://loremflickr.com/640/480/food?74722', 'Licensed Metal Hat', 763);
INSERT INTO "public"."platillo" VALUES (112, 6, 6, 'http://loremflickr.com/640/480/food?21624', 'Refined Soft Shirt', 808);
INSERT INTO "public"."platillo" VALUES (113, 6, 6, 'http://loremflickr.com/640/480/food?41365', 'Licensed Fresh Chips', 811);
INSERT INTO "public"."platillo" VALUES (114, 6, 6, 'http://loremflickr.com/640/480/food?38028', 'Luxurious Steel Keyboard', 534);
INSERT INTO "public"."platillo" VALUES (115, 6, 6, 'http://loremflickr.com/640/480/food?72880', 'Gorgeous Rubber Salad', 579);
INSERT INTO "public"."platillo" VALUES (116, 6, 6, 'http://loremflickr.com/640/480/food?89204', 'Fantastic Wooden Hat', 520);
INSERT INTO "public"."platillo" VALUES (117, 6, 6, 'http://loremflickr.com/640/480/food?77074', 'Elegant Concrete Salad', 224);
INSERT INTO "public"."platillo" VALUES (118, 6, 6, 'http://loremflickr.com/640/480/food?65839', 'Licensed Plastic Tuna', 263);
INSERT INTO "public"."platillo" VALUES (119, 6, 6, 'http://loremflickr.com/640/480/food?56535', 'Intelligent Granite Chips', 231);
INSERT INTO "public"."platillo" VALUES (120, 6, 6, 'http://loremflickr.com/640/480/food?32383', 'Elegant Steel Mouse', 73);
INSERT INTO "public"."platillo" VALUES (121, 7, 7, 'http://loremflickr.com/640/480/food?5960', 'Oriental Steel Chicken', 838);
INSERT INTO "public"."platillo" VALUES (122, 7, 7, 'http://loremflickr.com/640/480/food?31309', 'Licensed Bronze Table', 727);
INSERT INTO "public"."platillo" VALUES (123, 7, 7, 'http://loremflickr.com/640/480/food?47093', 'Sleek Bronze Chips', 746);
INSERT INTO "public"."platillo" VALUES (124, 7, 7, 'http://loremflickr.com/640/480/food?65789', 'Recycled Metal Ball', 966);
INSERT INTO "public"."platillo" VALUES (125, 7, 7, 'http://loremflickr.com/640/480/food?24276', 'Handcrafted Cotton Mouse', 341);
INSERT INTO "public"."platillo" VALUES (126, 7, 7, 'http://loremflickr.com/640/480/food?66194', 'Modern Metal Chicken', 683);
INSERT INTO "public"."platillo" VALUES (127, 7, 7, 'http://loremflickr.com/640/480/food?50996', 'Handmade Concrete Keyboard', 374);
INSERT INTO "public"."platillo" VALUES (128, 7, 7, 'http://loremflickr.com/640/480/food?8571', 'Practical Wooden Chips', 392);
INSERT INTO "public"."platillo" VALUES (129, 7, 7, 'http://loremflickr.com/640/480/food?62723', 'Awesome Rubber Computer', 678);
INSERT INTO "public"."platillo" VALUES (130, 7, 7, 'http://loremflickr.com/640/480/food?46974', 'Unbranded Plastic Towels', 155);
INSERT INTO "public"."platillo" VALUES (131, 7, 7, 'http://loremflickr.com/640/480/food?96884', 'Small Cotton Computer', 263);
INSERT INTO "public"."platillo" VALUES (132, 7, 7, 'http://loremflickr.com/640/480/food?51281', 'Incredible Cotton Ball', 881);
INSERT INTO "public"."platillo" VALUES (133, 7, 7, 'http://loremflickr.com/640/480/food?37707', 'Practical Rubber Towels', 479);
INSERT INTO "public"."platillo" VALUES (134, 7, 7, 'http://loremflickr.com/640/480/food?72002', 'Oriental Metal Table', 177);
INSERT INTO "public"."platillo" VALUES (135, 7, 7, 'http://loremflickr.com/640/480/food?98714', 'Bespoke Metal Soap', 714);
INSERT INTO "public"."platillo" VALUES (136, 7, 7, 'http://loremflickr.com/640/480/food?8972', 'Luxurious Bronze Hat', 890);
INSERT INTO "public"."platillo" VALUES (137, 7, 7, 'http://loremflickr.com/640/480/food?60227', 'Modern Frozen Computer', 841);
INSERT INTO "public"."platillo" VALUES (138, 7, 7, 'http://loremflickr.com/640/480/food?7421', 'Tasty Fresh Chips', 734);
INSERT INTO "public"."platillo" VALUES (139, 7, 7, 'http://loremflickr.com/640/480/food?95891', 'Ergonomic Wooden Table', 816);
INSERT INTO "public"."platillo" VALUES (140, 7, 7, 'http://loremflickr.com/640/480/food?62730', 'Unbranded Cotton Mouse', 541);
INSERT INTO "public"."platillo" VALUES (141, 8, 8, 'http://loremflickr.com/640/480/food?2986', 'Fantastic Concrete Computer', 13);
INSERT INTO "public"."platillo" VALUES (142, 8, 8, 'http://loremflickr.com/640/480/food?14686', 'Awesome Concrete Fish', 955);
INSERT INTO "public"."platillo" VALUES (143, 8, 8, 'http://loremflickr.com/640/480/food?22230', 'Modern Soft Keyboard', 652);
INSERT INTO "public"."platillo" VALUES (144, 8, 8, 'http://loremflickr.com/640/480/food?46804', 'Electronic Rubber Table', 749);
INSERT INTO "public"."platillo" VALUES (145, 8, 8, 'http://loremflickr.com/640/480/food?1134', 'Small Soft Mouse', 592);
INSERT INTO "public"."platillo" VALUES (146, 8, 8, 'http://loremflickr.com/640/480/food?72500', 'Incredible Concrete Chicken', 931);
INSERT INTO "public"."platillo" VALUES (147, 8, 8, 'http://loremflickr.com/640/480/food?84828', 'Handcrafted Soft Hat', 735);
INSERT INTO "public"."platillo" VALUES (148, 8, 8, 'http://loremflickr.com/640/480/food?90343', 'Fantastic Rubber Bike', 395);
INSERT INTO "public"."platillo" VALUES (149, 8, 8, 'http://loremflickr.com/640/480/food?53085', 'Awesome Rubber Gloves', 33);
INSERT INTO "public"."platillo" VALUES (150, 8, 8, 'http://loremflickr.com/640/480/food?1193', 'Handmade Plastic Shoes', 506);
INSERT INTO "public"."platillo" VALUES (151, 8, 8, 'http://loremflickr.com/640/480/food?34514', 'Intelligent Frozen Shoes', 693);
INSERT INTO "public"."platillo" VALUES (152, 8, 8, 'http://loremflickr.com/640/480/food?56721', 'Unbranded Rubber Bacon', 51);
INSERT INTO "public"."platillo" VALUES (153, 8, 8, 'http://loremflickr.com/640/480/food?11154', 'Rustic Frozen Salad', 118);
INSERT INTO "public"."platillo" VALUES (154, 8, 8, 'http://loremflickr.com/640/480/food?32576', 'Handmade Metal Salad', 922);
INSERT INTO "public"."platillo" VALUES (155, 8, 8, 'http://loremflickr.com/640/480/food?69512', 'Awesome Granite Table', 177);
INSERT INTO "public"."platillo" VALUES (156, 8, 8, 'http://loremflickr.com/640/480/food?79056', 'Gorgeous Metal Fish', 385);
INSERT INTO "public"."platillo" VALUES (157, 8, 8, 'http://loremflickr.com/640/480/food?86887', 'Ergonomic Bronze Chicken', 670);
INSERT INTO "public"."platillo" VALUES (158, 8, 8, 'http://loremflickr.com/640/480/food?37608', 'Recycled Bronze Ball', 192);
INSERT INTO "public"."platillo" VALUES (159, 8, 8, 'http://loremflickr.com/640/480/food?13050', 'Incredible Frozen Mouse', 327);
INSERT INTO "public"."platillo" VALUES (160, 8, 8, 'http://loremflickr.com/640/480/food?70183', 'Oriental Frozen Shirt', 362);
INSERT INTO "public"."platillo" VALUES (161, 9, 9, 'http://loremflickr.com/640/480/food?96879', 'Bespoke Wooden Mouse', 575);
INSERT INTO "public"."platillo" VALUES (162, 9, 9, 'http://loremflickr.com/640/480/food?67857', 'Electronic Concrete Hat', 619);
INSERT INTO "public"."platillo" VALUES (163, 9, 9, 'http://loremflickr.com/640/480/food?46764', 'Sleek Concrete Cheese', 247);
INSERT INTO "public"."platillo" VALUES (164, 9, 9, 'http://loremflickr.com/640/480/food?59543', 'Intelligent Granite Towels', 28);
INSERT INTO "public"."platillo" VALUES (165, 9, 9, 'http://loremflickr.com/640/480/food?21510', 'Recycled Soft Pizza', 611);
INSERT INTO "public"."platillo" VALUES (166, 9, 9, 'http://loremflickr.com/640/480/food?8947', 'Recycled Fresh Shoes', 77);
INSERT INTO "public"."platillo" VALUES (167, 9, 9, 'http://loremflickr.com/640/480/food?60812', 'Rustic Wooden Gloves', 793);
INSERT INTO "public"."platillo" VALUES (168, 9, 9, 'http://loremflickr.com/640/480/food?99776', 'Tasty Bronze Soap', 682);
INSERT INTO "public"."platillo" VALUES (169, 9, 9, 'http://loremflickr.com/640/480/food?86426', 'Refined Cotton Bike', 303);
INSERT INTO "public"."platillo" VALUES (170, 9, 9, 'http://loremflickr.com/640/480/food?38475', 'Intelligent Granite Salad', 461);
INSERT INTO "public"."platillo" VALUES (171, 9, 9, 'http://loremflickr.com/640/480/food?95546', 'Elegant Metal Bacon', 282);
INSERT INTO "public"."platillo" VALUES (172, 9, 9, 'http://loremflickr.com/640/480/food?88364', 'Practical Cotton Bike', 734);
INSERT INTO "public"."platillo" VALUES (173, 9, 9, 'http://loremflickr.com/640/480/food?13030', 'Oriental Plastic Shirt', 100);
INSERT INTO "public"."platillo" VALUES (174, 9, 9, 'http://loremflickr.com/640/480/food?25784', 'Tasty Fresh Table', 229);
INSERT INTO "public"."platillo" VALUES (175, 9, 9, 'http://loremflickr.com/640/480/food?68273', 'Handmade Frozen Soap', 473);
INSERT INTO "public"."platillo" VALUES (176, 9, 9, 'http://loremflickr.com/640/480/food?43068', 'Electronic Granite Computer', 657);
INSERT INTO "public"."platillo" VALUES (177, 9, 9, 'http://loremflickr.com/640/480/food?85080', 'Awesome Concrete Computer', 190);
INSERT INTO "public"."platillo" VALUES (178, 9, 9, 'http://loremflickr.com/640/480/food?38471', 'Rustic Fresh Tuna', 372);
INSERT INTO "public"."platillo" VALUES (179, 9, 9, 'http://loremflickr.com/640/480/food?24961', 'Sleek Frozen Tuna', 355);
INSERT INTO "public"."platillo" VALUES (180, 9, 9, 'http://loremflickr.com/640/480/food?2623', 'Fantastic Granite Computer', 412);
INSERT INTO "public"."platillo" VALUES (181, 10, 10, 'http://loremflickr.com/640/480/food?61842', 'Small Fresh Chips', 333);
INSERT INTO "public"."platillo" VALUES (182, 10, 10, 'http://loremflickr.com/640/480/food?17800', 'Handmade Plastic Chair', 324);
INSERT INTO "public"."platillo" VALUES (183, 10, 10, 'http://loremflickr.com/640/480/food?71047', 'Licensed Concrete Gloves', 831);
INSERT INTO "public"."platillo" VALUES (184, 10, 10, 'http://loremflickr.com/640/480/food?49091', 'Unbranded Metal Cheese', 389);
INSERT INTO "public"."platillo" VALUES (185, 10, 10, 'http://loremflickr.com/640/480/food?94964', 'Practical Frozen Shoes', 957);
INSERT INTO "public"."platillo" VALUES (186, 10, 10, 'http://loremflickr.com/640/480/food?93235', 'Licensed Rubber Mouse', 512);
INSERT INTO "public"."platillo" VALUES (187, 10, 10, 'http://loremflickr.com/640/480/food?86900', 'Unbranded Metal Shoes', 641);
INSERT INTO "public"."platillo" VALUES (188, 10, 10, 'http://loremflickr.com/640/480/food?52434', 'Oriental Fresh Chips', 463);
INSERT INTO "public"."platillo" VALUES (189, 10, 10, 'http://loremflickr.com/640/480/food?18204', 'Licensed Plastic Sausages', 669);
INSERT INTO "public"."platillo" VALUES (190, 10, 10, 'http://loremflickr.com/640/480/food?33403', 'Handmade Plastic Ball', 535);
INSERT INTO "public"."platillo" VALUES (191, 10, 10, 'http://loremflickr.com/640/480/food?31015', 'Electronic Frozen Car', 358);
INSERT INTO "public"."platillo" VALUES (192, 10, 10, 'http://loremflickr.com/640/480/food?3685', 'Recycled Frozen Hat', 980);
INSERT INTO "public"."platillo" VALUES (193, 10, 10, 'http://loremflickr.com/640/480/food?1057', 'Handmade Bronze Bacon', 54);
INSERT INTO "public"."platillo" VALUES (194, 10, 10, 'http://loremflickr.com/640/480/food?38585', 'Unbranded Metal Pizza', 218);
INSERT INTO "public"."platillo" VALUES (195, 10, 10, 'http://loremflickr.com/640/480/food?19997', 'Elegant Metal Hat', 759);
INSERT INTO "public"."platillo" VALUES (196, 10, 10, 'http://loremflickr.com/640/480/food?69365', 'Luxurious Plastic Pizza', 476);
INSERT INTO "public"."platillo" VALUES (197, 10, 10, 'http://loremflickr.com/640/480/food?82408', 'Awesome Metal Towels', 727);
INSERT INTO "public"."platillo" VALUES (198, 10, 10, 'http://loremflickr.com/640/480/food?74613', 'Licensed Soft Tuna', 126);
INSERT INTO "public"."platillo" VALUES (199, 10, 10, 'http://loremflickr.com/640/480/food?58922', 'Tasty Plastic Chips', 799);
INSERT INTO "public"."platillo" VALUES (200, 10, 10, 'http://loremflickr.com/640/480/food?7780', 'Ergonomic Metal Salad', 481);
INSERT INTO "public"."platillo" VALUES (201, 11, 11, 'http://loremflickr.com/640/480/food?98936', 'Fantastic Concrete Pizza', 824);
INSERT INTO "public"."platillo" VALUES (202, 11, 11, 'http://loremflickr.com/640/480/food?79586', 'Gorgeous Wooden Table', 960);
INSERT INTO "public"."platillo" VALUES (203, 11, 11, 'http://loremflickr.com/640/480/food?8471', 'Sleek Granite Fish', 713);
INSERT INTO "public"."platillo" VALUES (204, 11, 11, 'http://loremflickr.com/640/480/food?39915', 'Luxurious Cotton Shoes', 391);
INSERT INTO "public"."platillo" VALUES (205, 11, 11, 'http://loremflickr.com/640/480/food?20314', 'Sleek Steel Pizza', 331);
INSERT INTO "public"."platillo" VALUES (206, 11, 11, 'http://loremflickr.com/640/480/food?16806', 'Intelligent Metal Towels', 128);
INSERT INTO "public"."platillo" VALUES (207, 11, 11, 'http://loremflickr.com/640/480/food?9279', 'Luxurious Soft Sausages', 51);
INSERT INTO "public"."platillo" VALUES (208, 11, 11, 'http://loremflickr.com/640/480/food?26791', 'Incredible Soft Salad', 376);
INSERT INTO "public"."platillo" VALUES (209, 11, 11, 'http://loremflickr.com/640/480/food?78130', 'Modern Steel Car', 776);
INSERT INTO "public"."platillo" VALUES (210, 11, 11, 'http://loremflickr.com/640/480/food?93833', 'Ergonomic Rubber Gloves', 121);
INSERT INTO "public"."platillo" VALUES (211, 11, 11, 'http://loremflickr.com/640/480/food?87246', 'Intelligent Bronze Bike', 231);
INSERT INTO "public"."platillo" VALUES (212, 11, 11, 'http://loremflickr.com/640/480/food?4806', 'Intelligent Soft Ball', 408);
INSERT INTO "public"."platillo" VALUES (213, 11, 11, 'http://loremflickr.com/640/480/food?51162', 'Rustic Frozen Gloves', 577);
INSERT INTO "public"."platillo" VALUES (214, 11, 11, 'http://loremflickr.com/640/480/food?1363', 'Intelligent Fresh Mouse', 33);
INSERT INTO "public"."platillo" VALUES (215, 11, 11, 'http://loremflickr.com/640/480/food?70649', 'Tasty Soft Bike', 250);
INSERT INTO "public"."platillo" VALUES (216, 11, 11, 'http://loremflickr.com/640/480/food?13629', 'Licensed Granite Shirt', 574);
INSERT INTO "public"."platillo" VALUES (217, 11, 11, 'http://loremflickr.com/640/480/food?56436', 'Refined Wooden Tuna', 892);
INSERT INTO "public"."platillo" VALUES (218, 11, 11, 'http://loremflickr.com/640/480/food?80250', 'Practical Frozen Ball', 877);
INSERT INTO "public"."platillo" VALUES (219, 11, 11, 'http://loremflickr.com/640/480/food?35187', 'Electronic Granite Ball', 247);
INSERT INTO "public"."platillo" VALUES (220, 11, 11, 'http://loremflickr.com/640/480/food?25787', 'Intelligent Plastic Shoes', 31);
INSERT INTO "public"."platillo" VALUES (221, 12, 12, 'http://loremflickr.com/640/480/food?85838', 'Electronic Wooden Chair', 386);
INSERT INTO "public"."platillo" VALUES (222, 12, 12, 'http://loremflickr.com/640/480/food?44645', 'Licensed Frozen Sausages', 439);
INSERT INTO "public"."platillo" VALUES (223, 12, 12, 'http://loremflickr.com/640/480/food?36881', 'Small Rubber Soap', 732);
INSERT INTO "public"."platillo" VALUES (224, 12, 12, 'http://loremflickr.com/640/480/food?63901', 'Generic Plastic Soap', 808);
INSERT INTO "public"."platillo" VALUES (225, 12, 12, 'http://loremflickr.com/640/480/food?69689', 'Licensed Granite Pizza', 731);
INSERT INTO "public"."platillo" VALUES (226, 12, 12, 'http://loremflickr.com/640/480/food?54428', 'Sleek Bronze Pants', 959);
INSERT INTO "public"."platillo" VALUES (227, 12, 12, 'http://loremflickr.com/640/480/food?40737', 'Bespoke Steel Chair', 57);
INSERT INTO "public"."platillo" VALUES (228, 12, 12, 'http://loremflickr.com/640/480/food?54441', 'Incredible Frozen Pants', 373);
INSERT INTO "public"."platillo" VALUES (229, 12, 12, 'http://loremflickr.com/640/480/food?59349', 'Handcrafted Wooden Hat', 111);
INSERT INTO "public"."platillo" VALUES (230, 12, 12, 'http://loremflickr.com/640/480/food?14563', 'Sleek Rubber Chair', 3);
INSERT INTO "public"."platillo" VALUES (231, 12, 12, 'http://loremflickr.com/640/480/food?68890', 'Luxurious Plastic Table', 189);
INSERT INTO "public"."platillo" VALUES (232, 12, 12, 'http://loremflickr.com/640/480/food?32792', 'Sleek Concrete Chips', 21);
INSERT INTO "public"."platillo" VALUES (233, 12, 12, 'http://loremflickr.com/640/480/food?31700', 'Recycled Wooden Table', 372);
INSERT INTO "public"."platillo" VALUES (234, 12, 12, 'http://loremflickr.com/640/480/food?20448', 'Refined Rubber Car', 949);
INSERT INTO "public"."platillo" VALUES (235, 12, 12, 'http://loremflickr.com/640/480/food?9437', 'Incredible Fresh Shirt', 194);
INSERT INTO "public"."platillo" VALUES (236, 12, 12, 'http://loremflickr.com/640/480/food?96260', 'Incredible Fresh Gloves', 810);
INSERT INTO "public"."platillo" VALUES (237, 12, 12, 'http://loremflickr.com/640/480/food?98142', 'Oriental Fresh Shirt', 380);
INSERT INTO "public"."platillo" VALUES (238, 12, 12, 'http://loremflickr.com/640/480/food?13806', 'Sleek Metal Soap', 110);
INSERT INTO "public"."platillo" VALUES (239, 12, 12, 'http://loremflickr.com/640/480/food?94333', 'Unbranded Concrete Salad', 885);
INSERT INTO "public"."platillo" VALUES (240, 12, 12, 'http://loremflickr.com/640/480/food?65055', 'Tasty Steel Chair', 363);
INSERT INTO "public"."platillo" VALUES (241, 13, 13, 'http://loremflickr.com/640/480/food?64224', 'Unbranded Cotton Tuna', 942);
INSERT INTO "public"."platillo" VALUES (242, 13, 13, 'http://loremflickr.com/640/480/food?9857', 'Bespoke Rubber Ball', 964);
INSERT INTO "public"."platillo" VALUES (243, 13, 13, 'http://loremflickr.com/640/480/food?40638', 'Fantastic Bronze Keyboard', 662);
INSERT INTO "public"."platillo" VALUES (244, 13, 13, 'http://loremflickr.com/640/480/food?11261', 'Refined Fresh Pizza', 386);
INSERT INTO "public"."platillo" VALUES (245, 13, 13, 'http://loremflickr.com/640/480/food?87348', 'Handmade Cotton Cheese', 357);
INSERT INTO "public"."platillo" VALUES (246, 13, 13, 'http://loremflickr.com/640/480/food?19864', 'Licensed Rubber Cheese', 420);
INSERT INTO "public"."platillo" VALUES (247, 13, 13, 'http://loremflickr.com/640/480/food?12', 'Luxurious Granite Chips', 38);
INSERT INTO "public"."platillo" VALUES (248, 13, 13, 'http://loremflickr.com/640/480/food?39004', 'Ergonomic Concrete Tuna', 171);
INSERT INTO "public"."platillo" VALUES (249, 13, 13, 'http://loremflickr.com/640/480/food?73231', 'Small Soft Tuna', 682);
INSERT INTO "public"."platillo" VALUES (250, 13, 13, 'http://loremflickr.com/640/480/food?73559', 'Awesome Metal Shoes', 285);
INSERT INTO "public"."platillo" VALUES (251, 13, 13, 'http://loremflickr.com/640/480/food?44245', 'Incredible Metal Salad', 226);
INSERT INTO "public"."platillo" VALUES (252, 13, 13, 'http://loremflickr.com/640/480/food?76391', 'Intelligent Rubber Car', 819);
INSERT INTO "public"."platillo" VALUES (253, 13, 13, 'http://loremflickr.com/640/480/food?92177', 'Sleek Granite Car', 615);
INSERT INTO "public"."platillo" VALUES (254, 13, 13, 'http://loremflickr.com/640/480/food?70221', 'Sleek Rubber Towels', 876);
INSERT INTO "public"."platillo" VALUES (255, 13, 13, 'http://loremflickr.com/640/480/food?12046', 'Incredible Rubber Bike', 18);
INSERT INTO "public"."platillo" VALUES (256, 13, 13, 'http://loremflickr.com/640/480/food?24945', 'Small Granite Shirt', 929);
INSERT INTO "public"."platillo" VALUES (257, 13, 13, 'http://loremflickr.com/640/480/food?4104', 'Gorgeous Plastic Cheese', 569);
INSERT INTO "public"."platillo" VALUES (258, 13, 13, 'http://loremflickr.com/640/480/food?59812', 'Generic Wooden Mouse', 773);
INSERT INTO "public"."platillo" VALUES (259, 13, 13, 'http://loremflickr.com/640/480/food?97515', 'Sleek Plastic Computer', 625);
INSERT INTO "public"."platillo" VALUES (260, 13, 13, 'http://loremflickr.com/640/480/food?86111', 'Recycled Plastic Soap', 496);
INSERT INTO "public"."platillo" VALUES (261, 14, 14, 'http://loremflickr.com/640/480/food?56963', 'Bespoke Wooden Hat', 466);
INSERT INTO "public"."platillo" VALUES (262, 14, 14, 'http://loremflickr.com/640/480/food?79465', 'Refined Bronze Shirt', 215);
INSERT INTO "public"."platillo" VALUES (263, 14, 14, 'http://loremflickr.com/640/480/food?60372', 'Refined Soft Chair', 978);
INSERT INTO "public"."platillo" VALUES (264, 14, 14, 'http://loremflickr.com/640/480/food?32369', 'Fantastic Concrete Shirt', 731);
INSERT INTO "public"."platillo" VALUES (265, 14, 14, 'http://loremflickr.com/640/480/food?59196', 'Luxurious Frozen Pizza', 537);
INSERT INTO "public"."platillo" VALUES (266, 14, 14, 'http://loremflickr.com/640/480/food?29759', 'Generic Soft Bike', 704);
INSERT INTO "public"."platillo" VALUES (267, 14, 14, 'http://loremflickr.com/640/480/food?26704', 'Modern Frozen Soap', 404);
INSERT INTO "public"."platillo" VALUES (268, 14, 14, 'http://loremflickr.com/640/480/food?58616', 'Bespoke Wooden Mouse', 367);
INSERT INTO "public"."platillo" VALUES (269, 14, 14, 'http://loremflickr.com/640/480/food?37124', 'Generic Bronze Chair', 280);
INSERT INTO "public"."platillo" VALUES (270, 14, 14, 'http://loremflickr.com/640/480/food?32836', 'Modern Metal Tuna', 200);
INSERT INTO "public"."platillo" VALUES (271, 14, 14, 'http://loremflickr.com/640/480/food?70445', 'Incredible Fresh Cheese', 15);
INSERT INTO "public"."platillo" VALUES (272, 14, 14, 'http://loremflickr.com/640/480/food?98999', 'Gorgeous Concrete Keyboard', 511);
INSERT INTO "public"."platillo" VALUES (273, 14, 14, 'http://loremflickr.com/640/480/food?67498', 'Incredible Metal Gloves', 661);
INSERT INTO "public"."platillo" VALUES (274, 14, 14, 'http://loremflickr.com/640/480/food?33254', 'Fantastic Concrete Sausages', 877);
INSERT INTO "public"."platillo" VALUES (275, 14, 14, 'http://loremflickr.com/640/480/food?53551', 'Rustic Metal Soap', 324);
INSERT INTO "public"."platillo" VALUES (276, 14, 14, 'http://loremflickr.com/640/480/food?48520', 'Tasty Frozen Car', 589);
INSERT INTO "public"."platillo" VALUES (277, 14, 14, 'http://loremflickr.com/640/480/food?86631', 'Bespoke Frozen Car', 218);
INSERT INTO "public"."platillo" VALUES (278, 14, 14, 'http://loremflickr.com/640/480/food?66605', 'Elegant Rubber Bike', 261);
INSERT INTO "public"."platillo" VALUES (279, 14, 14, 'http://loremflickr.com/640/480/food?8337', 'Awesome Fresh Cheese', 441);
INSERT INTO "public"."platillo" VALUES (280, 14, 14, 'http://loremflickr.com/640/480/food?16477', 'Handmade Fresh Chicken', 731);
INSERT INTO "public"."platillo" VALUES (281, 15, 15, 'http://loremflickr.com/640/480/food?7842', 'Rustic Metal Tuna', 142);
INSERT INTO "public"."platillo" VALUES (282, 15, 15, 'http://loremflickr.com/640/480/food?12859', 'Modern Concrete Fish', 761);
INSERT INTO "public"."platillo" VALUES (283, 15, 15, 'http://loremflickr.com/640/480/food?54077', 'Recycled Granite Mouse', 172);
INSERT INTO "public"."platillo" VALUES (284, 15, 15, 'http://loremflickr.com/640/480/food?5543', 'Licensed Fresh Mouse', 530);
INSERT INTO "public"."platillo" VALUES (285, 15, 15, 'http://loremflickr.com/640/480/food?36507', 'Oriental Fresh Chips', 965);
INSERT INTO "public"."platillo" VALUES (286, 15, 15, 'http://loremflickr.com/640/480/food?49430', 'Oriental Concrete Pants', 136);
INSERT INTO "public"."platillo" VALUES (287, 15, 15, 'http://loremflickr.com/640/480/food?56162', 'Handcrafted Wooden Chips', 39);
INSERT INTO "public"."platillo" VALUES (288, 15, 15, 'http://loremflickr.com/640/480/food?12920', 'Modern Concrete Hat', 53);
INSERT INTO "public"."platillo" VALUES (289, 15, 15, 'http://loremflickr.com/640/480/food?61391', 'Gorgeous Frozen Pizza', 332);
INSERT INTO "public"."platillo" VALUES (290, 15, 15, 'http://loremflickr.com/640/480/food?18143', 'Handmade Concrete Chips', 464);
INSERT INTO "public"."platillo" VALUES (291, 15, 15, 'http://loremflickr.com/640/480/food?89061', 'Licensed Concrete Bacon', 835);
INSERT INTO "public"."platillo" VALUES (292, 15, 15, 'http://loremflickr.com/640/480/food?58830', 'Small Rubber Bacon', 837);
INSERT INTO "public"."platillo" VALUES (293, 15, 15, 'http://loremflickr.com/640/480/food?25409', 'Sleek Concrete Shoes', 121);
INSERT INTO "public"."platillo" VALUES (294, 15, 15, 'http://loremflickr.com/640/480/food?81776', 'Electronic Fresh Fish', 779);
INSERT INTO "public"."platillo" VALUES (295, 15, 15, 'http://loremflickr.com/640/480/food?30330', 'Oriental Soft Chips', 30);
INSERT INTO "public"."platillo" VALUES (296, 15, 15, 'http://loremflickr.com/640/480/food?69233', 'Fantastic Granite Tuna', 181);
INSERT INTO "public"."platillo" VALUES (297, 15, 15, 'http://loremflickr.com/640/480/food?28470', 'Incredible Concrete Sausages', 459);
INSERT INTO "public"."platillo" VALUES (298, 15, 15, 'http://loremflickr.com/640/480/food?96444', 'Recycled Cotton Soap', 573);
INSERT INTO "public"."platillo" VALUES (299, 15, 15, 'http://loremflickr.com/640/480/food?63301', 'Unbranded Concrete Keyboard', 285);
INSERT INTO "public"."platillo" VALUES (300, 15, 15, 'http://loremflickr.com/640/480/food?36064', 'Recycled Steel Sausages', 977);
INSERT INTO "public"."platillo" VALUES (301, 16, 16, 'http://loremflickr.com/640/480/food?41599', 'Luxurious Bronze Shirt', 414);
INSERT INTO "public"."platillo" VALUES (302, 16, 16, 'http://loremflickr.com/640/480/food?69919', 'Incredible Metal Cheese', 626);
INSERT INTO "public"."platillo" VALUES (303, 16, 16, 'http://loremflickr.com/640/480/food?98016', 'Licensed Wooden Salad', 491);
INSERT INTO "public"."platillo" VALUES (304, 16, 16, 'http://loremflickr.com/640/480/food?17033', 'Sleek Wooden Shoes', 211);
INSERT INTO "public"."platillo" VALUES (305, 16, 16, 'http://loremflickr.com/640/480/food?20801', 'Fantastic Rubber Sausages', 60);
INSERT INTO "public"."platillo" VALUES (306, 16, 16, 'http://loremflickr.com/640/480/food?39690', 'Gorgeous Soft Pizza', 578);
INSERT INTO "public"."platillo" VALUES (307, 16, 16, 'http://loremflickr.com/640/480/food?14145', 'Awesome Frozen Computer', 918);
INSERT INTO "public"."platillo" VALUES (308, 16, 16, 'http://loremflickr.com/640/480/food?88362', 'Ergonomic Concrete Chicken', 955);
INSERT INTO "public"."platillo" VALUES (309, 16, 16, 'http://loremflickr.com/640/480/food?47479', 'Rustic Rubber Bacon', 758);
INSERT INTO "public"."platillo" VALUES (310, 16, 16, 'http://loremflickr.com/640/480/food?60283', 'Practical Plastic Cheese', 61);
INSERT INTO "public"."platillo" VALUES (311, 16, 16, 'http://loremflickr.com/640/480/food?53876', 'Small Steel Fish', 228);
INSERT INTO "public"."platillo" VALUES (312, 16, 16, 'http://loremflickr.com/640/480/food?19887', 'Oriental Frozen Shoes', 231);
INSERT INTO "public"."platillo" VALUES (313, 16, 16, 'http://loremflickr.com/640/480/food?96849', 'Refined Cotton Computer', 156);
INSERT INTO "public"."platillo" VALUES (314, 16, 16, 'http://loremflickr.com/640/480/food?1245', 'Generic Frozen Sausages', 12);
INSERT INTO "public"."platillo" VALUES (315, 16, 16, 'http://loremflickr.com/640/480/food?81662', 'Fantastic Granite Ball', 819);
INSERT INTO "public"."platillo" VALUES (316, 16, 16, 'http://loremflickr.com/640/480/food?79874', 'Handcrafted Cotton Mouse', 628);
INSERT INTO "public"."platillo" VALUES (317, 16, 16, 'http://loremflickr.com/640/480/food?93748', 'Fantastic Soft Tuna', 649);
INSERT INTO "public"."platillo" VALUES (318, 16, 16, 'http://loremflickr.com/640/480/food?60013', 'Incredible Wooden Chair', 637);
INSERT INTO "public"."platillo" VALUES (319, 16, 16, 'http://loremflickr.com/640/480/food?75798', 'Oriental Rubber Mouse', 314);
INSERT INTO "public"."platillo" VALUES (320, 16, 16, 'http://loremflickr.com/640/480/food?30129', 'Unbranded Rubber Soap', 571);
INSERT INTO "public"."platillo" VALUES (321, 17, 17, 'http://loremflickr.com/640/480/food?25154', 'Recycled Wooden Pizza', 480);
INSERT INTO "public"."platillo" VALUES (322, 17, 17, 'http://loremflickr.com/640/480/food?10033', 'Fantastic Metal Tuna', 815);
INSERT INTO "public"."platillo" VALUES (323, 17, 17, 'http://loremflickr.com/640/480/food?93801', 'Generic Bronze Car', 23);
INSERT INTO "public"."platillo" VALUES (324, 17, 17, 'http://loremflickr.com/640/480/food?56005', 'Unbranded Fresh Ball', 418);
INSERT INTO "public"."platillo" VALUES (325, 17, 17, 'http://loremflickr.com/640/480/food?28982', 'Intelligent Concrete Pizza', 515);
INSERT INTO "public"."platillo" VALUES (326, 17, 17, 'http://loremflickr.com/640/480/food?20552', 'Recycled Rubber Sausages', 126);
INSERT INTO "public"."platillo" VALUES (327, 17, 17, 'http://loremflickr.com/640/480/food?36856', 'Fantastic Soft Tuna', 981);
INSERT INTO "public"."platillo" VALUES (328, 17, 17, 'http://loremflickr.com/640/480/food?94780', 'Electronic Bronze Ball', 27);
INSERT INTO "public"."platillo" VALUES (329, 17, 17, 'http://loremflickr.com/640/480/food?71052', 'Intelligent Wooden Sausages', 455);
INSERT INTO "public"."platillo" VALUES (330, 17, 17, 'http://loremflickr.com/640/480/food?34349', 'Sleek Concrete Hat', 240);
INSERT INTO "public"."platillo" VALUES (331, 17, 17, 'http://loremflickr.com/640/480/food?35529', 'Handmade Steel Bike', 673);
INSERT INTO "public"."platillo" VALUES (332, 17, 17, 'http://loremflickr.com/640/480/food?71272', 'Recycled Granite Towels', 516);
INSERT INTO "public"."platillo" VALUES (333, 17, 17, 'http://loremflickr.com/640/480/food?55607', 'Rustic Fresh Salad', 334);
INSERT INTO "public"."platillo" VALUES (334, 17, 17, 'http://loremflickr.com/640/480/food?42165', 'Intelligent Granite Bike', 505);
INSERT INTO "public"."platillo" VALUES (335, 17, 17, 'http://loremflickr.com/640/480/food?78130', 'Luxurious Bronze Chips', 180);
INSERT INTO "public"."platillo" VALUES (336, 17, 17, 'http://loremflickr.com/640/480/food?69661', 'Elegant Rubber Fish', 201);
INSERT INTO "public"."platillo" VALUES (337, 17, 17, 'http://loremflickr.com/640/480/food?62039', 'Intelligent Soft Ball', 570);
INSERT INTO "public"."platillo" VALUES (338, 17, 17, 'http://loremflickr.com/640/480/food?87308', 'Incredible Fresh Chair', 696);
INSERT INTO "public"."platillo" VALUES (339, 17, 17, 'http://loremflickr.com/640/480/food?44828', 'Recycled Steel Cheese', 181);
INSERT INTO "public"."platillo" VALUES (340, 17, 17, 'http://loremflickr.com/640/480/food?46965', 'Ergonomic Concrete Shirt', 491);
INSERT INTO "public"."platillo" VALUES (341, 18, 18, 'http://loremflickr.com/640/480/food?57769', 'Ergonomic Wooden Soap', 528);
INSERT INTO "public"."platillo" VALUES (342, 18, 18, 'http://loremflickr.com/640/480/food?9903', 'Licensed Plastic Mouse', 759);
INSERT INTO "public"."platillo" VALUES (343, 18, 18, 'http://loremflickr.com/640/480/food?69348', 'Recycled Granite Towels', 318);
INSERT INTO "public"."platillo" VALUES (344, 18, 18, 'http://loremflickr.com/640/480/food?67374', 'Awesome Rubber Mouse', 967);
INSERT INTO "public"."platillo" VALUES (345, 18, 18, 'http://loremflickr.com/640/480/food?27189', 'Ergonomic Cotton Shirt', 785);
INSERT INTO "public"."platillo" VALUES (346, 18, 18, 'http://loremflickr.com/640/480/food?5429', 'Handcrafted Cotton Chips', 772);
INSERT INTO "public"."platillo" VALUES (347, 18, 18, 'http://loremflickr.com/640/480/food?91673', 'Recycled Bronze Ball', 513);
INSERT INTO "public"."platillo" VALUES (348, 18, 18, 'http://loremflickr.com/640/480/food?23251', 'Generic Metal Ball', 656);
INSERT INTO "public"."platillo" VALUES (349, 18, 18, 'http://loremflickr.com/640/480/food?60673', 'Bespoke Rubber Towels', 190);
INSERT INTO "public"."platillo" VALUES (350, 18, 18, 'http://loremflickr.com/640/480/food?46247', 'Oriental Frozen Towels', 618);
INSERT INTO "public"."platillo" VALUES (351, 18, 18, 'http://loremflickr.com/640/480/food?61180', 'Unbranded Rubber Fish', 120);
INSERT INTO "public"."platillo" VALUES (352, 18, 18, 'http://loremflickr.com/640/480/food?6669', 'Unbranded Steel Keyboard', 144);
INSERT INTO "public"."platillo" VALUES (353, 18, 18, 'http://loremflickr.com/640/480/food?1346', 'Bespoke Plastic Pizza', 920);
INSERT INTO "public"."platillo" VALUES (354, 18, 18, 'http://loremflickr.com/640/480/food?67713', 'Bespoke Plastic Hat', 450);
INSERT INTO "public"."platillo" VALUES (355, 18, 18, 'http://loremflickr.com/640/480/food?67677', 'Handcrafted Granite Fish', 774);
INSERT INTO "public"."platillo" VALUES (356, 18, 18, 'http://loremflickr.com/640/480/food?86295', 'Generic Metal Towels', 684);
INSERT INTO "public"."platillo" VALUES (357, 18, 18, 'http://loremflickr.com/640/480/food?63282', 'Small Soft Mouse', 639);
INSERT INTO "public"."platillo" VALUES (358, 18, 18, 'http://loremflickr.com/640/480/food?52278', 'Handmade Granite Keyboard', 747);
INSERT INTO "public"."platillo" VALUES (359, 18, 18, 'http://loremflickr.com/640/480/food?36754', 'Tasty Cotton Keyboard', 277);
INSERT INTO "public"."platillo" VALUES (360, 18, 18, 'http://loremflickr.com/640/480/food?13744', 'Elegant Wooden Car', 469);
INSERT INTO "public"."platillo" VALUES (361, 19, 19, 'http://loremflickr.com/640/480/food?12942', 'Unbranded Wooden Shoes', 239);
INSERT INTO "public"."platillo" VALUES (362, 19, 19, 'http://loremflickr.com/640/480/food?33246', 'Generic Fresh Cheese', 743);
INSERT INTO "public"."platillo" VALUES (363, 19, 19, 'http://loremflickr.com/640/480/food?35512', 'Handcrafted Rubber Gloves', 746);
INSERT INTO "public"."platillo" VALUES (364, 19, 19, 'http://loremflickr.com/640/480/food?93976', 'Handmade Soft Chips', 429);
INSERT INTO "public"."platillo" VALUES (365, 19, 19, 'http://loremflickr.com/640/480/food?91327', 'Rustic Rubber Shoes', 317);
INSERT INTO "public"."platillo" VALUES (366, 19, 19, 'http://loremflickr.com/640/480/food?20766', 'Practical Steel Shoes', 842);
INSERT INTO "public"."platillo" VALUES (367, 19, 19, 'http://loremflickr.com/640/480/food?69721', 'Bespoke Concrete Bike', 305);
INSERT INTO "public"."platillo" VALUES (368, 19, 19, 'http://loremflickr.com/640/480/food?36514', 'Small Plastic Chair', 509);
INSERT INTO "public"."platillo" VALUES (369, 19, 19, 'http://loremflickr.com/640/480/food?27019', 'Handmade Steel Table', 950);
INSERT INTO "public"."platillo" VALUES (370, 19, 19, 'http://loremflickr.com/640/480/food?87890', 'Ergonomic Granite Computer', 495);
INSERT INTO "public"."platillo" VALUES (371, 19, 19, 'http://loremflickr.com/640/480/food?11186', 'Awesome Metal Salad', 377);
INSERT INTO "public"."platillo" VALUES (372, 19, 19, 'http://loremflickr.com/640/480/food?82869', 'Incredible Bronze Shoes', 634);
INSERT INTO "public"."platillo" VALUES (373, 19, 19, 'http://loremflickr.com/640/480/food?11542', 'Incredible Soft Cheese', 515);
INSERT INTO "public"."platillo" VALUES (374, 19, 19, 'http://loremflickr.com/640/480/food?23225', 'Ergonomic Bronze Tuna', 415);
INSERT INTO "public"."platillo" VALUES (375, 19, 19, 'http://loremflickr.com/640/480/food?90143', 'Incredible Metal Table', 881);
INSERT INTO "public"."platillo" VALUES (376, 19, 19, 'http://loremflickr.com/640/480/food?71593', 'Refined Steel Chips', 821);
INSERT INTO "public"."platillo" VALUES (377, 19, 19, 'http://loremflickr.com/640/480/food?76026', 'Gorgeous Bronze Mouse', 224);
INSERT INTO "public"."platillo" VALUES (378, 19, 19, 'http://loremflickr.com/640/480/food?27199', 'Electronic Frozen Chips', 440);
INSERT INTO "public"."platillo" VALUES (379, 19, 19, 'http://loremflickr.com/640/480/food?80347', 'Recycled Fresh Chips', 689);
INSERT INTO "public"."platillo" VALUES (380, 19, 19, 'http://loremflickr.com/640/480/food?53650', 'Electronic Cotton Chicken', 460);
INSERT INTO "public"."platillo" VALUES (381, 20, 20, 'http://loremflickr.com/640/480/food?77400', 'Gorgeous Granite Bacon', 100);
INSERT INTO "public"."platillo" VALUES (382, 20, 20, 'http://loremflickr.com/640/480/food?79795', 'Bespoke Soft Soap', 485);
INSERT INTO "public"."platillo" VALUES (383, 20, 20, 'http://loremflickr.com/640/480/food?4468', 'Refined Fresh Towels', 635);
INSERT INTO "public"."platillo" VALUES (384, 20, 20, 'http://loremflickr.com/640/480/food?9758', 'Small Soft Tuna', 704);
INSERT INTO "public"."platillo" VALUES (385, 20, 20, 'http://loremflickr.com/640/480/food?31885', 'Sleek Concrete Shirt', 539);
INSERT INTO "public"."platillo" VALUES (386, 20, 20, 'http://loremflickr.com/640/480/food?96423', 'Gorgeous Concrete Shoes', 238);
INSERT INTO "public"."platillo" VALUES (387, 20, 20, 'http://loremflickr.com/640/480/food?16808', 'Practical Soft Tuna', 555);
INSERT INTO "public"."platillo" VALUES (388, 20, 20, 'http://loremflickr.com/640/480/food?61492', 'Modern Frozen Tuna', 366);
INSERT INTO "public"."platillo" VALUES (389, 20, 20, 'http://loremflickr.com/640/480/food?56074', 'Electronic Granite Ball', 826);
INSERT INTO "public"."platillo" VALUES (390, 20, 20, 'http://loremflickr.com/640/480/food?94737', 'Handmade Granite Chicken', 972);
INSERT INTO "public"."platillo" VALUES (391, 20, 20, 'http://loremflickr.com/640/480/food?56990', 'Incredible Soft Hat', 356);
INSERT INTO "public"."platillo" VALUES (392, 20, 20, 'http://loremflickr.com/640/480/food?22800', 'Electronic Frozen Chicken', 121);
INSERT INTO "public"."platillo" VALUES (393, 20, 20, 'http://loremflickr.com/640/480/food?52241', 'Tasty Granite Towels', 279);
INSERT INTO "public"."platillo" VALUES (394, 20, 20, 'http://loremflickr.com/640/480/food?82466', 'Awesome Soft Ball', 231);
INSERT INTO "public"."platillo" VALUES (395, 20, 20, 'http://loremflickr.com/640/480/food?91546', 'Ergonomic Fresh Cheese', 52);
INSERT INTO "public"."platillo" VALUES (396, 20, 20, 'http://loremflickr.com/640/480/food?22817', 'Handcrafted Metal Computer', 816);
INSERT INTO "public"."platillo" VALUES (397, 20, 20, 'http://loremflickr.com/640/480/food?84229', 'Luxurious Plastic Gloves', 369);
INSERT INTO "public"."platillo" VALUES (398, 20, 20, 'http://loremflickr.com/640/480/food?88796', 'Handcrafted Plastic Car', 805);
INSERT INTO "public"."platillo" VALUES (399, 20, 20, 'http://loremflickr.com/640/480/food?57220', 'Recycled Bronze Soap', 859);
INSERT INTO "public"."platillo" VALUES (400, 20, 20, 'http://loremflickr.com/640/480/food?15630', 'Generic Concrete Gloves', 566);
INSERT INTO "public"."platillo" VALUES (401, 21, 21, 'http://loremflickr.com/640/480/food?21261', 'Rustic Fresh Ball', 741);
INSERT INTO "public"."platillo" VALUES (402, 21, 21, 'http://loremflickr.com/640/480/food?88094', 'Unbranded Rubber Towels', 288);
INSERT INTO "public"."platillo" VALUES (403, 21, 21, 'http://loremflickr.com/640/480/food?75403', 'Small Concrete Keyboard', 33);
INSERT INTO "public"."platillo" VALUES (404, 21, 21, 'http://loremflickr.com/640/480/food?79901', 'Gorgeous Metal Computer', 543);
INSERT INTO "public"."platillo" VALUES (405, 21, 21, 'http://loremflickr.com/640/480/food?43558', 'Handcrafted Steel Bacon', 489);
INSERT INTO "public"."platillo" VALUES (406, 21, 21, 'http://loremflickr.com/640/480/food?53755', 'Unbranded Wooden Computer', 531);
INSERT INTO "public"."platillo" VALUES (407, 21, 21, 'http://loremflickr.com/640/480/food?94081', 'Bespoke Cotton Pants', 421);
INSERT INTO "public"."platillo" VALUES (408, 21, 21, 'http://loremflickr.com/640/480/food?19695', 'Fantastic Soft Gloves', 478);
INSERT INTO "public"."platillo" VALUES (409, 21, 21, 'http://loremflickr.com/640/480/food?94000', 'Handmade Concrete Fish', 933);
INSERT INTO "public"."platillo" VALUES (410, 21, 21, 'http://loremflickr.com/640/480/food?8525', 'Licensed Concrete Bike', 238);
INSERT INTO "public"."platillo" VALUES (411, 21, 21, 'http://loremflickr.com/640/480/food?95602', 'Fantastic Granite Sausages', 488);
INSERT INTO "public"."platillo" VALUES (412, 21, 21, 'http://loremflickr.com/640/480/food?98449', 'Unbranded Rubber Ball', 140);
INSERT INTO "public"."platillo" VALUES (413, 21, 21, 'http://loremflickr.com/640/480/food?54316', 'Oriental Wooden Shirt', 239);
INSERT INTO "public"."platillo" VALUES (414, 21, 21, 'http://loremflickr.com/640/480/food?19149', 'Licensed Steel Tuna', 928);
INSERT INTO "public"."platillo" VALUES (415, 21, 21, 'http://loremflickr.com/640/480/food?45786', 'Oriental Plastic Chicken', 753);
INSERT INTO "public"."platillo" VALUES (416, 21, 21, 'http://loremflickr.com/640/480/food?89631', 'Generic Soft Shirt', 931);
INSERT INTO "public"."platillo" VALUES (417, 21, 21, 'http://loremflickr.com/640/480/food?73386', 'Luxurious Wooden Bike', 997);
INSERT INTO "public"."platillo" VALUES (418, 21, 21, 'http://loremflickr.com/640/480/food?30459', 'Oriental Concrete Bacon', 946);
INSERT INTO "public"."platillo" VALUES (419, 21, 21, 'http://loremflickr.com/640/480/food?39450', 'Tasty Concrete Hat', 766);
INSERT INTO "public"."platillo" VALUES (420, 21, 21, 'http://loremflickr.com/640/480/food?76945', 'Gorgeous Soft Mouse', 337);
INSERT INTO "public"."platillo" VALUES (421, 22, 22, 'http://loremflickr.com/640/480/food?10972', 'Licensed Metal Pants', 306);
INSERT INTO "public"."platillo" VALUES (422, 22, 22, 'http://loremflickr.com/640/480/food?45226', 'Tasty Rubber Bacon', 269);
INSERT INTO "public"."platillo" VALUES (423, 22, 22, 'http://loremflickr.com/640/480/food?52437', 'Generic Plastic Chips', 344);
INSERT INTO "public"."platillo" VALUES (424, 22, 22, 'http://loremflickr.com/640/480/food?95961', 'Fantastic Plastic Gloves', 421);
INSERT INTO "public"."platillo" VALUES (425, 22, 22, 'http://loremflickr.com/640/480/food?34835', 'Sleek Metal Soap', 285);
INSERT INTO "public"."platillo" VALUES (426, 22, 22, 'http://loremflickr.com/640/480/food?59347', 'Incredible Concrete Chips', 438);
INSERT INTO "public"."platillo" VALUES (427, 22, 22, 'http://loremflickr.com/640/480/food?68689', 'Handmade Wooden Pants', 883);
INSERT INTO "public"."platillo" VALUES (428, 22, 22, 'http://loremflickr.com/640/480/food?21460', 'Rustic Steel Computer', 713);
INSERT INTO "public"."platillo" VALUES (429, 22, 22, 'http://loremflickr.com/640/480/food?94429', 'Bespoke Frozen Shirt', 593);
INSERT INTO "public"."platillo" VALUES (430, 22, 22, 'http://loremflickr.com/640/480/food?11163', 'Unbranded Plastic Mouse', 244);
INSERT INTO "public"."platillo" VALUES (431, 22, 22, 'http://loremflickr.com/640/480/food?44402', 'Generic Fresh Chips', 508);
INSERT INTO "public"."platillo" VALUES (432, 22, 22, 'http://loremflickr.com/640/480/food?85406', 'Handcrafted Cotton Chair', 878);
INSERT INTO "public"."platillo" VALUES (433, 22, 22, 'http://loremflickr.com/640/480/food?93122', 'Handcrafted Metal Shirt', 820);
INSERT INTO "public"."platillo" VALUES (434, 22, 22, 'http://loremflickr.com/640/480/food?10933', 'Tasty Cotton Sausages', 687);
INSERT INTO "public"."platillo" VALUES (435, 22, 22, 'http://loremflickr.com/640/480/food?2432', 'Oriental Granite Computer', 363);
INSERT INTO "public"."platillo" VALUES (436, 22, 22, 'http://loremflickr.com/640/480/food?7704', 'Gorgeous Rubber Car', 477);
INSERT INTO "public"."platillo" VALUES (437, 22, 22, 'http://loremflickr.com/640/480/food?40893', 'Luxurious Bronze Mouse', 240);
INSERT INTO "public"."platillo" VALUES (438, 22, 22, 'http://loremflickr.com/640/480/food?56694', 'Generic Cotton Mouse', 903);
INSERT INTO "public"."platillo" VALUES (439, 22, 22, 'http://loremflickr.com/640/480/food?94583', 'Recycled Wooden Pizza', 712);
INSERT INTO "public"."platillo" VALUES (440, 22, 22, 'http://loremflickr.com/640/480/food?31503', 'Unbranded Plastic Table', 210);
INSERT INTO "public"."platillo" VALUES (441, 23, 23, 'http://loremflickr.com/640/480/food?4744', 'Unbranded Metal Soap', 288);
INSERT INTO "public"."platillo" VALUES (442, 23, 23, 'http://loremflickr.com/640/480/food?15678', 'Elegant Bronze Tuna', 784);
INSERT INTO "public"."platillo" VALUES (443, 23, 23, 'http://loremflickr.com/640/480/food?2603', 'Refined Plastic Chicken', 172);
INSERT INTO "public"."platillo" VALUES (444, 23, 23, 'http://loremflickr.com/640/480/food?7345', 'Generic Soft Shirt', 848);
INSERT INTO "public"."platillo" VALUES (445, 23, 23, 'http://loremflickr.com/640/480/food?60340', 'Bespoke Frozen Chair', 688);
INSERT INTO "public"."platillo" VALUES (446, 23, 23, 'http://loremflickr.com/640/480/food?68958', 'Luxurious Bronze Fish', 919);
INSERT INTO "public"."platillo" VALUES (447, 23, 23, 'http://loremflickr.com/640/480/food?53027', 'Luxurious Steel Table', 807);
INSERT INTO "public"."platillo" VALUES (448, 23, 23, 'http://loremflickr.com/640/480/food?10479', 'Electronic Fresh Ball', 36);
INSERT INTO "public"."platillo" VALUES (449, 23, 23, 'http://loremflickr.com/640/480/food?5416', 'Oriental Plastic Fish', 552);
INSERT INTO "public"."platillo" VALUES (450, 23, 23, 'http://loremflickr.com/640/480/food?26318', 'Practical Granite Chips', 886);
INSERT INTO "public"."platillo" VALUES (451, 23, 23, 'http://loremflickr.com/640/480/food?68838', 'Modern Plastic Keyboard', 772);
INSERT INTO "public"."platillo" VALUES (452, 23, 23, 'http://loremflickr.com/640/480/food?24595', 'Luxurious Bronze Shirt', 295);
INSERT INTO "public"."platillo" VALUES (453, 23, 23, 'http://loremflickr.com/640/480/food?52085', 'Tasty Plastic Gloves', 923);
INSERT INTO "public"."platillo" VALUES (454, 23, 23, 'http://loremflickr.com/640/480/food?98740', 'Bespoke Fresh Salad', 683);
INSERT INTO "public"."platillo" VALUES (455, 23, 23, 'http://loremflickr.com/640/480/food?67926', 'Modern Wooden Gloves', 437);
INSERT INTO "public"."platillo" VALUES (456, 23, 23, 'http://loremflickr.com/640/480/food?83808', 'Ergonomic Soft Gloves', 852);
INSERT INTO "public"."platillo" VALUES (457, 23, 23, 'http://loremflickr.com/640/480/food?63323', 'Practical Granite Cheese', 723);
INSERT INTO "public"."platillo" VALUES (458, 23, 23, 'http://loremflickr.com/640/480/food?82609', 'Licensed Steel Soap', 962);
INSERT INTO "public"."platillo" VALUES (459, 23, 23, 'http://loremflickr.com/640/480/food?16734', 'Small Cotton Ball', 615);
INSERT INTO "public"."platillo" VALUES (460, 23, 23, 'http://loremflickr.com/640/480/food?20696', 'Oriental Metal Keyboard', 482);
INSERT INTO "public"."platillo" VALUES (461, 24, 24, 'http://loremflickr.com/640/480/food?95909', 'Modern Steel Shirt', 889);
INSERT INTO "public"."platillo" VALUES (462, 24, 24, 'http://loremflickr.com/640/480/food?87710', 'Awesome Cotton Shoes', 569);
INSERT INTO "public"."platillo" VALUES (463, 24, 24, 'http://loremflickr.com/640/480/food?52076', 'Incredible Fresh Pizza', 275);
INSERT INTO "public"."platillo" VALUES (464, 24, 24, 'http://loremflickr.com/640/480/food?66448', 'Ergonomic Bronze Sausages', 571);
INSERT INTO "public"."platillo" VALUES (465, 24, 24, 'http://loremflickr.com/640/480/food?66113', 'Handmade Rubber Salad', 505);
INSERT INTO "public"."platillo" VALUES (466, 24, 24, 'http://loremflickr.com/640/480/food?9395', 'Awesome Wooden Sausages', 665);
INSERT INTO "public"."platillo" VALUES (467, 24, 24, 'http://loremflickr.com/640/480/food?18324', 'Handmade Cotton Shirt', 80);
INSERT INTO "public"."platillo" VALUES (468, 24, 24, 'http://loremflickr.com/640/480/food?36279', 'Fantastic Soft Chicken', 881);
INSERT INTO "public"."platillo" VALUES (469, 24, 24, 'http://loremflickr.com/640/480/food?75602', 'Modern Granite Pants', 796);
INSERT INTO "public"."platillo" VALUES (470, 24, 24, 'http://loremflickr.com/640/480/food?7455', 'Tasty Concrete Chicken', 935);
INSERT INTO "public"."platillo" VALUES (471, 24, 24, 'http://loremflickr.com/640/480/food?85885', 'Oriental Plastic Car', 385);
INSERT INTO "public"."platillo" VALUES (472, 24, 24, 'http://loremflickr.com/640/480/food?18096', 'Bespoke Frozen Table', 413);
INSERT INTO "public"."platillo" VALUES (473, 24, 24, 'http://loremflickr.com/640/480/food?45738', 'Elegant Soft Bike', 656);
INSERT INTO "public"."platillo" VALUES (474, 24, 24, 'http://loremflickr.com/640/480/food?77570', 'Fantastic Plastic Tuna', 785);
INSERT INTO "public"."platillo" VALUES (475, 24, 24, 'http://loremflickr.com/640/480/food?15904', 'Elegant Rubber Car', 709);
INSERT INTO "public"."platillo" VALUES (476, 24, 24, 'http://loremflickr.com/640/480/food?70244', 'Small Metal Soap', 443);
INSERT INTO "public"."platillo" VALUES (477, 24, 24, 'http://loremflickr.com/640/480/food?4763', 'Gorgeous Bronze Chicken', 425);
INSERT INTO "public"."platillo" VALUES (478, 24, 24, 'http://loremflickr.com/640/480/food?23', 'Elegant Rubber Cheese', 454);
INSERT INTO "public"."platillo" VALUES (479, 24, 24, 'http://loremflickr.com/640/480/food?69632', 'Incredible Bronze Fish', 73);
INSERT INTO "public"."platillo" VALUES (480, 24, 24, 'http://loremflickr.com/640/480/food?70808', 'Small Bronze Computer', 623);
INSERT INTO "public"."platillo" VALUES (481, 25, 25, 'http://loremflickr.com/640/480/food?26914', 'Ergonomic Plastic Pants', 158);
INSERT INTO "public"."platillo" VALUES (482, 25, 25, 'http://loremflickr.com/640/480/food?53937', 'Fantastic Concrete Bike', 618);
INSERT INTO "public"."platillo" VALUES (483, 25, 25, 'http://loremflickr.com/640/480/food?88301', 'Modern Wooden Shoes', 344);
INSERT INTO "public"."platillo" VALUES (484, 25, 25, 'http://loremflickr.com/640/480/food?54209', 'Generic Frozen Chicken', 974);
INSERT INTO "public"."platillo" VALUES (485, 25, 25, 'http://loremflickr.com/640/480/food?72858', 'Elegant Granite Salad', 178);
INSERT INTO "public"."platillo" VALUES (486, 25, 25, 'http://loremflickr.com/640/480/food?57450', 'Tasty Concrete Gloves', 754);
INSERT INTO "public"."platillo" VALUES (487, 25, 25, 'http://loremflickr.com/640/480/food?251', 'Tasty Rubber Car', 698);
INSERT INTO "public"."platillo" VALUES (488, 25, 25, 'http://loremflickr.com/640/480/food?5076', 'Generic Wooden Chips', 208);
INSERT INTO "public"."platillo" VALUES (489, 25, 25, 'http://loremflickr.com/640/480/food?92449', 'Tasty Granite Shirt', 944);
INSERT INTO "public"."platillo" VALUES (490, 25, 25, 'http://loremflickr.com/640/480/food?65371', 'Modern Concrete Cheese', 194);
INSERT INTO "public"."platillo" VALUES (491, 25, 25, 'http://loremflickr.com/640/480/food?33258', 'Electronic Granite Chair', 765);
INSERT INTO "public"."platillo" VALUES (492, 25, 25, 'http://loremflickr.com/640/480/food?42664', 'Intelligent Steel Shirt', 698);
INSERT INTO "public"."platillo" VALUES (493, 25, 25, 'http://loremflickr.com/640/480/food?62926', 'Gorgeous Bronze Towels', 208);
INSERT INTO "public"."platillo" VALUES (494, 25, 25, 'http://loremflickr.com/640/480/food?62239', 'Modern Cotton Cheese', 250);
INSERT INTO "public"."platillo" VALUES (495, 25, 25, 'http://loremflickr.com/640/480/food?18469', 'Licensed Frozen Keyboard', 862);
INSERT INTO "public"."platillo" VALUES (496, 25, 25, 'http://loremflickr.com/640/480/food?80029', 'Licensed Granite Towels', 704);
INSERT INTO "public"."platillo" VALUES (497, 25, 25, 'http://loremflickr.com/640/480/food?32796', 'Handcrafted Fresh Salad', 473);
INSERT INTO "public"."platillo" VALUES (498, 25, 25, 'http://loremflickr.com/640/480/food?21886', 'Modern Wooden Chicken', 349);
INSERT INTO "public"."platillo" VALUES (499, 25, 25, 'http://loremflickr.com/640/480/food?95285', 'Electronic Metal Mouse', 362);
INSERT INTO "public"."platillo" VALUES (500, 25, 25, 'http://loremflickr.com/640/480/food?95390', 'Handcrafted Wooden Ball', 582);
INSERT INTO "public"."platillo" VALUES (501, 26, 26, 'http://loremflickr.com/640/480/food?33268', 'Generic Soft Chips', 477);
INSERT INTO "public"."platillo" VALUES (502, 26, 26, 'http://loremflickr.com/640/480/food?65255', 'Refined Fresh Pizza', 159);
INSERT INTO "public"."platillo" VALUES (503, 26, 26, 'http://loremflickr.com/640/480/food?90052', 'Handmade Frozen Mouse', 170);
INSERT INTO "public"."platillo" VALUES (504, 26, 26, 'http://loremflickr.com/640/480/food?14544', 'Awesome Concrete Salad', 180);
INSERT INTO "public"."platillo" VALUES (505, 26, 26, 'http://loremflickr.com/640/480/food?84847', 'Modern Granite Towels', 980);
INSERT INTO "public"."platillo" VALUES (506, 26, 26, 'http://loremflickr.com/640/480/food?98136', 'Practical Bronze Soap', 141);
INSERT INTO "public"."platillo" VALUES (507, 26, 26, 'http://loremflickr.com/640/480/food?23628', 'Oriental Bronze Salad', 331);
INSERT INTO "public"."platillo" VALUES (508, 26, 26, 'http://loremflickr.com/640/480/food?24363', 'Recycled Frozen Shirt', 82);
INSERT INTO "public"."platillo" VALUES (509, 26, 26, 'http://loremflickr.com/640/480/food?28013', 'Small Bronze Hat', 743);
INSERT INTO "public"."platillo" VALUES (510, 26, 26, 'http://loremflickr.com/640/480/food?85394', 'Small Fresh Soap', 802);
INSERT INTO "public"."platillo" VALUES (511, 26, 26, 'http://loremflickr.com/640/480/food?45403', 'Awesome Fresh Cheese', 907);
INSERT INTO "public"."platillo" VALUES (512, 26, 26, 'http://loremflickr.com/640/480/food?61169', 'Small Granite Chicken', 77);
INSERT INTO "public"."platillo" VALUES (513, 26, 26, 'http://loremflickr.com/640/480/food?96193', 'Sleek Soft Pizza', 543);
INSERT INTO "public"."platillo" VALUES (514, 26, 26, 'http://loremflickr.com/640/480/food?43908', 'Intelligent Granite Tuna', 93);
INSERT INTO "public"."platillo" VALUES (515, 26, 26, 'http://loremflickr.com/640/480/food?40792', 'Bespoke Cotton Keyboard', 41);
INSERT INTO "public"."platillo" VALUES (516, 26, 26, 'http://loremflickr.com/640/480/food?51653', 'Bespoke Granite Keyboard', 111);
INSERT INTO "public"."platillo" VALUES (517, 26, 26, 'http://loremflickr.com/640/480/food?60321', 'Modern Steel Chips', 717);
INSERT INTO "public"."platillo" VALUES (518, 26, 26, 'http://loremflickr.com/640/480/food?66242', 'Sleek Metal Mouse', 275);
INSERT INTO "public"."platillo" VALUES (519, 26, 26, 'http://loremflickr.com/640/480/food?86152', 'Recycled Wooden Salad', 29);
INSERT INTO "public"."platillo" VALUES (520, 26, 26, 'http://loremflickr.com/640/480/food?69622', 'Elegant Steel Bacon', 621);
INSERT INTO "public"."platillo" VALUES (521, 27, 27, 'http://loremflickr.com/640/480/food?94565', 'Unbranded Steel Keyboard', 42);
INSERT INTO "public"."platillo" VALUES (522, 27, 27, 'http://loremflickr.com/640/480/food?60491', 'Ergonomic Rubber Chips', 114);
INSERT INTO "public"."platillo" VALUES (523, 27, 27, 'http://loremflickr.com/640/480/food?50112', 'Tasty Plastic Table', 57);
INSERT INTO "public"."platillo" VALUES (524, 27, 27, 'http://loremflickr.com/640/480/food?46803', 'Awesome Fresh Shirt', 462);
INSERT INTO "public"."platillo" VALUES (525, 27, 27, 'http://loremflickr.com/640/480/food?23965', 'Fantastic Steel Shoes', 28);
INSERT INTO "public"."platillo" VALUES (526, 27, 27, 'http://loremflickr.com/640/480/food?36877', 'Elegant Plastic Keyboard', 841);
INSERT INTO "public"."platillo" VALUES (527, 27, 27, 'http://loremflickr.com/640/480/food?47091', 'Modern Fresh Chicken', 668);
INSERT INTO "public"."platillo" VALUES (528, 27, 27, 'http://loremflickr.com/640/480/food?41382', 'Sleek Plastic Chicken', 981);
INSERT INTO "public"."platillo" VALUES (529, 27, 27, 'http://loremflickr.com/640/480/food?93231', 'Ergonomic Wooden Bacon', 942);
INSERT INTO "public"."platillo" VALUES (530, 27, 27, 'http://loremflickr.com/640/480/food?54674', 'Refined Soft Sausages', 138);
INSERT INTO "public"."platillo" VALUES (531, 27, 27, 'http://loremflickr.com/640/480/food?6958', 'Rustic Soft Mouse', 839);
INSERT INTO "public"."platillo" VALUES (532, 27, 27, 'http://loremflickr.com/640/480/food?30239', 'Generic Rubber Mouse', 491);
INSERT INTO "public"."platillo" VALUES (533, 27, 27, 'http://loremflickr.com/640/480/food?18014', 'Sleek Wooden Ball', 340);
INSERT INTO "public"."platillo" VALUES (534, 27, 27, 'http://loremflickr.com/640/480/food?21065', 'Tasty Cotton Ball', 58);
INSERT INTO "public"."platillo" VALUES (535, 27, 27, 'http://loremflickr.com/640/480/food?95854', 'Incredible Metal Ball', 464);
INSERT INTO "public"."platillo" VALUES (536, 27, 27, 'http://loremflickr.com/640/480/food?84710', 'Incredible Steel Car', 418);
INSERT INTO "public"."platillo" VALUES (537, 27, 27, 'http://loremflickr.com/640/480/food?60453', 'Intelligent Granite Chicken', 434);
INSERT INTO "public"."platillo" VALUES (538, 27, 27, 'http://loremflickr.com/640/480/food?19567', 'Gorgeous Plastic Salad', 909);
INSERT INTO "public"."platillo" VALUES (539, 27, 27, 'http://loremflickr.com/640/480/food?4579', 'Handmade Wooden Fish', 1000);
INSERT INTO "public"."platillo" VALUES (540, 27, 27, 'http://loremflickr.com/640/480/food?48192', 'Generic Wooden Mouse', 106);
INSERT INTO "public"."platillo" VALUES (541, 28, 28, 'http://loremflickr.com/640/480/food?14670', 'Sleek Cotton Car', 825);
INSERT INTO "public"."platillo" VALUES (542, 28, 28, 'http://loremflickr.com/640/480/food?82544', 'Elegant Bronze Computer', 820);
INSERT INTO "public"."platillo" VALUES (543, 28, 28, 'http://loremflickr.com/640/480/food?41746', 'Electronic Rubber Soap', 26);
INSERT INTO "public"."platillo" VALUES (544, 28, 28, 'http://loremflickr.com/640/480/food?11445', 'Practical Soft Chair', 847);
INSERT INTO "public"."platillo" VALUES (545, 28, 28, 'http://loremflickr.com/640/480/food?12353', 'Elegant Soft Bike', 326);
INSERT INTO "public"."platillo" VALUES (546, 28, 28, 'http://loremflickr.com/640/480/food?56711', 'Electronic Bronze Bacon', 374);
INSERT INTO "public"."platillo" VALUES (547, 28, 28, 'http://loremflickr.com/640/480/food?30716', 'Elegant Wooden Cheese', 524);
INSERT INTO "public"."platillo" VALUES (548, 28, 28, 'http://loremflickr.com/640/480/food?54858', 'Bespoke Granite Hat', 544);
INSERT INTO "public"."platillo" VALUES (549, 28, 28, 'http://loremflickr.com/640/480/food?15103', 'Refined Cotton Car', 785);
INSERT INTO "public"."platillo" VALUES (550, 28, 28, 'http://loremflickr.com/640/480/food?57877', 'Unbranded Cotton Salad', 28);
INSERT INTO "public"."platillo" VALUES (551, 28, 28, 'http://loremflickr.com/640/480/food?26778', 'Ergonomic Rubber Bike', 916);
INSERT INTO "public"."platillo" VALUES (552, 28, 28, 'http://loremflickr.com/640/480/food?42155', 'Ergonomic Bronze Bacon', 576);
INSERT INTO "public"."platillo" VALUES (553, 28, 28, 'http://loremflickr.com/640/480/food?14487', 'Handmade Plastic Chicken', 258);
INSERT INTO "public"."platillo" VALUES (554, 28, 28, 'http://loremflickr.com/640/480/food?74253', 'Small Rubber Pants', 916);
INSERT INTO "public"."platillo" VALUES (555, 28, 28, 'http://loremflickr.com/640/480/food?51885', 'Rustic Frozen Mouse', 498);
INSERT INTO "public"."platillo" VALUES (556, 28, 28, 'http://loremflickr.com/640/480/food?33242', 'Ergonomic Frozen Bacon', 302);
INSERT INTO "public"."platillo" VALUES (557, 28, 28, 'http://loremflickr.com/640/480/food?69456', 'Gorgeous Frozen Computer', 235);
INSERT INTO "public"."platillo" VALUES (558, 28, 28, 'http://loremflickr.com/640/480/food?11892', 'Bespoke Metal Fish', 859);
INSERT INTO "public"."platillo" VALUES (559, 28, 28, 'http://loremflickr.com/640/480/food?93014', 'Incredible Granite Salad', 397);
INSERT INTO "public"."platillo" VALUES (560, 28, 28, 'http://loremflickr.com/640/480/food?86017', 'Practical Metal Pants', 500);
INSERT INTO "public"."platillo" VALUES (561, 29, 29, 'http://loremflickr.com/640/480/food?4925', 'Luxurious Bronze Salad', 656);
INSERT INTO "public"."platillo" VALUES (562, 29, 29, 'http://loremflickr.com/640/480/food?81404', 'Handmade Concrete Sausages', 993);
INSERT INTO "public"."platillo" VALUES (563, 29, 29, 'http://loremflickr.com/640/480/food?85434', 'Tasty Wooden Hat', 37);
INSERT INTO "public"."platillo" VALUES (564, 29, 29, 'http://loremflickr.com/640/480/food?67360', 'Rustic Soft Tuna', 410);
INSERT INTO "public"."platillo" VALUES (565, 29, 29, 'http://loremflickr.com/640/480/food?52377', 'Handmade Bronze Shirt', 917);
INSERT INTO "public"."platillo" VALUES (566, 29, 29, 'http://loremflickr.com/640/480/food?5819', 'Intelligent Plastic Pizza', 259);
INSERT INTO "public"."platillo" VALUES (567, 29, 29, 'http://loremflickr.com/640/480/food?74194', 'Licensed Concrete Towels', 986);
INSERT INTO "public"."platillo" VALUES (568, 29, 29, 'http://loremflickr.com/640/480/food?76453', 'Rustic Rubber Keyboard', 152);
INSERT INTO "public"."platillo" VALUES (569, 29, 29, 'http://loremflickr.com/640/480/food?70389', 'Luxurious Granite Shirt', 988);
INSERT INTO "public"."platillo" VALUES (570, 29, 29, 'http://loremflickr.com/640/480/food?59548', 'Sleek Cotton Keyboard', 766);
INSERT INTO "public"."platillo" VALUES (571, 29, 29, 'http://loremflickr.com/640/480/food?95099', 'Gorgeous Cotton Shirt', 141);
INSERT INTO "public"."platillo" VALUES (572, 29, 29, 'http://loremflickr.com/640/480/food?34870', 'Oriental Plastic Tuna', 872);
INSERT INTO "public"."platillo" VALUES (573, 29, 29, 'http://loremflickr.com/640/480/food?69450', 'Handmade Bronze Computer', 905);
INSERT INTO "public"."platillo" VALUES (574, 29, 29, 'http://loremflickr.com/640/480/food?48903', 'Handcrafted Rubber Bike', 151);
INSERT INTO "public"."platillo" VALUES (575, 29, 29, 'http://loremflickr.com/640/480/food?45084', 'Small Granite Bike', 139);
INSERT INTO "public"."platillo" VALUES (576, 29, 29, 'http://loremflickr.com/640/480/food?97360', 'Luxurious Plastic Bike', 420);
INSERT INTO "public"."platillo" VALUES (577, 29, 29, 'http://loremflickr.com/640/480/food?25088', 'Refined Rubber Salad', 999);
INSERT INTO "public"."platillo" VALUES (578, 29, 29, 'http://loremflickr.com/640/480/food?37146', 'Bespoke Soft Towels', 615);
INSERT INTO "public"."platillo" VALUES (579, 29, 29, 'http://loremflickr.com/640/480/food?4556', 'Awesome Rubber Pants', 893);
INSERT INTO "public"."platillo" VALUES (580, 29, 29, 'http://loremflickr.com/640/480/food?40030', 'Bespoke Cotton Shoes', 265);
INSERT INTO "public"."platillo" VALUES (581, 30, 30, 'http://loremflickr.com/640/480/food?26797', 'Handcrafted Soft Pants', 723);
INSERT INTO "public"."platillo" VALUES (582, 30, 30, 'http://loremflickr.com/640/480/food?74257', 'Ergonomic Wooden Computer', 584);
INSERT INTO "public"."platillo" VALUES (583, 30, 30, 'http://loremflickr.com/640/480/food?8932', 'Refined Fresh Bike', 626);
INSERT INTO "public"."platillo" VALUES (584, 30, 30, 'http://loremflickr.com/640/480/food?16062', 'Oriental Rubber Soap', 515);
INSERT INTO "public"."platillo" VALUES (585, 30, 30, 'http://loremflickr.com/640/480/food?14707', 'Fantastic Metal Chips', 27);
INSERT INTO "public"."platillo" VALUES (586, 30, 30, 'http://loremflickr.com/640/480/food?22205', 'Small Wooden Cheese', 912);
INSERT INTO "public"."platillo" VALUES (587, 30, 30, 'http://loremflickr.com/640/480/food?74627', 'Unbranded Granite Mouse', 751);
INSERT INTO "public"."platillo" VALUES (588, 30, 30, 'http://loremflickr.com/640/480/food?16646', 'Incredible Plastic Ball', 754);
INSERT INTO "public"."platillo" VALUES (589, 30, 30, 'http://loremflickr.com/640/480/food?38106', 'Handcrafted Soft Fish', 277);
INSERT INTO "public"."platillo" VALUES (590, 30, 30, 'http://loremflickr.com/640/480/food?81876', 'Luxurious Frozen Ball', 271);
INSERT INTO "public"."platillo" VALUES (591, 30, 30, 'http://loremflickr.com/640/480/food?44953', 'Handcrafted Cotton Shirt', 949);
INSERT INTO "public"."platillo" VALUES (592, 30, 30, 'http://loremflickr.com/640/480/food?10982', 'Incredible Metal Sausages', 717);
INSERT INTO "public"."platillo" VALUES (593, 30, 30, 'http://loremflickr.com/640/480/food?45063', 'Luxurious Frozen Mouse', 537);
INSERT INTO "public"."platillo" VALUES (594, 30, 30, 'http://loremflickr.com/640/480/food?32761', 'Electronic Granite Chicken', 252);
INSERT INTO "public"."platillo" VALUES (595, 30, 30, 'http://loremflickr.com/640/480/food?69363', 'Ergonomic Rubber Tuna', 605);
INSERT INTO "public"."platillo" VALUES (596, 30, 30, 'http://loremflickr.com/640/480/food?90343', 'Oriental Granite Ball', 698);
INSERT INTO "public"."platillo" VALUES (597, 30, 30, 'http://loremflickr.com/640/480/food?13478', 'Awesome Soft Fish', 265);
INSERT INTO "public"."platillo" VALUES (598, 30, 30, 'http://loremflickr.com/640/480/food?71424', 'Sleek Soft Sausages', 934);
INSERT INTO "public"."platillo" VALUES (599, 30, 30, 'http://loremflickr.com/640/480/food?81376', 'Luxurious Cotton Mouse', 805);
INSERT INTO "public"."platillo" VALUES (600, 30, 30, 'http://loremflickr.com/640/480/food?81115', 'Intelligent Cotton Tuna', 529);
INSERT INTO "public"."platillo" VALUES (601, 31, 31, 'http://loremflickr.com/640/480/food?57842', 'Ergonomic Bronze Chips', 783);
INSERT INTO "public"."platillo" VALUES (602, 31, 31, 'http://loremflickr.com/640/480/food?33591', 'Practical Fresh Car', 161);
INSERT INTO "public"."platillo" VALUES (603, 31, 31, 'http://loremflickr.com/640/480/food?77397', 'Recycled Wooden Sausages', 945);
INSERT INTO "public"."platillo" VALUES (604, 31, 31, 'http://loremflickr.com/640/480/food?85630', 'Bespoke Concrete Gloves', 214);
INSERT INTO "public"."platillo" VALUES (605, 31, 31, 'http://loremflickr.com/640/480/food?91020', 'Generic Metal Cheese', 279);
INSERT INTO "public"."platillo" VALUES (606, 31, 31, 'http://loremflickr.com/640/480/food?50875', 'Oriental Plastic Shirt', 739);
INSERT INTO "public"."platillo" VALUES (607, 31, 31, 'http://loremflickr.com/640/480/food?15489', 'Rustic Concrete Chips', 291);
INSERT INTO "public"."platillo" VALUES (608, 31, 31, 'http://loremflickr.com/640/480/food?76134', 'Practical Wooden Keyboard', 597);
INSERT INTO "public"."platillo" VALUES (609, 31, 31, 'http://loremflickr.com/640/480/food?17084', 'Tasty Bronze Chips', 677);
INSERT INTO "public"."platillo" VALUES (610, 31, 31, 'http://loremflickr.com/640/480/food?91278', 'Gorgeous Fresh Keyboard', 937);
INSERT INTO "public"."platillo" VALUES (611, 31, 31, 'http://loremflickr.com/640/480/food?45387', 'Modern Wooden Pizza', 850);
INSERT INTO "public"."platillo" VALUES (612, 31, 31, 'http://loremflickr.com/640/480/food?37742', 'Bespoke Steel Bacon', 88);
INSERT INTO "public"."platillo" VALUES (613, 31, 31, 'http://loremflickr.com/640/480/food?1231', 'Rustic Frozen Chips', 773);
INSERT INTO "public"."platillo" VALUES (614, 31, 31, 'http://loremflickr.com/640/480/food?62066', 'Ergonomic Frozen Salad', 913);
INSERT INTO "public"."platillo" VALUES (615, 31, 31, 'http://loremflickr.com/640/480/food?2010', 'Bespoke Wooden Cheese', 137);
INSERT INTO "public"."platillo" VALUES (616, 31, 31, 'http://loremflickr.com/640/480/food?81807', 'Incredible Metal Keyboard', 184);
INSERT INTO "public"."platillo" VALUES (617, 31, 31, 'http://loremflickr.com/640/480/food?97706', 'Oriental Rubber Chair', 839);
INSERT INTO "public"."platillo" VALUES (618, 31, 31, 'http://loremflickr.com/640/480/food?64440', 'Awesome Fresh Bike', 332);
INSERT INTO "public"."platillo" VALUES (619, 31, 31, 'http://loremflickr.com/640/480/food?31982', 'Tasty Fresh Towels', 850);
INSERT INTO "public"."platillo" VALUES (620, 31, 31, 'http://loremflickr.com/640/480/food?28416', 'Generic Bronze Bike', 151);
COMMIT;

-- ----------------------------
-- Table structure for repartidor
-- ----------------------------
DROP TABLE IF EXISTS "public"."repartidor";
CREATE TABLE "public"."repartidor" (
  "idrepartidor" int4 NOT NULL DEFAULT nextval('repartidor_idrepartidor_seq'::regclass),
  "idusuario" int4 NOT NULL
)
;
ALTER TABLE "public"."repartidor" OWNER TO "root";

-- ----------------------------
-- Records of repartidor
-- ----------------------------
BEGIN;
INSERT INTO "public"."repartidor" VALUES (1, 1);
INSERT INTO "public"."repartidor" VALUES (2, 2);
INSERT INTO "public"."repartidor" VALUES (3, 3);
INSERT INTO "public"."repartidor" VALUES (4, 4);
INSERT INTO "public"."repartidor" VALUES (5, 5);
INSERT INTO "public"."repartidor" VALUES (6, 6);
INSERT INTO "public"."repartidor" VALUES (7, 7);
INSERT INTO "public"."repartidor" VALUES (8, 8);
INSERT INTO "public"."repartidor" VALUES (9, 9);
INSERT INTO "public"."repartidor" VALUES (10, 10);
INSERT INTO "public"."repartidor" VALUES (11, 384);
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
INSERT INTO "public"."resena" VALUES (1, 1, 1, 5, '2022-06-13', 'quia omnis et');
INSERT INTO "public"."resena" VALUES (2, 1, 2, 5, '2022-04-02', 'et repudiandae facilis');
INSERT INTO "public"."resena" VALUES (3, 1, 3, 0, '2021-06-26', 'non voluptatum maiores');
INSERT INTO "public"."resena" VALUES (4, 1, 4, 4, '2022-03-09', 'officia nesciunt corporis');
INSERT INTO "public"."resena" VALUES (5, 1, 5, 1, '2022-03-21', 'earum sed aut');
INSERT INTO "public"."resena" VALUES (6, 1, 6, 3, '2022-03-21', 'ad vitae et');
INSERT INTO "public"."resena" VALUES (7, 1, 7, 4, '2021-11-01', 'aut atque consequatur');
INSERT INTO "public"."resena" VALUES (8, 1, 8, 0, '2022-03-18', 'omnis itaque ipsum');
INSERT INTO "public"."resena" VALUES (9, 1, 9, 1, '2021-10-25', 'nemo qui velit');
INSERT INTO "public"."resena" VALUES (10, 1, 10, 0, '2021-12-25', 'quibusdam ad officiis');
INSERT INTO "public"."resena" VALUES (11, 1, 11, 2, '2021-08-28', 'enim ipsa ea');
INSERT INTO "public"."resena" VALUES (12, 1, 12, 4, '2022-02-10', 'velit unde porro');
INSERT INTO "public"."resena" VALUES (13, 1, 13, 4, '2022-03-06', 'esse nihil aliquam');
INSERT INTO "public"."resena" VALUES (14, 1, 14, 1, '2021-12-30', 'at eveniet vel');
INSERT INTO "public"."resena" VALUES (15, 1, 15, 0, '2021-11-10', 'numquam quis accusamus');
INSERT INTO "public"."resena" VALUES (16, 1, 16, 0, '2021-12-24', 'veritatis aliquam nobis');
INSERT INTO "public"."resena" VALUES (17, 1, 17, 3, '2022-05-13', 'magnam nulla eum');
INSERT INTO "public"."resena" VALUES (18, 1, 18, 0, '2021-09-26', 'ducimus reprehenderit non');
INSERT INTO "public"."resena" VALUES (19, 1, 19, 0, '2022-02-13', 'maiores quibusdam est');
INSERT INTO "public"."resena" VALUES (20, 1, 20, 2, '2022-06-14', 'cumque maiores quis');
INSERT INTO "public"."resena" VALUES (21, 1, 21, 4, '2021-11-07', 'veritatis maiores ipsam');
INSERT INTO "public"."resena" VALUES (22, 1, 22, 5, '2022-06-12', 'quidem voluptatem culpa');
INSERT INTO "public"."resena" VALUES (23, 1, 23, 5, '2021-09-15', 'velit ad rem');
INSERT INTO "public"."resena" VALUES (24, 1, 24, 3, '2021-11-12', 'fugit qui maiores');
INSERT INTO "public"."resena" VALUES (25, 1, 25, 1, '2022-05-27', 'quis quas necessitatibus');
INSERT INTO "public"."resena" VALUES (26, 1, 26, 4, '2022-02-17', 'rerum adipisci sit');
INSERT INTO "public"."resena" VALUES (27, 1, 27, 0, '2021-12-29', 'quasi consequatur rerum');
INSERT INTO "public"."resena" VALUES (28, 1, 28, 4, '2022-03-27', 'excepturi similique modi');
INSERT INTO "public"."resena" VALUES (29, 1, 29, 4, '2022-02-21', 'animi necessitatibus ea');
INSERT INTO "public"."resena" VALUES (30, 1, 30, 4, '2022-04-05', 'modi non inventore');
INSERT INTO "public"."resena" VALUES (31, 2, 1, 1, '2022-05-28', 'aut architecto labore');
INSERT INTO "public"."resena" VALUES (32, 2, 2, 5, '2021-09-11', 'eos at voluptatem');
INSERT INTO "public"."resena" VALUES (33, 2, 3, 4, '2021-11-16', 'vero consequatur at');
INSERT INTO "public"."resena" VALUES (34, 2, 4, 0, '2021-08-11', 'qui aut perferendis');
INSERT INTO "public"."resena" VALUES (35, 2, 5, 0, '2021-09-18', 'et minima inventore');
INSERT INTO "public"."resena" VALUES (36, 2, 6, 2, '2021-07-08', 'harum cum minima');
INSERT INTO "public"."resena" VALUES (37, 2, 7, 2, '2022-05-14', 'tenetur esse et');
INSERT INTO "public"."resena" VALUES (38, 2, 8, 1, '2021-07-08', 'mollitia autem magnam');
INSERT INTO "public"."resena" VALUES (39, 2, 9, 4, '2021-12-27', 'non adipisci quidem');
INSERT INTO "public"."resena" VALUES (40, 2, 10, 4, '2021-12-09', 'perspiciatis et et');
INSERT INTO "public"."resena" VALUES (41, 2, 11, 5, '2022-04-16', 'quos veritatis autem');
INSERT INTO "public"."resena" VALUES (42, 2, 12, 2, '2022-01-21', 'consequuntur voluptatem voluptatem');
INSERT INTO "public"."resena" VALUES (43, 2, 13, 2, '2021-12-18', 'qui temporibus fugit');
INSERT INTO "public"."resena" VALUES (44, 2, 14, 5, '2022-01-07', 'sed et quibusdam');
INSERT INTO "public"."resena" VALUES (45, 2, 15, 1, '2021-12-02', 'itaque velit alias');
INSERT INTO "public"."resena" VALUES (46, 2, 16, 4, '2022-05-23', 'eos porro quod');
INSERT INTO "public"."resena" VALUES (47, 2, 17, 5, '2021-10-18', 'commodi quo porro');
INSERT INTO "public"."resena" VALUES (48, 2, 18, 2, '2021-08-22', 'ut et autem');
INSERT INTO "public"."resena" VALUES (49, 2, 19, 3, '2021-08-04', 'et eligendi voluptatem');
INSERT INTO "public"."resena" VALUES (50, 2, 20, 1, '2022-04-30', 'laudantium nobis labore');
INSERT INTO "public"."resena" VALUES (51, 2, 21, 2, '2022-06-13', 'vero non eos');
INSERT INTO "public"."resena" VALUES (52, 2, 22, 1, '2022-02-15', 'et quidem nesciunt');
INSERT INTO "public"."resena" VALUES (53, 2, 23, 3, '2022-06-16', 'enim iusto voluptas');
INSERT INTO "public"."resena" VALUES (54, 2, 24, 4, '2021-06-24', 'sit quo aliquam');
INSERT INTO "public"."resena" VALUES (55, 2, 25, 1, '2021-09-21', 'repellat non voluptates');
INSERT INTO "public"."resena" VALUES (56, 2, 26, 4, '2021-10-26', 'eos sunt qui');
INSERT INTO "public"."resena" VALUES (57, 2, 27, 1, '2022-03-10', 'aut beatae voluptas');
INSERT INTO "public"."resena" VALUES (58, 2, 28, 5, '2021-12-16', 'quaerat quo et');
INSERT INTO "public"."resena" VALUES (59, 2, 29, 5, '2021-11-13', 'aut et autem');
INSERT INTO "public"."resena" VALUES (60, 2, 30, 4, '2022-02-12', 'dolorum adipisci ipsum');
INSERT INTO "public"."resena" VALUES (61, 3, 1, 0, '2021-08-19', 'quas quia nam');
INSERT INTO "public"."resena" VALUES (62, 3, 2, 4, '2021-11-23', 'magnam maiores dignissimos');
INSERT INTO "public"."resena" VALUES (63, 3, 3, 1, '2021-08-31', 'aut hic omnis');
INSERT INTO "public"."resena" VALUES (64, 3, 4, 0, '2021-09-18', 'excepturi aut nesciunt');
INSERT INTO "public"."resena" VALUES (65, 3, 5, 1, '2021-07-04', 'et in ratione');
INSERT INTO "public"."resena" VALUES (66, 3, 6, 4, '2022-05-09', 'qui fuga facere');
INSERT INTO "public"."resena" VALUES (67, 3, 7, 0, '2021-09-02', 'est ullam aut');
INSERT INTO "public"."resena" VALUES (68, 3, 8, 2, '2021-07-28', 'excepturi repudiandae veniam');
INSERT INTO "public"."resena" VALUES (69, 3, 9, 1, '2021-12-12', 'itaque iste nihil');
INSERT INTO "public"."resena" VALUES (70, 3, 10, 2, '2022-04-05', 'iusto quisquam perspiciatis');
INSERT INTO "public"."resena" VALUES (71, 3, 11, 5, '2022-01-15', 'similique nihil aliquam');
INSERT INTO "public"."resena" VALUES (72, 3, 12, 0, '2021-10-11', 'inventore dolor ullam');
INSERT INTO "public"."resena" VALUES (73, 3, 13, 4, '2021-07-15', 'commodi dignissimos tenetur');
INSERT INTO "public"."resena" VALUES (74, 3, 14, 2, '2021-08-27', 'cumque ut deserunt');
INSERT INTO "public"."resena" VALUES (75, 3, 15, 1, '2022-04-29', 'iusto porro est');
INSERT INTO "public"."resena" VALUES (76, 3, 16, 3, '2021-09-26', 'nihil ea animi');
INSERT INTO "public"."resena" VALUES (77, 3, 17, 5, '2022-03-08', 'officiis est ipsam');
INSERT INTO "public"."resena" VALUES (78, 3, 18, 5, '2021-11-25', 'laboriosam perspiciatis minima');
INSERT INTO "public"."resena" VALUES (79, 3, 19, 2, '2021-10-03', 'molestiae alias minus');
INSERT INTO "public"."resena" VALUES (80, 3, 20, 3, '2022-02-09', 'tenetur sequi id');
INSERT INTO "public"."resena" VALUES (81, 3, 21, 0, '2021-11-03', 'et doloremque fugiat');
INSERT INTO "public"."resena" VALUES (82, 3, 22, 5, '2022-02-01', 'maiores aut perferendis');
INSERT INTO "public"."resena" VALUES (83, 3, 23, 2, '2022-03-13', 'et voluptatem reprehenderit');
INSERT INTO "public"."resena" VALUES (84, 3, 24, 4, '2022-02-23', 'rerum consectetur ut');
INSERT INTO "public"."resena" VALUES (85, 3, 25, 2, '2022-02-10', 'perspiciatis itaque vitae');
INSERT INTO "public"."resena" VALUES (86, 3, 26, 3, '2021-09-26', 'quam ut sequi');
INSERT INTO "public"."resena" VALUES (87, 3, 27, 2, '2021-08-01', 'animi vel a');
INSERT INTO "public"."resena" VALUES (88, 3, 28, 5, '2021-12-28', 'suscipit delectus accusantium');
INSERT INTO "public"."resena" VALUES (89, 3, 29, 4, '2022-06-16', 'pariatur nisi quisquam');
INSERT INTO "public"."resena" VALUES (90, 3, 30, 2, '2022-05-14', 'reiciendis officia nemo');
INSERT INTO "public"."resena" VALUES (91, 4, 1, 0, '2021-11-13', 'aut quos sit');
INSERT INTO "public"."resena" VALUES (92, 4, 2, 3, '2021-10-07', 'et nisi consequatur');
INSERT INTO "public"."resena" VALUES (93, 4, 3, 0, '2022-03-29', 'sequi vero unde');
INSERT INTO "public"."resena" VALUES (94, 4, 4, 3, '2022-04-07', 'atque quae quia');
INSERT INTO "public"."resena" VALUES (95, 4, 5, 4, '2021-11-08', 'eveniet voluptas non');
INSERT INTO "public"."resena" VALUES (96, 4, 6, 3, '2022-04-03', 'soluta quidem cupiditate');
INSERT INTO "public"."resena" VALUES (97, 4, 7, 3, '2022-04-03', 'sed rerum et');
INSERT INTO "public"."resena" VALUES (98, 4, 8, 5, '2021-08-30', 'voluptatem provident ipsum');
INSERT INTO "public"."resena" VALUES (99, 4, 9, 3, '2021-11-02', 'perspiciatis dolores at');
INSERT INTO "public"."resena" VALUES (100, 4, 10, 2, '2022-06-18', 'omnis reprehenderit maxime');
INSERT INTO "public"."resena" VALUES (101, 4, 11, 5, '2022-05-29', 'id dolorem et');
INSERT INTO "public"."resena" VALUES (102, 4, 12, 4, '2021-10-24', 'natus ut ea');
INSERT INTO "public"."resena" VALUES (103, 4, 13, 4, '2021-12-07', 'tempore laudantium sunt');
INSERT INTO "public"."resena" VALUES (104, 4, 14, 4, '2022-03-30', 'officia architecto sint');
INSERT INTO "public"."resena" VALUES (105, 4, 15, 1, '2021-06-23', 'nisi consequuntur et');
INSERT INTO "public"."resena" VALUES (106, 4, 16, 2, '2022-01-02', 'animi eius dolor');
INSERT INTO "public"."resena" VALUES (107, 4, 17, 2, '2022-01-03', 'id ut magni');
INSERT INTO "public"."resena" VALUES (108, 4, 18, 5, '2022-02-21', 'quis et et');
INSERT INTO "public"."resena" VALUES (109, 4, 19, 3, '2022-02-15', 'voluptatem ut totam');
INSERT INTO "public"."resena" VALUES (110, 4, 20, 4, '2021-11-03', 'earum animi voluptatem');
INSERT INTO "public"."resena" VALUES (111, 4, 21, 1, '2021-08-07', 'debitis consequatur et');
INSERT INTO "public"."resena" VALUES (112, 4, 22, 1, '2022-03-12', 'blanditiis praesentium harum');
INSERT INTO "public"."resena" VALUES (113, 4, 23, 3, '2022-02-25', 'veritatis quam accusamus');
INSERT INTO "public"."resena" VALUES (454, 16, 4, 5, '2021-09-03', 'soluta sint cumque');
INSERT INTO "public"."resena" VALUES (114, 4, 24, 1, '2021-10-23', 'aperiam voluptatum fugit');
INSERT INTO "public"."resena" VALUES (115, 4, 25, 5, '2022-06-07', 'neque perspiciatis pariatur');
INSERT INTO "public"."resena" VALUES (116, 4, 26, 4, '2022-03-29', 'excepturi quia explicabo');
INSERT INTO "public"."resena" VALUES (117, 4, 27, 4, '2021-08-18', 'placeat aperiam voluptatibus');
INSERT INTO "public"."resena" VALUES (118, 4, 28, 4, '2022-03-14', 'repudiandae libero et');
INSERT INTO "public"."resena" VALUES (119, 4, 29, 4, '2021-09-07', 'in voluptatum aspernatur');
INSERT INTO "public"."resena" VALUES (120, 4, 30, 4, '2021-12-05', 'et non commodi');
INSERT INTO "public"."resena" VALUES (121, 5, 1, 5, '2022-03-29', 'est atque est');
INSERT INTO "public"."resena" VALUES (122, 5, 2, 3, '2022-05-11', 'quasi quos est');
INSERT INTO "public"."resena" VALUES (123, 5, 3, 0, '2022-03-14', 'est sunt saepe');
INSERT INTO "public"."resena" VALUES (124, 5, 4, 5, '2022-01-11', 'cupiditate nisi tempore');
INSERT INTO "public"."resena" VALUES (125, 5, 5, 0, '2022-03-05', 'expedita similique quisquam');
INSERT INTO "public"."resena" VALUES (126, 5, 6, 1, '2021-10-03', 'ut ut voluptatem');
INSERT INTO "public"."resena" VALUES (127, 5, 7, 4, '2021-11-05', 'quia nisi accusantium');
INSERT INTO "public"."resena" VALUES (128, 5, 8, 3, '2021-07-16', 'sit molestias et');
INSERT INTO "public"."resena" VALUES (129, 5, 9, 1, '2022-01-16', 'praesentium culpa nobis');
INSERT INTO "public"."resena" VALUES (130, 5, 10, 4, '2022-05-09', 'qui eos dolore');
INSERT INTO "public"."resena" VALUES (131, 5, 11, 0, '2021-07-01', 'cumque voluptas molestias');
INSERT INTO "public"."resena" VALUES (132, 5, 12, 0, '2022-05-04', 'mollitia perspiciatis ut');
INSERT INTO "public"."resena" VALUES (133, 5, 13, 3, '2022-05-06', 'non recusandae voluptatem');
INSERT INTO "public"."resena" VALUES (134, 5, 14, 5, '2021-11-09', 'unde hic commodi');
INSERT INTO "public"."resena" VALUES (135, 5, 15, 4, '2021-11-08', 'rerum commodi necessitatibus');
INSERT INTO "public"."resena" VALUES (136, 5, 16, 5, '2021-09-15', 'eligendi repudiandae rem');
INSERT INTO "public"."resena" VALUES (137, 5, 17, 2, '2021-08-14', 'ducimus nam fugiat');
INSERT INTO "public"."resena" VALUES (138, 5, 18, 2, '2021-10-11', 'at libero voluptate');
INSERT INTO "public"."resena" VALUES (139, 5, 19, 5, '2022-01-12', 'dolor officia quaerat');
INSERT INTO "public"."resena" VALUES (140, 5, 20, 3, '2021-07-09', 'omnis eveniet perferendis');
INSERT INTO "public"."resena" VALUES (141, 5, 21, 1, '2021-10-06', 'voluptatem non odit');
INSERT INTO "public"."resena" VALUES (142, 5, 22, 3, '2022-01-12', 'omnis error est');
INSERT INTO "public"."resena" VALUES (143, 5, 23, 4, '2022-04-09', 'eos consequatur vel');
INSERT INTO "public"."resena" VALUES (144, 5, 24, 2, '2021-10-14', 'dolorem id voluptates');
INSERT INTO "public"."resena" VALUES (145, 5, 25, 4, '2022-05-30', 'omnis consequatur molestiae');
INSERT INTO "public"."resena" VALUES (146, 5, 26, 1, '2021-11-12', 'aut debitis odit');
INSERT INTO "public"."resena" VALUES (147, 5, 27, 0, '2021-08-05', 'qui sit reprehenderit');
INSERT INTO "public"."resena" VALUES (148, 5, 28, 4, '2022-04-07', 'quo in qui');
INSERT INTO "public"."resena" VALUES (149, 5, 29, 0, '2022-02-28', 'molestias voluptatibus unde');
INSERT INTO "public"."resena" VALUES (150, 5, 30, 4, '2021-11-22', 'non et illum');
INSERT INTO "public"."resena" VALUES (151, 6, 1, 1, '2022-03-27', 'harum suscipit incidunt');
INSERT INTO "public"."resena" VALUES (152, 6, 2, 4, '2021-11-03', 'voluptate error laboriosam');
INSERT INTO "public"."resena" VALUES (153, 6, 3, 2, '2021-08-13', 'magni et quia');
INSERT INTO "public"."resena" VALUES (154, 6, 4, 1, '2021-12-02', 'quas totam sed');
INSERT INTO "public"."resena" VALUES (155, 6, 5, 1, '2021-07-29', 'ex autem maiores');
INSERT INTO "public"."resena" VALUES (156, 6, 6, 3, '2022-01-14', 'et commodi provident');
INSERT INTO "public"."resena" VALUES (157, 6, 7, 3, '2022-02-04', 'in harum neque');
INSERT INTO "public"."resena" VALUES (158, 6, 8, 1, '2021-12-01', 'odit temporibus dicta');
INSERT INTO "public"."resena" VALUES (159, 6, 9, 2, '2021-09-07', 'illum maiores numquam');
INSERT INTO "public"."resena" VALUES (160, 6, 10, 5, '2021-12-29', 'voluptas libero nihil');
INSERT INTO "public"."resena" VALUES (161, 6, 11, 4, '2021-09-02', 'corrupti iste sequi');
INSERT INTO "public"."resena" VALUES (162, 6, 12, 1, '2022-03-02', 'ut doloremque tenetur');
INSERT INTO "public"."resena" VALUES (163, 6, 13, 2, '2021-07-16', 'et enim maxime');
INSERT INTO "public"."resena" VALUES (164, 6, 14, 0, '2022-04-28', 'saepe fuga deserunt');
INSERT INTO "public"."resena" VALUES (165, 6, 15, 3, '2021-10-18', 'soluta fugiat nemo');
INSERT INTO "public"."resena" VALUES (166, 6, 16, 4, '2022-04-11', 'alias aperiam ducimus');
INSERT INTO "public"."resena" VALUES (167, 6, 17, 2, '2022-06-17', 'facere dicta molestiae');
INSERT INTO "public"."resena" VALUES (168, 6, 18, 5, '2021-10-27', 'voluptatem esse ipsum');
INSERT INTO "public"."resena" VALUES (169, 6, 19, 0, '2021-08-04', 'quidem quia aperiam');
INSERT INTO "public"."resena" VALUES (170, 6, 20, 4, '2021-07-17', 'autem eos ut');
INSERT INTO "public"."resena" VALUES (171, 6, 21, 4, '2022-01-05', 'aut reprehenderit magnam');
INSERT INTO "public"."resena" VALUES (172, 6, 22, 4, '2021-08-28', 'doloribus et nobis');
INSERT INTO "public"."resena" VALUES (173, 6, 23, 1, '2022-01-26', 'voluptate perspiciatis quo');
INSERT INTO "public"."resena" VALUES (174, 6, 24, 2, '2022-03-22', 'quis commodi enim');
INSERT INTO "public"."resena" VALUES (175, 6, 25, 0, '2022-04-21', 'in natus est');
INSERT INTO "public"."resena" VALUES (176, 6, 26, 0, '2021-12-16', 'dolor dolorem accusantium');
INSERT INTO "public"."resena" VALUES (177, 6, 27, 0, '2021-11-18', 'dolor rem est');
INSERT INTO "public"."resena" VALUES (178, 6, 28, 0, '2021-08-01', 'sint repellendus harum');
INSERT INTO "public"."resena" VALUES (179, 6, 29, 1, '2022-05-04', 'alias maxime consectetur');
INSERT INTO "public"."resena" VALUES (180, 6, 30, 1, '2022-01-19', 'asperiores explicabo natus');
INSERT INTO "public"."resena" VALUES (181, 7, 1, 3, '2021-08-05', 'blanditiis eum sint');
INSERT INTO "public"."resena" VALUES (182, 7, 2, 4, '2021-11-17', 'fugiat vel pariatur');
INSERT INTO "public"."resena" VALUES (183, 7, 3, 0, '2021-10-06', 'eos est tempora');
INSERT INTO "public"."resena" VALUES (184, 7, 4, 5, '2021-10-16', 'vel laudantium quas');
INSERT INTO "public"."resena" VALUES (185, 7, 5, 1, '2022-03-24', 'aperiam incidunt distinctio');
INSERT INTO "public"."resena" VALUES (186, 7, 6, 4, '2021-07-16', 'voluptas ad occaecati');
INSERT INTO "public"."resena" VALUES (187, 7, 7, 1, '2021-08-21', 'vel repellat et');
INSERT INTO "public"."resena" VALUES (188, 7, 8, 3, '2021-09-28', 'cumque sequi facilis');
INSERT INTO "public"."resena" VALUES (189, 7, 9, 1, '2021-10-30', 'et aperiam illum');
INSERT INTO "public"."resena" VALUES (190, 7, 10, 5, '2022-03-10', 'libero sit tempore');
INSERT INTO "public"."resena" VALUES (191, 7, 11, 1, '2021-08-29', 'possimus dolorem fuga');
INSERT INTO "public"."resena" VALUES (192, 7, 12, 3, '2022-04-08', 'reiciendis dolorum eos');
INSERT INTO "public"."resena" VALUES (193, 7, 13, 5, '2022-02-03', 'maxime sunt et');
INSERT INTO "public"."resena" VALUES (194, 7, 14, 2, '2021-10-15', 'reiciendis rerum sint');
INSERT INTO "public"."resena" VALUES (195, 7, 15, 1, '2021-12-17', 'aut qui id');
INSERT INTO "public"."resena" VALUES (196, 7, 16, 1, '2021-09-24', 'quis libero et');
INSERT INTO "public"."resena" VALUES (197, 7, 17, 0, '2022-03-14', 'ut recusandae tempore');
INSERT INTO "public"."resena" VALUES (198, 7, 18, 2, '2021-07-20', 'sunt sint et');
INSERT INTO "public"."resena" VALUES (199, 7, 19, 0, '2022-04-18', 'beatae nam aperiam');
INSERT INTO "public"."resena" VALUES (200, 7, 20, 0, '2021-07-03', 'non occaecati et');
INSERT INTO "public"."resena" VALUES (201, 7, 21, 4, '2022-05-06', 'occaecati aspernatur at');
INSERT INTO "public"."resena" VALUES (202, 7, 22, 1, '2022-03-11', 'et iusto non');
INSERT INTO "public"."resena" VALUES (203, 7, 23, 3, '2022-01-21', 'rem est ipsa');
INSERT INTO "public"."resena" VALUES (204, 7, 24, 1, '2021-12-22', 'saepe veniam repudiandae');
INSERT INTO "public"."resena" VALUES (205, 7, 25, 0, '2022-05-09', 'saepe qui suscipit');
INSERT INTO "public"."resena" VALUES (206, 7, 26, 4, '2021-08-14', 'sunt ullam recusandae');
INSERT INTO "public"."resena" VALUES (207, 7, 27, 3, '2021-08-03', 'quas fugiat officia');
INSERT INTO "public"."resena" VALUES (208, 7, 28, 1, '2022-04-15', 'aut explicabo odio');
INSERT INTO "public"."resena" VALUES (209, 7, 29, 5, '2021-06-21', 'laudantium voluptate adipisci');
INSERT INTO "public"."resena" VALUES (210, 7, 30, 4, '2022-05-27', 'fugit aliquid sunt');
INSERT INTO "public"."resena" VALUES (211, 8, 1, 5, '2021-12-26', 'saepe aut placeat');
INSERT INTO "public"."resena" VALUES (212, 8, 2, 4, '2021-11-29', 'vero sit quae');
INSERT INTO "public"."resena" VALUES (213, 8, 3, 4, '2022-02-08', 'consequatur veniam ducimus');
INSERT INTO "public"."resena" VALUES (214, 8, 4, 4, '2022-01-30', 'dolores velit sed');
INSERT INTO "public"."resena" VALUES (215, 8, 5, 2, '2022-03-01', 'architecto consequatur enim');
INSERT INTO "public"."resena" VALUES (216, 8, 6, 4, '2021-07-09', 'voluptas officia cum');
INSERT INTO "public"."resena" VALUES (217, 8, 7, 5, '2021-08-16', 'iste numquam rerum');
INSERT INTO "public"."resena" VALUES (218, 8, 8, 4, '2021-11-05', 'ipsum est neque');
INSERT INTO "public"."resena" VALUES (219, 8, 9, 5, '2022-04-01', 'aliquid voluptatum blanditiis');
INSERT INTO "public"."resena" VALUES (220, 8, 10, 2, '2021-08-16', 'similique autem repellat');
INSERT INTO "public"."resena" VALUES (221, 8, 11, 0, '2022-02-16', 'eveniet praesentium vero');
INSERT INTO "public"."resena" VALUES (222, 8, 12, 5, '2022-03-20', 'error doloremque quia');
INSERT INTO "public"."resena" VALUES (223, 8, 13, 4, '2022-05-30', 'necessitatibus qui eos');
INSERT INTO "public"."resena" VALUES (224, 8, 14, 5, '2022-02-28', 'id voluptatem est');
INSERT INTO "public"."resena" VALUES (225, 8, 15, 0, '2022-05-26', 'enim omnis perspiciatis');
INSERT INTO "public"."resena" VALUES (226, 8, 16, 5, '2021-12-05', 'tempore quod iste');
INSERT INTO "public"."resena" VALUES (227, 8, 17, 4, '2022-03-15', 'atque quos exercitationem');
INSERT INTO "public"."resena" VALUES (228, 8, 18, 5, '2021-09-02', 'et maiores aut');
INSERT INTO "public"."resena" VALUES (229, 8, 19, 0, '2022-05-12', 'ab dolorem provident');
INSERT INTO "public"."resena" VALUES (230, 8, 20, 4, '2022-03-31', 'quia aut nesciunt');
INSERT INTO "public"."resena" VALUES (231, 8, 21, 3, '2021-11-10', 'rerum corporis nam');
INSERT INTO "public"."resena" VALUES (232, 8, 22, 3, '2022-03-16', 'voluptatum nemo delectus');
INSERT INTO "public"."resena" VALUES (233, 8, 23, 0, '2021-12-14', 'eos impedit vel');
INSERT INTO "public"."resena" VALUES (234, 8, 24, 3, '2021-12-29', 'ducimus autem corporis');
INSERT INTO "public"."resena" VALUES (235, 8, 25, 2, '2021-12-11', 'perspiciatis nam blanditiis');
INSERT INTO "public"."resena" VALUES (236, 8, 26, 5, '2021-07-26', 'assumenda voluptatum laborum');
INSERT INTO "public"."resena" VALUES (237, 8, 27, 4, '2021-09-04', 'debitis perspiciatis temporibus');
INSERT INTO "public"."resena" VALUES (238, 8, 28, 0, '2022-01-01', 'at distinctio consequatur');
INSERT INTO "public"."resena" VALUES (239, 8, 29, 4, '2022-02-04', 'natus reprehenderit voluptas');
INSERT INTO "public"."resena" VALUES (240, 8, 30, 4, '2022-06-12', 'ut et harum');
INSERT INTO "public"."resena" VALUES (241, 9, 1, 4, '2021-10-16', 'delectus magnam sint');
INSERT INTO "public"."resena" VALUES (242, 9, 2, 1, '2022-03-15', 'accusamus et qui');
INSERT INTO "public"."resena" VALUES (243, 9, 3, 2, '2021-09-16', 'sed recusandae ipsam');
INSERT INTO "public"."resena" VALUES (244, 9, 4, 3, '2022-01-29', 'repellendus quo debitis');
INSERT INTO "public"."resena" VALUES (245, 9, 5, 1, '2021-10-11', 'reprehenderit vel ex');
INSERT INTO "public"."resena" VALUES (246, 9, 6, 0, '2021-10-04', 'autem iusto nihil');
INSERT INTO "public"."resena" VALUES (247, 9, 7, 5, '2021-10-02', 'enim at reiciendis');
INSERT INTO "public"."resena" VALUES (248, 9, 8, 4, '2022-04-06', 'quasi iure vel');
INSERT INTO "public"."resena" VALUES (249, 9, 9, 1, '2022-02-19', 'et recusandae vel');
INSERT INTO "public"."resena" VALUES (250, 9, 10, 0, '2022-05-06', 'molestiae amet voluptas');
INSERT INTO "public"."resena" VALUES (251, 9, 11, 4, '2022-01-16', 'tenetur odio esse');
INSERT INTO "public"."resena" VALUES (252, 9, 12, 2, '2022-04-12', 'nesciunt aut ipsum');
INSERT INTO "public"."resena" VALUES (253, 9, 13, 3, '2021-08-03', 'deleniti reiciendis consequatur');
INSERT INTO "public"."resena" VALUES (254, 9, 14, 1, '2021-08-09', 'enim molestias alias');
INSERT INTO "public"."resena" VALUES (255, 9, 15, 1, '2021-07-11', 'temporibus rerum dolores');
INSERT INTO "public"."resena" VALUES (256, 9, 16, 0, '2021-07-13', 'iure perferendis aspernatur');
INSERT INTO "public"."resena" VALUES (257, 9, 17, 0, '2021-09-20', 'ea occaecati provident');
INSERT INTO "public"."resena" VALUES (258, 9, 18, 2, '2022-04-21', 'perferendis pariatur omnis');
INSERT INTO "public"."resena" VALUES (259, 9, 19, 4, '2021-10-10', 'voluptas libero corporis');
INSERT INTO "public"."resena" VALUES (260, 9, 20, 2, '2021-12-08', 'labore consectetur placeat');
INSERT INTO "public"."resena" VALUES (261, 9, 21, 0, '2021-10-16', 'fuga eos nesciunt');
INSERT INTO "public"."resena" VALUES (262, 9, 22, 3, '2022-01-27', 'quidem nisi ipsam');
INSERT INTO "public"."resena" VALUES (263, 9, 23, 2, '2022-05-28', 'omnis blanditiis asperiores');
INSERT INTO "public"."resena" VALUES (264, 9, 24, 0, '2021-08-19', 'tempore iure corrupti');
INSERT INTO "public"."resena" VALUES (265, 9, 25, 3, '2021-09-08', 'iusto est sed');
INSERT INTO "public"."resena" VALUES (266, 9, 26, 3, '2021-06-24', 'excepturi eveniet nisi');
INSERT INTO "public"."resena" VALUES (267, 9, 27, 4, '2021-10-20', 'praesentium temporibus omnis');
INSERT INTO "public"."resena" VALUES (268, 9, 28, 5, '2021-09-15', 'quibusdam iste blanditiis');
INSERT INTO "public"."resena" VALUES (269, 9, 29, 2, '2021-08-28', 'et voluptate maiores');
INSERT INTO "public"."resena" VALUES (270, 9, 30, 4, '2021-09-22', 'impedit cumque dolores');
INSERT INTO "public"."resena" VALUES (271, 10, 1, 4, '2022-01-13', 'velit reiciendis adipisci');
INSERT INTO "public"."resena" VALUES (272, 10, 2, 4, '2021-07-02', 'illum dolorum ipsam');
INSERT INTO "public"."resena" VALUES (273, 10, 3, 5, '2022-06-16', 'officia omnis dolore');
INSERT INTO "public"."resena" VALUES (274, 10, 4, 0, '2021-11-26', 'voluptatem et sint');
INSERT INTO "public"."resena" VALUES (275, 10, 5, 4, '2022-04-05', 'quia non illum');
INSERT INTO "public"."resena" VALUES (276, 10, 6, 4, '2021-09-06', 'necessitatibus explicabo in');
INSERT INTO "public"."resena" VALUES (277, 10, 7, 5, '2022-03-01', 'pariatur quia dicta');
INSERT INTO "public"."resena" VALUES (278, 10, 8, 5, '2021-08-04', 'qui aut impedit');
INSERT INTO "public"."resena" VALUES (279, 10, 9, 5, '2022-05-17', 'quod tempore sapiente');
INSERT INTO "public"."resena" VALUES (280, 10, 10, 2, '2021-10-26', 'sed et neque');
INSERT INTO "public"."resena" VALUES (281, 10, 11, 5, '2022-03-31', 'non facilis enim');
INSERT INTO "public"."resena" VALUES (282, 10, 12, 3, '2021-11-15', 'velit beatae in');
INSERT INTO "public"."resena" VALUES (283, 10, 13, 4, '2022-02-01', 'quisquam distinctio amet');
INSERT INTO "public"."resena" VALUES (284, 10, 14, 0, '2021-11-23', 'officiis blanditiis sequi');
INSERT INTO "public"."resena" VALUES (285, 10, 15, 4, '2021-11-08', 'voluptatem consequatur ut');
INSERT INTO "public"."resena" VALUES (286, 10, 16, 0, '2022-05-31', 'est provident ex');
INSERT INTO "public"."resena" VALUES (287, 10, 17, 1, '2022-05-06', 'consequuntur ut id');
INSERT INTO "public"."resena" VALUES (288, 10, 18, 0, '2022-06-07', 'quidem sit et');
INSERT INTO "public"."resena" VALUES (289, 10, 19, 3, '2022-05-06', 'iure earum ut');
INSERT INTO "public"."resena" VALUES (290, 10, 20, 1, '2021-09-06', 'minus possimus suscipit');
INSERT INTO "public"."resena" VALUES (291, 10, 21, 0, '2022-06-16', 'tempora quas ut');
INSERT INTO "public"."resena" VALUES (292, 10, 22, 0, '2021-11-03', 'itaque corporis non');
INSERT INTO "public"."resena" VALUES (293, 10, 23, 3, '2022-06-18', 'et quam eum');
INSERT INTO "public"."resena" VALUES (294, 10, 24, 4, '2021-07-03', 'velit qui odio');
INSERT INTO "public"."resena" VALUES (295, 10, 25, 2, '2022-06-09', 'similique sed perferendis');
INSERT INTO "public"."resena" VALUES (296, 10, 26, 4, '2022-04-12', 'maiores ut maxime');
INSERT INTO "public"."resena" VALUES (297, 10, 27, 0, '2022-02-22', 'facilis quo doloribus');
INSERT INTO "public"."resena" VALUES (298, 10, 28, 4, '2021-07-04', 'quidem aut illo');
INSERT INTO "public"."resena" VALUES (299, 10, 29, 5, '2022-04-09', 'consequatur repellat minus');
INSERT INTO "public"."resena" VALUES (300, 10, 30, 3, '2022-01-03', 'deserunt ut illo');
INSERT INTO "public"."resena" VALUES (301, 11, 1, 4, '2022-04-28', 'dolorem harum est');
INSERT INTO "public"."resena" VALUES (302, 11, 2, 4, '2022-05-05', 'sunt nisi eum');
INSERT INTO "public"."resena" VALUES (303, 11, 3, 1, '2022-06-09', 'saepe delectus nihil');
INSERT INTO "public"."resena" VALUES (304, 11, 4, 5, '2022-05-06', 'dignissimos odio repudiandae');
INSERT INTO "public"."resena" VALUES (305, 11, 5, 2, '2022-04-05', 'sequi ab quam');
INSERT INTO "public"."resena" VALUES (306, 11, 6, 4, '2021-07-28', 'maiores aspernatur ad');
INSERT INTO "public"."resena" VALUES (307, 11, 7, 3, '2022-01-31', 'enim vel et');
INSERT INTO "public"."resena" VALUES (308, 11, 8, 0, '2022-05-29', 'molestiae temporibus illo');
INSERT INTO "public"."resena" VALUES (309, 11, 9, 5, '2022-05-31', 'harum qui reiciendis');
INSERT INTO "public"."resena" VALUES (310, 11, 10, 5, '2021-10-13', 'sapiente atque sed');
INSERT INTO "public"."resena" VALUES (311, 11, 11, 5, '2021-12-09', 'voluptatibus sit tenetur');
INSERT INTO "public"."resena" VALUES (312, 11, 12, 5, '2022-01-11', 'eos quos quisquam');
INSERT INTO "public"."resena" VALUES (313, 11, 13, 2, '2021-08-31', 'ea est neque');
INSERT INTO "public"."resena" VALUES (314, 11, 14, 1, '2021-11-04', 'corporis voluptas tenetur');
INSERT INTO "public"."resena" VALUES (315, 11, 15, 3, '2022-04-10', 'est optio accusamus');
INSERT INTO "public"."resena" VALUES (316, 11, 16, 4, '2021-12-08', 'repudiandae impedit nobis');
INSERT INTO "public"."resena" VALUES (317, 11, 17, 2, '2022-01-02', 'maiores et in');
INSERT INTO "public"."resena" VALUES (318, 11, 18, 4, '2021-12-16', 'aliquid quis veniam');
INSERT INTO "public"."resena" VALUES (319, 11, 19, 0, '2021-11-12', 'qui quaerat impedit');
INSERT INTO "public"."resena" VALUES (320, 11, 20, 0, '2022-06-08', 'ut ipsa accusantium');
INSERT INTO "public"."resena" VALUES (321, 11, 21, 3, '2022-06-14', 'sapiente quis culpa');
INSERT INTO "public"."resena" VALUES (322, 11, 22, 3, '2022-04-25', 'excepturi quis nihil');
INSERT INTO "public"."resena" VALUES (323, 11, 23, 4, '2021-08-08', 'sit vitae non');
INSERT INTO "public"."resena" VALUES (324, 11, 24, 1, '2022-03-08', 'quasi laborum expedita');
INSERT INTO "public"."resena" VALUES (325, 11, 25, 3, '2022-05-12', 'non ex aut');
INSERT INTO "public"."resena" VALUES (326, 11, 26, 3, '2022-01-31', 'ipsum id placeat');
INSERT INTO "public"."resena" VALUES (327, 11, 27, 0, '2022-01-09', 'nesciunt est a');
INSERT INTO "public"."resena" VALUES (328, 11, 28, 0, '2021-08-25', 'odio possimus sint');
INSERT INTO "public"."resena" VALUES (329, 11, 29, 0, '2022-01-26', 'voluptatem similique enim');
INSERT INTO "public"."resena" VALUES (330, 11, 30, 4, '2021-10-07', 'ut voluptas ipsa');
INSERT INTO "public"."resena" VALUES (331, 12, 1, 4, '2021-10-09', 'corporis dignissimos rerum');
INSERT INTO "public"."resena" VALUES (332, 12, 2, 2, '2021-07-01', 'architecto totam qui');
INSERT INTO "public"."resena" VALUES (333, 12, 3, 2, '2022-05-12', 'et ut mollitia');
INSERT INTO "public"."resena" VALUES (334, 12, 4, 0, '2021-12-07', 'blanditiis omnis vel');
INSERT INTO "public"."resena" VALUES (335, 12, 5, 3, '2021-09-10', 'ut corporis provident');
INSERT INTO "public"."resena" VALUES (336, 12, 6, 4, '2021-12-23', 'et autem sunt');
INSERT INTO "public"."resena" VALUES (337, 12, 7, 0, '2022-02-14', 'sapiente tenetur molestiae');
INSERT INTO "public"."resena" VALUES (338, 12, 8, 2, '2021-07-06', 'quod sapiente reprehenderit');
INSERT INTO "public"."resena" VALUES (339, 12, 9, 0, '2022-02-09', 'pariatur ratione aperiam');
INSERT INTO "public"."resena" VALUES (340, 12, 10, 3, '2022-02-21', 'dolorum provident ex');
INSERT INTO "public"."resena" VALUES (341, 12, 11, 0, '2022-03-20', 'aut dolorem in');
INSERT INTO "public"."resena" VALUES (342, 12, 12, 1, '2022-04-09', 'dolorem earum et');
INSERT INTO "public"."resena" VALUES (343, 12, 13, 5, '2022-04-12', 'fugit consequatur corrupti');
INSERT INTO "public"."resena" VALUES (344, 12, 14, 4, '2021-08-12', 'ad enim quisquam');
INSERT INTO "public"."resena" VALUES (345, 12, 15, 0, '2021-08-04', 'et aliquam nesciunt');
INSERT INTO "public"."resena" VALUES (346, 12, 16, 2, '2021-09-19', 'voluptatem magnam nulla');
INSERT INTO "public"."resena" VALUES (347, 12, 17, 0, '2022-05-29', 'dolorem iure eos');
INSERT INTO "public"."resena" VALUES (348, 12, 18, 2, '2022-01-08', 'adipisci sint nobis');
INSERT INTO "public"."resena" VALUES (349, 12, 19, 3, '2021-11-12', 'excepturi dignissimos aut');
INSERT INTO "public"."resena" VALUES (350, 12, 20, 0, '2021-11-26', 'quis assumenda eaque');
INSERT INTO "public"."resena" VALUES (351, 12, 21, 1, '2022-05-03', 'et illo nisi');
INSERT INTO "public"."resena" VALUES (352, 12, 22, 1, '2021-08-11', 'qui eos qui');
INSERT INTO "public"."resena" VALUES (353, 12, 23, 0, '2022-05-17', 'error est corrupti');
INSERT INTO "public"."resena" VALUES (354, 12, 24, 3, '2021-08-01', 'quo unde voluptas');
INSERT INTO "public"."resena" VALUES (355, 12, 25, 0, '2021-09-29', 'ducimus sunt voluptatem');
INSERT INTO "public"."resena" VALUES (356, 12, 26, 1, '2021-11-26', 'ratione pariatur hic');
INSERT INTO "public"."resena" VALUES (357, 12, 27, 4, '2022-01-06', 'ipsam esse quia');
INSERT INTO "public"."resena" VALUES (358, 12, 28, 5, '2021-07-27', 'perspiciatis atque delectus');
INSERT INTO "public"."resena" VALUES (359, 12, 29, 0, '2021-08-11', 'enim porro et');
INSERT INTO "public"."resena" VALUES (360, 12, 30, 1, '2021-07-01', 'culpa voluptatem est');
INSERT INTO "public"."resena" VALUES (361, 13, 1, 0, '2021-09-14', 'illum dolorum pariatur');
INSERT INTO "public"."resena" VALUES (362, 13, 2, 3, '2022-01-29', 'eum quo ut');
INSERT INTO "public"."resena" VALUES (363, 13, 3, 5, '2021-09-30', 'eveniet itaque quam');
INSERT INTO "public"."resena" VALUES (364, 13, 4, 5, '2022-03-30', 'velit ad harum');
INSERT INTO "public"."resena" VALUES (365, 13, 5, 2, '2022-03-26', 'unde et velit');
INSERT INTO "public"."resena" VALUES (366, 13, 6, 0, '2021-10-20', 'ut vero qui');
INSERT INTO "public"."resena" VALUES (367, 13, 7, 0, '2022-03-16', 'voluptate et iure');
INSERT INTO "public"."resena" VALUES (368, 13, 8, 3, '2021-09-23', 'quo temporibus ratione');
INSERT INTO "public"."resena" VALUES (369, 13, 9, 1, '2021-07-04', 'et officia optio');
INSERT INTO "public"."resena" VALUES (370, 13, 10, 4, '2021-08-23', 'et quidem voluptatem');
INSERT INTO "public"."resena" VALUES (371, 13, 11, 5, '2021-09-28', 'voluptatem similique et');
INSERT INTO "public"."resena" VALUES (372, 13, 12, 0, '2022-03-12', 'non occaecati sit');
INSERT INTO "public"."resena" VALUES (373, 13, 13, 5, '2022-01-07', 'aliquam quo quia');
INSERT INTO "public"."resena" VALUES (374, 13, 14, 4, '2022-01-18', 'est molestiae dolorem');
INSERT INTO "public"."resena" VALUES (375, 13, 15, 5, '2021-11-28', 'id debitis est');
INSERT INTO "public"."resena" VALUES (376, 13, 16, 3, '2021-10-28', 'vero enim at');
INSERT INTO "public"."resena" VALUES (377, 13, 17, 0, '2022-05-27', 'assumenda quam provident');
INSERT INTO "public"."resena" VALUES (378, 13, 18, 5, '2021-12-25', 'aut quisquam voluptatem');
INSERT INTO "public"."resena" VALUES (379, 13, 19, 1, '2021-09-29', 'occaecati itaque reprehenderit');
INSERT INTO "public"."resena" VALUES (380, 13, 20, 0, '2022-03-26', 'eum beatae id');
INSERT INTO "public"."resena" VALUES (381, 13, 21, 3, '2021-12-06', 'vitae dignissimos ipsam');
INSERT INTO "public"."resena" VALUES (382, 13, 22, 0, '2021-11-23', 'temporibus est facilis');
INSERT INTO "public"."resena" VALUES (383, 13, 23, 4, '2022-06-18', 'alias non velit');
INSERT INTO "public"."resena" VALUES (384, 13, 24, 2, '2022-04-12', 'suscipit voluptatum occaecati');
INSERT INTO "public"."resena" VALUES (385, 13, 25, 1, '2021-09-15', 'quia excepturi in');
INSERT INTO "public"."resena" VALUES (386, 13, 26, 5, '2022-03-26', 'eius praesentium velit');
INSERT INTO "public"."resena" VALUES (387, 13, 27, 5, '2021-12-20', 'consequatur ex nulla');
INSERT INTO "public"."resena" VALUES (388, 13, 28, 1, '2022-01-08', 'maiores qui dolorem');
INSERT INTO "public"."resena" VALUES (389, 13, 29, 2, '2021-06-20', 'fugiat mollitia non');
INSERT INTO "public"."resena" VALUES (390, 13, 30, 4, '2021-10-14', 'inventore voluptatibus laudantium');
INSERT INTO "public"."resena" VALUES (391, 14, 1, 1, '2022-01-09', 'dolorem quis autem');
INSERT INTO "public"."resena" VALUES (392, 14, 2, 3, '2021-08-02', 'minus sint itaque');
INSERT INTO "public"."resena" VALUES (393, 14, 3, 2, '2021-09-13', 'ea sunt eaque');
INSERT INTO "public"."resena" VALUES (394, 14, 4, 2, '2022-01-31', 'dolores ut et');
INSERT INTO "public"."resena" VALUES (395, 14, 5, 0, '2021-11-21', 'nam sequi sed');
INSERT INTO "public"."resena" VALUES (396, 14, 6, 0, '2022-05-20', 'sint illo quo');
INSERT INTO "public"."resena" VALUES (397, 14, 7, 4, '2021-08-01', 'eum ut dolorum');
INSERT INTO "public"."resena" VALUES (398, 14, 8, 0, '2021-06-22', 'dolor deserunt voluptas');
INSERT INTO "public"."resena" VALUES (399, 14, 9, 1, '2022-04-01', 'incidunt saepe qui');
INSERT INTO "public"."resena" VALUES (400, 14, 10, 3, '2021-12-12', 'quia tempore iusto');
INSERT INTO "public"."resena" VALUES (401, 14, 11, 3, '2022-04-07', 'id quod suscipit');
INSERT INTO "public"."resena" VALUES (402, 14, 12, 3, '2022-05-16', 'ut et mollitia');
INSERT INTO "public"."resena" VALUES (403, 14, 13, 3, '2021-11-27', 'omnis aut quibusdam');
INSERT INTO "public"."resena" VALUES (404, 14, 14, 2, '2021-08-09', 'aut possimus et');
INSERT INTO "public"."resena" VALUES (405, 14, 15, 5, '2021-08-26', 'voluptates ut dolore');
INSERT INTO "public"."resena" VALUES (406, 14, 16, 5, '2022-01-05', 'sed asperiores labore');
INSERT INTO "public"."resena" VALUES (407, 14, 17, 1, '2022-02-27', 'et officiis aliquid');
INSERT INTO "public"."resena" VALUES (408, 14, 18, 0, '2021-12-01', 'consequatur qui ipsa');
INSERT INTO "public"."resena" VALUES (409, 14, 19, 2, '2022-02-18', 'veniam reiciendis id');
INSERT INTO "public"."resena" VALUES (410, 14, 20, 3, '2022-04-26', 'quisquam repellat labore');
INSERT INTO "public"."resena" VALUES (411, 14, 21, 1, '2021-10-12', 'inventore perspiciatis consectetur');
INSERT INTO "public"."resena" VALUES (412, 14, 22, 2, '2022-03-10', 'non dolor enim');
INSERT INTO "public"."resena" VALUES (413, 14, 23, 5, '2021-12-30', 'esse omnis magni');
INSERT INTO "public"."resena" VALUES (414, 14, 24, 1, '2022-05-09', 'aspernatur harum sed');
INSERT INTO "public"."resena" VALUES (415, 14, 25, 5, '2021-07-06', 'impedit aliquam debitis');
INSERT INTO "public"."resena" VALUES (416, 14, 26, 0, '2021-07-11', 'enim voluptas molestiae');
INSERT INTO "public"."resena" VALUES (417, 14, 27, 3, '2021-11-11', 'aperiam sapiente nulla');
INSERT INTO "public"."resena" VALUES (418, 14, 28, 5, '2022-05-10', 'voluptate corrupti repellat');
INSERT INTO "public"."resena" VALUES (419, 14, 29, 1, '2021-11-12', 'autem deserunt dignissimos');
INSERT INTO "public"."resena" VALUES (420, 14, 30, 3, '2021-11-06', 'occaecati non veniam');
INSERT INTO "public"."resena" VALUES (421, 15, 1, 3, '2022-01-27', 'fuga commodi aut');
INSERT INTO "public"."resena" VALUES (422, 15, 2, 3, '2022-02-08', 'aut nemo ea');
INSERT INTO "public"."resena" VALUES (423, 15, 3, 1, '2021-07-28', 'illum qui quia');
INSERT INTO "public"."resena" VALUES (424, 15, 4, 0, '2022-02-03', 'explicabo deleniti vel');
INSERT INTO "public"."resena" VALUES (425, 15, 5, 3, '2021-06-24', 'ratione reprehenderit labore');
INSERT INTO "public"."resena" VALUES (426, 15, 6, 5, '2021-08-26', 'ratione aut beatae');
INSERT INTO "public"."resena" VALUES (427, 15, 7, 4, '2021-10-17', 'est quia labore');
INSERT INTO "public"."resena" VALUES (428, 15, 8, 0, '2022-04-12', 'molestiae repellat tempora');
INSERT INTO "public"."resena" VALUES (429, 15, 9, 0, '2022-02-15', 'ea et repellendus');
INSERT INTO "public"."resena" VALUES (430, 15, 10, 3, '2022-01-15', 'rerum sit est');
INSERT INTO "public"."resena" VALUES (431, 15, 11, 3, '2022-01-07', 'provident et enim');
INSERT INTO "public"."resena" VALUES (432, 15, 12, 4, '2021-10-05', 'omnis ea ex');
INSERT INTO "public"."resena" VALUES (433, 15, 13, 4, '2022-03-31', 'eum aut libero');
INSERT INTO "public"."resena" VALUES (434, 15, 14, 0, '2021-10-14', 'ea doloribus nostrum');
INSERT INTO "public"."resena" VALUES (435, 15, 15, 0, '2021-11-12', 'accusantium quae suscipit');
INSERT INTO "public"."resena" VALUES (436, 15, 16, 4, '2021-08-22', 'eligendi quo rem');
INSERT INTO "public"."resena" VALUES (437, 15, 17, 0, '2022-01-31', 'sunt quos fugiat');
INSERT INTO "public"."resena" VALUES (438, 15, 18, 0, '2021-09-01', 'possimus est tempore');
INSERT INTO "public"."resena" VALUES (439, 15, 19, 2, '2022-01-02', 'est similique magni');
INSERT INTO "public"."resena" VALUES (440, 15, 20, 3, '2021-08-26', 'corporis maxime non');
INSERT INTO "public"."resena" VALUES (441, 15, 21, 5, '2022-01-23', 'commodi occaecati incidunt');
INSERT INTO "public"."resena" VALUES (442, 15, 22, 4, '2021-10-28', 'facilis non voluptas');
INSERT INTO "public"."resena" VALUES (443, 15, 23, 0, '2022-02-04', 'ea ut tempora');
INSERT INTO "public"."resena" VALUES (444, 15, 24, 5, '2022-06-19', 'blanditiis consectetur rem');
INSERT INTO "public"."resena" VALUES (445, 15, 25, 4, '2021-10-31', 'nulla reprehenderit aliquid');
INSERT INTO "public"."resena" VALUES (446, 15, 26, 4, '2021-08-02', 'doloribus rerum possimus');
INSERT INTO "public"."resena" VALUES (447, 15, 27, 5, '2022-01-01', 'quia vel accusamus');
INSERT INTO "public"."resena" VALUES (448, 15, 28, 2, '2021-12-03', 'mollitia voluptatem vero');
INSERT INTO "public"."resena" VALUES (449, 15, 29, 0, '2021-10-22', 'voluptatibus hic similique');
INSERT INTO "public"."resena" VALUES (450, 15, 30, 3, '2021-09-02', 'dolorem dolor animi');
INSERT INTO "public"."resena" VALUES (451, 16, 1, 1, '2022-03-11', 'explicabo doloremque eius');
INSERT INTO "public"."resena" VALUES (452, 16, 2, 5, '2021-07-11', 'et fuga alias');
INSERT INTO "public"."resena" VALUES (453, 16, 3, 4, '2022-02-02', 'quibusdam consectetur et');
INSERT INTO "public"."resena" VALUES (455, 16, 5, 3, '2021-12-05', 'sapiente quidem aspernatur');
INSERT INTO "public"."resena" VALUES (456, 16, 6, 4, '2022-02-03', 'dignissimos aperiam omnis');
INSERT INTO "public"."resena" VALUES (457, 16, 7, 5, '2021-11-28', 'hic in aut');
INSERT INTO "public"."resena" VALUES (458, 16, 8, 5, '2022-06-05', 'quibusdam ab quasi');
INSERT INTO "public"."resena" VALUES (459, 16, 9, 3, '2021-11-16', 'blanditiis iure provident');
INSERT INTO "public"."resena" VALUES (460, 16, 10, 1, '2021-11-05', 'a qui modi');
INSERT INTO "public"."resena" VALUES (461, 16, 11, 1, '2022-02-05', 'repellat quidem ducimus');
INSERT INTO "public"."resena" VALUES (462, 16, 12, 0, '2021-08-27', 'repellat quae doloribus');
INSERT INTO "public"."resena" VALUES (463, 16, 13, 4, '2021-10-05', 'aut suscipit aut');
INSERT INTO "public"."resena" VALUES (464, 16, 14, 3, '2022-03-01', 'ut blanditiis magnam');
INSERT INTO "public"."resena" VALUES (465, 16, 15, 0, '2022-02-14', 'aspernatur quas dolorum');
INSERT INTO "public"."resena" VALUES (466, 16, 16, 5, '2021-11-28', 'soluta nisi ut');
INSERT INTO "public"."resena" VALUES (467, 16, 17, 5, '2022-04-23', 'omnis atque vitae');
INSERT INTO "public"."resena" VALUES (468, 16, 18, 2, '2022-02-13', 'optio magnam porro');
INSERT INTO "public"."resena" VALUES (469, 16, 19, 0, '2022-06-18', 'velit dicta voluptatem');
INSERT INTO "public"."resena" VALUES (470, 16, 20, 1, '2021-07-11', 'sunt vitae numquam');
INSERT INTO "public"."resena" VALUES (471, 16, 21, 1, '2022-03-08', 'aut provident sit');
INSERT INTO "public"."resena" VALUES (472, 16, 22, 4, '2021-08-14', 'ut illum quis');
INSERT INTO "public"."resena" VALUES (473, 16, 23, 3, '2021-08-24', 'et quisquam voluptas');
INSERT INTO "public"."resena" VALUES (474, 16, 24, 5, '2022-01-12', 'quibusdam dolorum praesentium');
INSERT INTO "public"."resena" VALUES (475, 16, 25, 0, '2022-02-26', 'ducimus sed autem');
INSERT INTO "public"."resena" VALUES (476, 16, 26, 0, '2021-09-14', 'doloremque aliquid ut');
INSERT INTO "public"."resena" VALUES (477, 16, 27, 2, '2022-04-26', 'culpa voluptatem non');
INSERT INTO "public"."resena" VALUES (478, 16, 28, 4, '2022-01-28', 'pariatur eos ratione');
INSERT INTO "public"."resena" VALUES (479, 16, 29, 3, '2022-05-06', 'nihil qui qui');
INSERT INTO "public"."resena" VALUES (480, 16, 30, 0, '2021-08-26', 'eligendi voluptas iusto');
INSERT INTO "public"."resena" VALUES (481, 17, 1, 5, '2021-08-18', 'fugiat omnis optio');
INSERT INTO "public"."resena" VALUES (482, 17, 2, 2, '2021-10-07', 'consectetur nostrum rerum');
INSERT INTO "public"."resena" VALUES (483, 17, 3, 5, '2022-05-05', 'est et enim');
INSERT INTO "public"."resena" VALUES (484, 17, 4, 3, '2022-03-23', 'ut distinctio voluptatibus');
INSERT INTO "public"."resena" VALUES (485, 17, 5, 1, '2021-09-09', 'odio delectus fuga');
INSERT INTO "public"."resena" VALUES (486, 17, 6, 4, '2021-08-14', 'enim molestias consequuntur');
INSERT INTO "public"."resena" VALUES (487, 17, 7, 2, '2021-07-06', 'et debitis distinctio');
INSERT INTO "public"."resena" VALUES (488, 17, 8, 4, '2021-09-07', 'fugit sit beatae');
INSERT INTO "public"."resena" VALUES (489, 17, 9, 1, '2021-07-22', 'reprehenderit cupiditate deserunt');
INSERT INTO "public"."resena" VALUES (490, 17, 10, 0, '2021-12-18', 'qui vel animi');
INSERT INTO "public"."resena" VALUES (491, 17, 11, 5, '2021-09-14', 'nisi alias animi');
INSERT INTO "public"."resena" VALUES (492, 17, 12, 5, '2022-03-14', 'ipsa iusto a');
INSERT INTO "public"."resena" VALUES (493, 17, 13, 2, '2022-03-01', 'ut sunt quam');
INSERT INTO "public"."resena" VALUES (494, 17, 14, 5, '2021-10-24', 'eius non necessitatibus');
INSERT INTO "public"."resena" VALUES (495, 17, 15, 5, '2022-01-14', 'porro explicabo deleniti');
INSERT INTO "public"."resena" VALUES (496, 17, 16, 5, '2021-10-09', 'veniam nihil vel');
INSERT INTO "public"."resena" VALUES (497, 17, 17, 4, '2021-12-25', 'sint commodi iure');
INSERT INTO "public"."resena" VALUES (498, 17, 18, 1, '2022-03-21', 'laudantium velit ea');
INSERT INTO "public"."resena" VALUES (499, 17, 19, 4, '2022-05-22', 'vitae doloremque et');
INSERT INTO "public"."resena" VALUES (500, 17, 20, 2, '2022-03-09', 'molestiae ullam porro');
INSERT INTO "public"."resena" VALUES (501, 17, 21, 5, '2021-07-05', 'porro est deserunt');
INSERT INTO "public"."resena" VALUES (502, 17, 22, 0, '2021-11-01', 'soluta veritatis sunt');
INSERT INTO "public"."resena" VALUES (503, 17, 23, 4, '2022-01-11', 'facilis nulla id');
INSERT INTO "public"."resena" VALUES (504, 17, 24, 1, '2021-09-22', 'reprehenderit quisquam inventore');
INSERT INTO "public"."resena" VALUES (505, 17, 25, 2, '2022-04-16', 'dolorum veniam at');
INSERT INTO "public"."resena" VALUES (506, 17, 26, 2, '2021-07-20', 'adipisci ullam totam');
INSERT INTO "public"."resena" VALUES (507, 17, 27, 4, '2022-03-27', 'consequatur nihil enim');
INSERT INTO "public"."resena" VALUES (508, 17, 28, 1, '2022-04-28', 'aut quis necessitatibus');
INSERT INTO "public"."resena" VALUES (509, 17, 29, 1, '2022-01-24', 'totam veritatis sunt');
INSERT INTO "public"."resena" VALUES (510, 17, 30, 4, '2022-03-20', 'dolor officia quo');
INSERT INTO "public"."resena" VALUES (511, 18, 1, 5, '2022-03-03', 'quis sequi deleniti');
INSERT INTO "public"."resena" VALUES (512, 18, 2, 3, '2021-09-01', 'atque et quod');
INSERT INTO "public"."resena" VALUES (513, 18, 3, 0, '2022-04-30', 'fugit harum ut');
INSERT INTO "public"."resena" VALUES (514, 18, 4, 0, '2021-07-18', 'quia impedit voluptatem');
INSERT INTO "public"."resena" VALUES (515, 18, 5, 4, '2022-05-02', 'porro non eum');
INSERT INTO "public"."resena" VALUES (516, 18, 6, 3, '2022-05-27', 'eum et blanditiis');
INSERT INTO "public"."resena" VALUES (517, 18, 7, 3, '2021-12-22', 'vero sunt molestias');
INSERT INTO "public"."resena" VALUES (518, 18, 8, 3, '2022-02-06', 'reiciendis maxime nesciunt');
INSERT INTO "public"."resena" VALUES (519, 18, 9, 4, '2021-07-31', 'aut error qui');
INSERT INTO "public"."resena" VALUES (520, 18, 10, 1, '2021-09-27', 'optio corrupti repellendus');
INSERT INTO "public"."resena" VALUES (521, 18, 11, 2, '2022-06-13', 'pariatur sit modi');
INSERT INTO "public"."resena" VALUES (522, 18, 12, 0, '2021-09-16', 'voluptatem molestiae ea');
INSERT INTO "public"."resena" VALUES (523, 18, 13, 5, '2021-10-16', 'aspernatur porro repudiandae');
INSERT INTO "public"."resena" VALUES (524, 18, 14, 1, '2022-06-18', 'quas debitis sunt');
INSERT INTO "public"."resena" VALUES (525, 18, 15, 0, '2022-04-19', 'nesciunt cumque fuga');
INSERT INTO "public"."resena" VALUES (526, 18, 16, 5, '2021-09-16', 'qui consequatur enim');
INSERT INTO "public"."resena" VALUES (527, 18, 17, 3, '2021-07-29', 'voluptatem fugiat tenetur');
INSERT INTO "public"."resena" VALUES (528, 18, 18, 5, '2022-04-16', 'itaque possimus quis');
INSERT INTO "public"."resena" VALUES (529, 18, 19, 1, '2021-07-15', 'ut distinctio consequatur');
INSERT INTO "public"."resena" VALUES (530, 18, 20, 1, '2022-02-17', 'est voluptas ex');
INSERT INTO "public"."resena" VALUES (531, 18, 21, 5, '2022-06-13', 'inventore exercitationem rerum');
INSERT INTO "public"."resena" VALUES (532, 18, 22, 4, '2022-02-09', 'cupiditate earum omnis');
INSERT INTO "public"."resena" VALUES (533, 18, 23, 3, '2022-04-05', 'eos quos quod');
INSERT INTO "public"."resena" VALUES (534, 18, 24, 4, '2021-12-15', 'rerum sit maxime');
INSERT INTO "public"."resena" VALUES (535, 18, 25, 2, '2021-06-26', 'vel qui dolore');
INSERT INTO "public"."resena" VALUES (536, 18, 26, 4, '2021-08-23', 'inventore inventore sed');
INSERT INTO "public"."resena" VALUES (537, 18, 27, 2, '2021-08-04', 'corrupti sint quae');
INSERT INTO "public"."resena" VALUES (538, 18, 28, 4, '2021-10-26', 'consequatur reiciendis odit');
INSERT INTO "public"."resena" VALUES (539, 18, 29, 4, '2022-06-04', 'omnis beatae nisi');
INSERT INTO "public"."resena" VALUES (540, 18, 30, 1, '2021-06-26', 'ipsum dignissimos nostrum');
INSERT INTO "public"."resena" VALUES (541, 19, 1, 2, '2021-07-24', 'voluptas distinctio est');
INSERT INTO "public"."resena" VALUES (542, 19, 2, 3, '2022-02-10', 'eum eum eum');
INSERT INTO "public"."resena" VALUES (543, 19, 3, 1, '2021-11-06', 'ex ipsum necessitatibus');
INSERT INTO "public"."resena" VALUES (544, 19, 4, 0, '2021-08-14', 'quia maxime dolores');
INSERT INTO "public"."resena" VALUES (545, 19, 5, 1, '2022-01-27', 'aut laboriosam eum');
INSERT INTO "public"."resena" VALUES (546, 19, 6, 2, '2021-11-28', 'est eligendi sit');
INSERT INTO "public"."resena" VALUES (547, 19, 7, 0, '2022-04-18', 'nihil voluptatibus voluptatem');
INSERT INTO "public"."resena" VALUES (548, 19, 8, 3, '2021-12-19', 'maxime molestiae voluptatem');
INSERT INTO "public"."resena" VALUES (549, 19, 9, 2, '2022-01-07', 'qui est molestiae');
INSERT INTO "public"."resena" VALUES (550, 19, 10, 2, '2022-02-11', 'eum dolores repudiandae');
INSERT INTO "public"."resena" VALUES (551, 19, 11, 2, '2022-05-22', 'accusantium doloribus voluptatum');
INSERT INTO "public"."resena" VALUES (552, 19, 12, 3, '2021-09-20', 'omnis mollitia assumenda');
INSERT INTO "public"."resena" VALUES (553, 19, 13, 3, '2022-03-03', 'reprehenderit ipsum molestiae');
INSERT INTO "public"."resena" VALUES (554, 19, 14, 4, '2021-07-28', 'veritatis illo qui');
INSERT INTO "public"."resena" VALUES (555, 19, 15, 4, '2022-04-23', 'quas id velit');
INSERT INTO "public"."resena" VALUES (556, 19, 16, 5, '2022-02-06', 'amet inventore odio');
INSERT INTO "public"."resena" VALUES (557, 19, 17, 1, '2022-05-24', 'enim sequi sequi');
INSERT INTO "public"."resena" VALUES (558, 19, 18, 2, '2022-01-25', 'corporis et enim');
INSERT INTO "public"."resena" VALUES (559, 19, 19, 3, '2021-12-20', 'quos fuga natus');
INSERT INTO "public"."resena" VALUES (560, 19, 20, 1, '2021-08-31', 'placeat autem blanditiis');
INSERT INTO "public"."resena" VALUES (561, 19, 21, 5, '2022-06-08', 'maxime omnis aut');
INSERT INTO "public"."resena" VALUES (562, 19, 22, 1, '2022-06-04', 'et aperiam enim');
INSERT INTO "public"."resena" VALUES (563, 19, 23, 2, '2021-08-13', 'delectus non molestias');
INSERT INTO "public"."resena" VALUES (564, 19, 24, 3, '2021-11-16', 'pariatur totam inventore');
INSERT INTO "public"."resena" VALUES (565, 19, 25, 4, '2021-10-24', 'facilis molestias totam');
INSERT INTO "public"."resena" VALUES (566, 19, 26, 3, '2022-04-26', 'placeat reiciendis autem');
INSERT INTO "public"."resena" VALUES (567, 19, 27, 1, '2022-01-04', 'minima omnis et');
INSERT INTO "public"."resena" VALUES (568, 19, 28, 4, '2022-05-28', 'earum ut vitae');
INSERT INTO "public"."resena" VALUES (569, 19, 29, 0, '2022-05-03', 'similique aut et');
INSERT INTO "public"."resena" VALUES (570, 19, 30, 4, '2022-06-01', 'qui odit numquam');
INSERT INTO "public"."resena" VALUES (571, 20, 1, 1, '2022-02-19', 'voluptate dolorum nulla');
INSERT INTO "public"."resena" VALUES (572, 20, 2, 0, '2021-09-14', 'eligendi soluta laudantium');
INSERT INTO "public"."resena" VALUES (573, 20, 3, 3, '2021-11-03', 'rem reiciendis architecto');
INSERT INTO "public"."resena" VALUES (574, 20, 4, 4, '2021-08-24', 'consequatur explicabo aut');
INSERT INTO "public"."resena" VALUES (575, 20, 5, 0, '2021-12-26', 'sit ipsam assumenda');
INSERT INTO "public"."resena" VALUES (576, 20, 6, 2, '2022-02-05', 'vel nisi ut');
INSERT INTO "public"."resena" VALUES (577, 20, 7, 3, '2021-10-02', 'quis qui optio');
INSERT INTO "public"."resena" VALUES (578, 20, 8, 5, '2021-10-25', 'optio sit omnis');
INSERT INTO "public"."resena" VALUES (579, 20, 9, 5, '2021-10-12', 'repellendus qui voluptatem');
INSERT INTO "public"."resena" VALUES (580, 20, 10, 5, '2022-05-02', 'quia quia quia');
INSERT INTO "public"."resena" VALUES (581, 20, 11, 5, '2022-01-12', 'possimus repudiandae dolorem');
INSERT INTO "public"."resena" VALUES (582, 20, 12, 5, '2022-04-12', 'molestiae et a');
INSERT INTO "public"."resena" VALUES (583, 20, 13, 1, '2022-06-04', 'sunt molestiae aut');
INSERT INTO "public"."resena" VALUES (584, 20, 14, 1, '2021-10-11', 'dolor molestiae fugit');
INSERT INTO "public"."resena" VALUES (585, 20, 15, 5, '2021-08-30', 'aspernatur incidunt aut');
INSERT INTO "public"."resena" VALUES (586, 20, 16, 1, '2021-10-04', 'fuga totam et');
INSERT INTO "public"."resena" VALUES (587, 20, 17, 3, '2022-04-27', 'deleniti magni provident');
INSERT INTO "public"."resena" VALUES (588, 20, 18, 0, '2021-10-06', 'molestiae dolorem aut');
INSERT INTO "public"."resena" VALUES (589, 20, 19, 3, '2022-04-24', 'qui laborum aut');
INSERT INTO "public"."resena" VALUES (590, 20, 20, 2, '2021-08-10', 'doloribus et maxime');
INSERT INTO "public"."resena" VALUES (591, 20, 21, 5, '2022-01-13', 'est vitae qui');
INSERT INTO "public"."resena" VALUES (592, 20, 22, 3, '2021-12-17', 'nam corrupti impedit');
INSERT INTO "public"."resena" VALUES (593, 20, 23, 4, '2022-05-25', 'deserunt voluptatem atque');
INSERT INTO "public"."resena" VALUES (594, 20, 24, 4, '2021-09-28', 'aliquid mollitia voluptatem');
INSERT INTO "public"."resena" VALUES (595, 20, 25, 5, '2021-12-26', 'aliquam dolores numquam');
INSERT INTO "public"."resena" VALUES (596, 20, 26, 4, '2021-10-20', 'eligendi a tempore');
INSERT INTO "public"."resena" VALUES (597, 20, 27, 4, '2022-06-17', 'at vero sunt');
INSERT INTO "public"."resena" VALUES (598, 20, 28, 5, '2022-06-03', 'dolor quos sunt');
INSERT INTO "public"."resena" VALUES (599, 20, 29, 1, '2021-12-31', 'omnis aut rerum');
INSERT INTO "public"."resena" VALUES (600, 20, 30, 3, '2021-12-05', 'dolorem ut earum');
INSERT INTO "public"."resena" VALUES (601, 21, 1, 2, '2021-07-01', 'earum aut debitis');
INSERT INTO "public"."resena" VALUES (602, 21, 2, 0, '2022-05-19', 'molestiae eveniet quos');
INSERT INTO "public"."resena" VALUES (603, 21, 3, 5, '2021-11-29', 'molestias doloribus dolore');
INSERT INTO "public"."resena" VALUES (604, 21, 4, 2, '2021-11-30', 'porro earum itaque');
INSERT INTO "public"."resena" VALUES (605, 21, 5, 5, '2021-09-20', 'temporibus doloribus quas');
INSERT INTO "public"."resena" VALUES (606, 21, 6, 3, '2022-02-11', 'eveniet voluptas et');
INSERT INTO "public"."resena" VALUES (607, 21, 7, 3, '2021-09-03', 'aut voluptatem rerum');
INSERT INTO "public"."resena" VALUES (608, 21, 8, 5, '2021-11-09', 'natus cupiditate qui');
INSERT INTO "public"."resena" VALUES (609, 21, 9, 5, '2021-07-13', 'quidem modi minima');
INSERT INTO "public"."resena" VALUES (610, 21, 10, 4, '2021-07-29', 'adipisci labore cupiditate');
INSERT INTO "public"."resena" VALUES (611, 21, 11, 3, '2021-11-15', 'nam maiores sed');
INSERT INTO "public"."resena" VALUES (612, 21, 12, 1, '2021-10-08', 'velit reprehenderit et');
INSERT INTO "public"."resena" VALUES (613, 21, 13, 3, '2022-04-17', 'pariatur nisi qui');
INSERT INTO "public"."resena" VALUES (614, 21, 14, 4, '2021-11-26', 'sed consequatur ut');
INSERT INTO "public"."resena" VALUES (615, 21, 15, 1, '2022-02-12', 'corporis ex culpa');
INSERT INTO "public"."resena" VALUES (616, 21, 16, 1, '2022-01-18', 'aliquam consequatur rerum');
INSERT INTO "public"."resena" VALUES (617, 21, 17, 4, '2022-04-23', 'odit enim nostrum');
INSERT INTO "public"."resena" VALUES (618, 21, 18, 3, '2022-05-20', 'maxime doloremque rem');
INSERT INTO "public"."resena" VALUES (619, 21, 19, 5, '2022-02-11', 'et recusandae quia');
INSERT INTO "public"."resena" VALUES (620, 21, 20, 4, '2022-02-10', 'eos est aut');
INSERT INTO "public"."resena" VALUES (621, 21, 21, 2, '2021-08-07', 'quasi non consequatur');
INSERT INTO "public"."resena" VALUES (622, 21, 22, 1, '2021-07-18', 'ipsum eligendi vero');
INSERT INTO "public"."resena" VALUES (623, 21, 23, 0, '2021-12-13', 'et ea eos');
INSERT INTO "public"."resena" VALUES (624, 21, 24, 3, '2021-11-24', 'enim et exercitationem');
INSERT INTO "public"."resena" VALUES (625, 21, 25, 1, '2021-09-24', 'tenetur animi et');
INSERT INTO "public"."resena" VALUES (626, 21, 26, 4, '2022-05-03', 'suscipit qui nobis');
INSERT INTO "public"."resena" VALUES (627, 21, 27, 0, '2021-10-28', 'aut fugiat molestiae');
INSERT INTO "public"."resena" VALUES (628, 21, 28, 1, '2021-12-12', 'deleniti alias occaecati');
INSERT INTO "public"."resena" VALUES (629, 21, 29, 4, '2022-06-15', 'qui autem corrupti');
INSERT INTO "public"."resena" VALUES (630, 21, 30, 4, '2022-05-02', 'est laudantium reprehenderit');
INSERT INTO "public"."resena" VALUES (631, 22, 1, 0, '2022-04-04', 'esse totam minima');
INSERT INTO "public"."resena" VALUES (632, 22, 2, 2, '2022-04-27', 'voluptatem accusantium expedita');
INSERT INTO "public"."resena" VALUES (633, 22, 3, 1, '2021-12-25', 'aut nesciunt est');
INSERT INTO "public"."resena" VALUES (634, 22, 4, 1, '2021-11-24', 'explicabo rem debitis');
INSERT INTO "public"."resena" VALUES (635, 22, 5, 3, '2021-07-24', 'sit unde itaque');
INSERT INTO "public"."resena" VALUES (636, 22, 6, 2, '2021-09-29', 'debitis dolorem quibusdam');
INSERT INTO "public"."resena" VALUES (637, 22, 7, 1, '2021-07-08', 'voluptas id et');
INSERT INTO "public"."resena" VALUES (638, 22, 8, 4, '2022-02-07', 'magni voluptates odio');
INSERT INTO "public"."resena" VALUES (639, 22, 9, 4, '2021-11-04', 'ullam iure laboriosam');
INSERT INTO "public"."resena" VALUES (640, 22, 10, 2, '2021-09-07', 'quis quas dignissimos');
INSERT INTO "public"."resena" VALUES (641, 22, 11, 0, '2021-08-10', 'asperiores dolore debitis');
INSERT INTO "public"."resena" VALUES (642, 22, 12, 3, '2021-11-15', 'aliquam voluptas laboriosam');
INSERT INTO "public"."resena" VALUES (643, 22, 13, 2, '2022-06-13', 'voluptatem est aspernatur');
INSERT INTO "public"."resena" VALUES (644, 22, 14, 1, '2021-07-29', 'reprehenderit autem et');
INSERT INTO "public"."resena" VALUES (645, 22, 15, 2, '2022-01-02', 'nihil rem dolore');
INSERT INTO "public"."resena" VALUES (646, 22, 16, 4, '2022-04-01', 'rerum occaecati consectetur');
INSERT INTO "public"."resena" VALUES (647, 22, 17, 5, '2022-04-20', 'eius vel voluptatibus');
INSERT INTO "public"."resena" VALUES (648, 22, 18, 5, '2022-03-04', 'pariatur doloremque sapiente');
INSERT INTO "public"."resena" VALUES (649, 22, 19, 0, '2021-12-13', 'commodi qui non');
INSERT INTO "public"."resena" VALUES (650, 22, 20, 5, '2022-06-14', 'velit accusamus accusamus');
INSERT INTO "public"."resena" VALUES (651, 22, 21, 3, '2022-01-18', 'molestiae inventore nihil');
INSERT INTO "public"."resena" VALUES (652, 22, 22, 0, '2022-04-09', 'aliquam excepturi dolores');
INSERT INTO "public"."resena" VALUES (653, 22, 23, 0, '2022-03-07', 'eveniet quia nihil');
INSERT INTO "public"."resena" VALUES (654, 22, 24, 4, '2022-05-24', 'sed optio deleniti');
INSERT INTO "public"."resena" VALUES (655, 22, 25, 4, '2021-11-10', 'amet corporis fugiat');
INSERT INTO "public"."resena" VALUES (656, 22, 26, 2, '2022-05-12', 'beatae autem atque');
INSERT INTO "public"."resena" VALUES (657, 22, 27, 2, '2021-11-22', 'quaerat odio voluptas');
INSERT INTO "public"."resena" VALUES (658, 22, 28, 5, '2021-06-27', 'eos qui deleniti');
INSERT INTO "public"."resena" VALUES (659, 22, 29, 5, '2021-08-26', 'ipsa itaque eius');
INSERT INTO "public"."resena" VALUES (660, 22, 30, 1, '2021-12-21', 'dolorum voluptatibus qui');
INSERT INTO "public"."resena" VALUES (661, 23, 1, 2, '2021-11-09', 'aliquid quia culpa');
INSERT INTO "public"."resena" VALUES (662, 23, 2, 3, '2021-10-19', 'dolorem et sit');
INSERT INTO "public"."resena" VALUES (663, 23, 3, 1, '2022-01-14', 'et consequatur odio');
INSERT INTO "public"."resena" VALUES (664, 23, 4, 3, '2021-07-10', 'unde similique quas');
INSERT INTO "public"."resena" VALUES (665, 23, 5, 4, '2021-09-13', 'similique aut cumque');
INSERT INTO "public"."resena" VALUES (666, 23, 6, 3, '2021-11-25', 'aut earum tenetur');
INSERT INTO "public"."resena" VALUES (667, 23, 7, 2, '2022-01-15', 'fugiat est vel');
INSERT INTO "public"."resena" VALUES (668, 23, 8, 4, '2021-11-18', 'ipsa fugit laboriosam');
INSERT INTO "public"."resena" VALUES (669, 23, 9, 5, '2021-06-28', 'eveniet aliquid nihil');
INSERT INTO "public"."resena" VALUES (670, 23, 10, 5, '2022-01-31', 'sed deserunt sequi');
INSERT INTO "public"."resena" VALUES (671, 23, 11, 4, '2022-01-12', 'sunt totam qui');
INSERT INTO "public"."resena" VALUES (672, 23, 12, 2, '2021-11-06', 'aliquid nihil minus');
INSERT INTO "public"."resena" VALUES (673, 23, 13, 4, '2021-10-23', 'aut sit adipisci');
INSERT INTO "public"."resena" VALUES (674, 23, 14, 5, '2022-03-14', 'non dicta similique');
INSERT INTO "public"."resena" VALUES (675, 23, 15, 3, '2021-06-27', 'omnis non et');
INSERT INTO "public"."resena" VALUES (676, 23, 16, 3, '2022-02-17', 'quo nesciunt optio');
INSERT INTO "public"."resena" VALUES (677, 23, 17, 4, '2022-06-07', 'dicta aspernatur expedita');
INSERT INTO "public"."resena" VALUES (678, 23, 18, 1, '2022-04-17', 'sit doloribus impedit');
INSERT INTO "public"."resena" VALUES (679, 23, 19, 1, '2021-12-17', 'corporis totam debitis');
INSERT INTO "public"."resena" VALUES (680, 23, 20, 1, '2022-03-22', 'sint quibusdam rerum');
INSERT INTO "public"."resena" VALUES (681, 23, 21, 5, '2021-08-08', 'doloremque quam dolores');
INSERT INTO "public"."resena" VALUES (682, 23, 22, 5, '2022-03-02', 'debitis fugiat voluptatem');
INSERT INTO "public"."resena" VALUES (683, 23, 23, 4, '2022-01-09', 'odit reprehenderit sit');
INSERT INTO "public"."resena" VALUES (684, 23, 24, 2, '2021-08-18', 'placeat et id');
INSERT INTO "public"."resena" VALUES (685, 23, 25, 0, '2022-02-23', 'ea est quia');
INSERT INTO "public"."resena" VALUES (686, 23, 26, 0, '2021-11-08', 'aliquam omnis et');
INSERT INTO "public"."resena" VALUES (687, 23, 27, 0, '2022-04-17', 'provident rerum a');
INSERT INTO "public"."resena" VALUES (688, 23, 28, 0, '2021-11-03', 'sint distinctio non');
INSERT INTO "public"."resena" VALUES (689, 23, 29, 4, '2022-01-31', 'incidunt quibusdam nemo');
INSERT INTO "public"."resena" VALUES (690, 23, 30, 2, '2022-06-05', 'itaque nemo incidunt');
INSERT INTO "public"."resena" VALUES (691, 24, 1, 1, '2022-06-18', 'molestias quis aut');
INSERT INTO "public"."resena" VALUES (692, 24, 2, 5, '2021-10-15', 'quis assumenda ut');
INSERT INTO "public"."resena" VALUES (693, 24, 3, 5, '2021-12-27', 'veritatis veniam sit');
INSERT INTO "public"."resena" VALUES (694, 24, 4, 2, '2021-12-12', 'a similique voluptate');
INSERT INTO "public"."resena" VALUES (695, 24, 5, 1, '2021-07-16', 'blanditiis molestiae iusto');
INSERT INTO "public"."resena" VALUES (696, 24, 6, 4, '2021-09-07', 'aliquam dolorem atque');
INSERT INTO "public"."resena" VALUES (697, 24, 7, 1, '2022-05-10', 'repellat esse unde');
INSERT INTO "public"."resena" VALUES (698, 24, 8, 5, '2022-06-09', 'optio et eligendi');
INSERT INTO "public"."resena" VALUES (699, 24, 9, 2, '2022-02-24', 'placeat nam corrupti');
INSERT INTO "public"."resena" VALUES (700, 24, 10, 0, '2022-06-16', 'ut sequi et');
INSERT INTO "public"."resena" VALUES (701, 24, 11, 3, '2021-11-06', 'quibusdam laborum esse');
INSERT INTO "public"."resena" VALUES (702, 24, 12, 0, '2021-06-29', 'ut magnam quidem');
INSERT INTO "public"."resena" VALUES (703, 24, 13, 3, '2021-06-23', 'repellat eos dolorem');
INSERT INTO "public"."resena" VALUES (704, 24, 14, 2, '2021-11-02', 'dicta adipisci velit');
INSERT INTO "public"."resena" VALUES (705, 24, 15, 2, '2021-11-09', 'qui aperiam occaecati');
INSERT INTO "public"."resena" VALUES (706, 24, 16, 1, '2022-05-01', 'exercitationem ullam autem');
INSERT INTO "public"."resena" VALUES (707, 24, 17, 0, '2022-02-05', 'quis ea molestiae');
INSERT INTO "public"."resena" VALUES (708, 24, 18, 0, '2021-08-18', 'explicabo atque soluta');
INSERT INTO "public"."resena" VALUES (709, 24, 19, 5, '2021-07-17', 'facere quo modi');
INSERT INTO "public"."resena" VALUES (710, 24, 20, 2, '2021-08-16', 'et ipsum veritatis');
INSERT INTO "public"."resena" VALUES (711, 24, 21, 2, '2022-05-02', 'cum quis tenetur');
INSERT INTO "public"."resena" VALUES (712, 24, 22, 2, '2022-05-16', 'voluptas quas numquam');
INSERT INTO "public"."resena" VALUES (713, 24, 23, 1, '2021-08-05', 'autem consectetur perferendis');
INSERT INTO "public"."resena" VALUES (714, 24, 24, 3, '2021-09-21', 'distinctio enim vel');
INSERT INTO "public"."resena" VALUES (715, 24, 25, 3, '2021-11-12', 'occaecati possimus ad');
INSERT INTO "public"."resena" VALUES (716, 24, 26, 4, '2021-07-30', 'ipsum sint quo');
INSERT INTO "public"."resena" VALUES (717, 24, 27, 4, '2021-09-05', 'asperiores natus asperiores');
INSERT INTO "public"."resena" VALUES (718, 24, 28, 2, '2021-07-02', 'non voluptatem quidem');
INSERT INTO "public"."resena" VALUES (719, 24, 29, 4, '2021-07-14', 'dolore quis et');
INSERT INTO "public"."resena" VALUES (720, 24, 30, 4, '2022-03-08', 'aut esse est');
INSERT INTO "public"."resena" VALUES (721, 25, 1, 1, '2021-06-29', 'ut doloremque qui');
INSERT INTO "public"."resena" VALUES (722, 25, 2, 1, '2022-03-02', 'tempora pariatur assumenda');
INSERT INTO "public"."resena" VALUES (723, 25, 3, 4, '2021-12-16', 'impedit dolorem impedit');
INSERT INTO "public"."resena" VALUES (724, 25, 4, 4, '2022-06-01', 'impedit et quo');
INSERT INTO "public"."resena" VALUES (725, 25, 5, 2, '2022-04-11', 'inventore corporis aut');
INSERT INTO "public"."resena" VALUES (726, 25, 6, 1, '2021-08-19', 'perferendis ut at');
INSERT INTO "public"."resena" VALUES (727, 25, 7, 2, '2022-03-17', 'ipsum quam est');
INSERT INTO "public"."resena" VALUES (728, 25, 8, 1, '2021-07-01', 'ut aut magnam');
INSERT INTO "public"."resena" VALUES (729, 25, 9, 5, '2021-08-02', 'qui ut deserunt');
INSERT INTO "public"."resena" VALUES (730, 25, 10, 4, '2021-08-02', 'sit voluptatem dignissimos');
INSERT INTO "public"."resena" VALUES (731, 25, 11, 5, '2021-10-23', 'ullam repellat tempora');
INSERT INTO "public"."resena" VALUES (732, 25, 12, 3, '2022-02-07', 'ut odit earum');
INSERT INTO "public"."resena" VALUES (733, 25, 13, 1, '2021-12-01', 'ipsa voluptatem id');
INSERT INTO "public"."resena" VALUES (734, 25, 14, 4, '2022-06-04', 'ipsam repudiandae facere');
INSERT INTO "public"."resena" VALUES (735, 25, 15, 1, '2021-09-20', 'suscipit earum qui');
INSERT INTO "public"."resena" VALUES (736, 25, 16, 4, '2022-06-05', 'enim temporibus ut');
INSERT INTO "public"."resena" VALUES (737, 25, 17, 4, '2022-01-03', 'ex ut asperiores');
INSERT INTO "public"."resena" VALUES (738, 25, 18, 3, '2022-06-14', 'sed laboriosam ea');
INSERT INTO "public"."resena" VALUES (739, 25, 19, 5, '2021-09-03', 'eum aut voluptatibus');
INSERT INTO "public"."resena" VALUES (740, 25, 20, 5, '2022-01-19', 'eos nemo et');
INSERT INTO "public"."resena" VALUES (741, 25, 21, 2, '2022-01-05', 'ex nemo debitis');
INSERT INTO "public"."resena" VALUES (742, 25, 22, 0, '2021-11-05', 'expedita id laudantium');
INSERT INTO "public"."resena" VALUES (743, 25, 23, 5, '2021-08-05', 'ducimus corporis ut');
INSERT INTO "public"."resena" VALUES (744, 25, 24, 0, '2021-06-26', 'tempora quasi eveniet');
INSERT INTO "public"."resena" VALUES (745, 25, 25, 3, '2021-10-14', 'eos sed quaerat');
INSERT INTO "public"."resena" VALUES (746, 25, 26, 5, '2022-03-14', 'similique veritatis voluptas');
INSERT INTO "public"."resena" VALUES (747, 25, 27, 1, '2022-05-11', 'alias et quidem');
INSERT INTO "public"."resena" VALUES (748, 25, 28, 3, '2021-12-14', 'soluta aut deleniti');
INSERT INTO "public"."resena" VALUES (749, 25, 29, 1, '2022-05-09', 'provident rerum eius');
INSERT INTO "public"."resena" VALUES (750, 25, 30, 3, '2022-03-31', 'eos molestiae et');
INSERT INTO "public"."resena" VALUES (751, 26, 1, 2, '2021-07-18', 'aliquid et numquam');
INSERT INTO "public"."resena" VALUES (752, 26, 2, 3, '2021-09-14', 'temporibus voluptatem porro');
INSERT INTO "public"."resena" VALUES (753, 26, 3, 0, '2021-10-20', 'est sequi explicabo');
INSERT INTO "public"."resena" VALUES (754, 26, 4, 5, '2022-02-24', 'assumenda nulla omnis');
INSERT INTO "public"."resena" VALUES (755, 26, 5, 4, '2021-11-06', 'animi consequatur voluptatem');
INSERT INTO "public"."resena" VALUES (756, 26, 6, 5, '2021-10-17', 'corrupti id ipsum');
INSERT INTO "public"."resena" VALUES (757, 26, 7, 4, '2021-07-25', 'quasi eum tempore');
INSERT INTO "public"."resena" VALUES (758, 26, 8, 2, '2021-07-25', 'officiis et veritatis');
INSERT INTO "public"."resena" VALUES (759, 26, 9, 3, '2022-05-14', 'est ab aut');
INSERT INTO "public"."resena" VALUES (760, 26, 10, 4, '2021-06-24', 'ut magnam odit');
INSERT INTO "public"."resena" VALUES (761, 26, 11, 0, '2022-01-30', 'sunt esse nisi');
INSERT INTO "public"."resena" VALUES (762, 26, 12, 0, '2021-11-19', 'et cumque blanditiis');
INSERT INTO "public"."resena" VALUES (763, 26, 13, 2, '2021-12-28', 'facilis ipsa delectus');
INSERT INTO "public"."resena" VALUES (764, 26, 14, 1, '2022-05-30', 'libero veniam veritatis');
INSERT INTO "public"."resena" VALUES (765, 26, 15, 5, '2022-05-01', 'molestiae pariatur nulla');
INSERT INTO "public"."resena" VALUES (766, 26, 16, 2, '2022-05-17', 'et iste sit');
INSERT INTO "public"."resena" VALUES (767, 26, 17, 3, '2021-08-28', 'accusantium id corporis');
INSERT INTO "public"."resena" VALUES (768, 26, 18, 0, '2021-09-11', 'unde sed ea');
INSERT INTO "public"."resena" VALUES (769, 26, 19, 2, '2022-05-16', 'laudantium consequatur error');
INSERT INTO "public"."resena" VALUES (770, 26, 20, 5, '2022-05-15', 'sit harum recusandae');
INSERT INTO "public"."resena" VALUES (771, 26, 21, 3, '2021-09-19', 'et odit debitis');
INSERT INTO "public"."resena" VALUES (772, 26, 22, 1, '2021-10-20', 'qui eligendi unde');
INSERT INTO "public"."resena" VALUES (773, 26, 23, 2, '2022-05-29', 'suscipit magni ipsam');
INSERT INTO "public"."resena" VALUES (774, 26, 24, 2, '2022-05-25', 'voluptate mollitia iusto');
INSERT INTO "public"."resena" VALUES (775, 26, 25, 0, '2021-08-22', 'itaque architecto molestias');
INSERT INTO "public"."resena" VALUES (776, 26, 26, 0, '2022-03-10', 'eum sed nemo');
INSERT INTO "public"."resena" VALUES (777, 26, 27, 1, '2021-12-18', 'ut architecto ipsum');
INSERT INTO "public"."resena" VALUES (778, 26, 28, 3, '2021-06-25', 'fugiat magnam unde');
INSERT INTO "public"."resena" VALUES (779, 26, 29, 3, '2022-05-28', 'aut sit ipsum');
INSERT INTO "public"."resena" VALUES (780, 26, 30, 4, '2022-04-03', 'quo ullam corporis');
INSERT INTO "public"."resena" VALUES (781, 27, 1, 4, '2021-10-02', 'minus et autem');
INSERT INTO "public"."resena" VALUES (782, 27, 2, 3, '2021-12-22', 'nihil cumque reprehenderit');
INSERT INTO "public"."resena" VALUES (783, 27, 3, 4, '2022-01-23', 'repudiandae dolorem quibusdam');
INSERT INTO "public"."resena" VALUES (784, 27, 4, 1, '2022-06-06', 'et quibusdam iste');
INSERT INTO "public"."resena" VALUES (785, 27, 5, 0, '2021-10-20', 'debitis labore et');
INSERT INTO "public"."resena" VALUES (786, 27, 6, 4, '2021-11-17', 'a est quas');
INSERT INTO "public"."resena" VALUES (787, 27, 7, 2, '2021-10-19', 'expedita consequuntur necessitatibus');
INSERT INTO "public"."resena" VALUES (788, 27, 8, 5, '2021-09-03', 'fugit et pariatur');
INSERT INTO "public"."resena" VALUES (789, 27, 9, 5, '2022-02-02', 'rem accusantium accusamus');
INSERT INTO "public"."resena" VALUES (790, 27, 10, 2, '2021-06-28', 'necessitatibus vel fugit');
INSERT INTO "public"."resena" VALUES (791, 27, 11, 0, '2021-06-28', 'enim quidem velit');
INSERT INTO "public"."resena" VALUES (792, 27, 12, 1, '2022-05-02', 'praesentium dolor et');
INSERT INTO "public"."resena" VALUES (793, 27, 13, 4, '2022-06-06', 'eum delectus rerum');
INSERT INTO "public"."resena" VALUES (794, 27, 14, 0, '2022-02-04', 'possimus voluptate consequatur');
INSERT INTO "public"."resena" VALUES (795, 27, 15, 4, '2022-04-24', 'beatae aperiam qui');
INSERT INTO "public"."resena" VALUES (796, 27, 16, 5, '2021-12-23', 'esse quia voluptatibus');
INSERT INTO "public"."resena" VALUES (797, 27, 17, 1, '2022-02-06', 'doloremque non doloribus');
INSERT INTO "public"."resena" VALUES (798, 27, 18, 4, '2022-05-06', 'velit exercitationem soluta');
INSERT INTO "public"."resena" VALUES (799, 27, 19, 1, '2021-07-06', 'in voluptates quisquam');
INSERT INTO "public"."resena" VALUES (800, 27, 20, 3, '2022-05-25', 'sint maiores sapiente');
INSERT INTO "public"."resena" VALUES (801, 27, 21, 0, '2022-02-18', 'est et cupiditate');
INSERT INTO "public"."resena" VALUES (802, 27, 22, 4, '2022-04-23', 'ea eligendi perspiciatis');
INSERT INTO "public"."resena" VALUES (803, 27, 23, 5, '2021-09-03', 'natus optio aut');
INSERT INTO "public"."resena" VALUES (804, 27, 24, 0, '2022-05-10', 'porro sapiente tempore');
INSERT INTO "public"."resena" VALUES (805, 27, 25, 1, '2021-12-08', 'ea saepe expedita');
INSERT INTO "public"."resena" VALUES (806, 27, 26, 5, '2022-02-06', 'consequatur repellendus voluptatem');
INSERT INTO "public"."resena" VALUES (807, 27, 27, 4, '2021-11-29', 'voluptates deserunt soluta');
INSERT INTO "public"."resena" VALUES (808, 27, 28, 0, '2021-08-08', 'dolorum quibusdam aliquam');
INSERT INTO "public"."resena" VALUES (809, 27, 29, 0, '2022-03-26', 'vel temporibus rem');
INSERT INTO "public"."resena" VALUES (810, 27, 30, 3, '2021-12-14', 'et iure sunt');
INSERT INTO "public"."resena" VALUES (811, 28, 1, 2, '2022-01-21', 'in doloribus voluptas');
INSERT INTO "public"."resena" VALUES (812, 28, 2, 3, '2021-10-12', 'qui voluptatem perspiciatis');
INSERT INTO "public"."resena" VALUES (813, 28, 3, 2, '2022-02-05', 'quia quia animi');
INSERT INTO "public"."resena" VALUES (814, 28, 4, 1, '2022-05-10', 'aut molestias ea');
INSERT INTO "public"."resena" VALUES (815, 28, 5, 0, '2021-11-21', 'culpa facere quasi');
INSERT INTO "public"."resena" VALUES (816, 28, 6, 2, '2021-12-12', 'consectetur rerum facere');
INSERT INTO "public"."resena" VALUES (817, 28, 7, 3, '2021-10-26', 'dolores recusandae eaque');
INSERT INTO "public"."resena" VALUES (818, 28, 8, 3, '2022-06-09', 'sapiente eos impedit');
INSERT INTO "public"."resena" VALUES (819, 28, 9, 5, '2021-12-16', 'aperiam reiciendis magni');
INSERT INTO "public"."resena" VALUES (820, 28, 10, 4, '2021-06-26', 'recusandae maiores architecto');
INSERT INTO "public"."resena" VALUES (821, 28, 11, 4, '2021-10-09', 'quia aspernatur aliquid');
INSERT INTO "public"."resena" VALUES (822, 28, 12, 0, '2022-06-08', 'impedit necessitatibus deserunt');
INSERT INTO "public"."resena" VALUES (823, 28, 13, 2, '2021-10-14', 'temporibus et voluptate');
INSERT INTO "public"."resena" VALUES (824, 28, 14, 5, '2022-01-08', 'repellendus corporis in');
INSERT INTO "public"."resena" VALUES (825, 28, 15, 1, '2022-02-04', 'deleniti eligendi suscipit');
INSERT INTO "public"."resena" VALUES (826, 28, 16, 2, '2021-06-24', 'distinctio eius et');
INSERT INTO "public"."resena" VALUES (827, 28, 17, 4, '2022-05-18', 'dolorem dolorum numquam');
INSERT INTO "public"."resena" VALUES (828, 28, 18, 1, '2022-06-19', 'et asperiores dolorum');
INSERT INTO "public"."resena" VALUES (829, 28, 19, 2, '2021-11-02', 'dolore laudantium minima');
INSERT INTO "public"."resena" VALUES (830, 28, 20, 3, '2022-06-19', 'alias quis ex');
INSERT INTO "public"."resena" VALUES (831, 28, 21, 0, '2021-09-17', 'impedit quis vel');
INSERT INTO "public"."resena" VALUES (832, 28, 22, 5, '2021-10-09', 'laboriosam aliquid qui');
INSERT INTO "public"."resena" VALUES (833, 28, 23, 3, '2021-12-20', 'vitae qui eum');
INSERT INTO "public"."resena" VALUES (834, 28, 24, 1, '2021-09-30', 'quod iure omnis');
INSERT INTO "public"."resena" VALUES (835, 28, 25, 0, '2022-03-15', 'quia voluptatem et');
INSERT INTO "public"."resena" VALUES (836, 28, 26, 2, '2022-05-01', 'voluptatum vitae sed');
INSERT INTO "public"."resena" VALUES (837, 28, 27, 1, '2021-11-15', 'provident minus occaecati');
INSERT INTO "public"."resena" VALUES (838, 28, 28, 1, '2021-10-21', 'esse similique eius');
INSERT INTO "public"."resena" VALUES (839, 28, 29, 0, '2021-09-22', 'architecto facilis nihil');
INSERT INTO "public"."resena" VALUES (840, 28, 30, 1, '2021-07-05', 'eaque commodi et');
INSERT INTO "public"."resena" VALUES (841, 29, 1, 5, '2021-09-12', 'doloremque maiores animi');
INSERT INTO "public"."resena" VALUES (842, 29, 2, 0, '2021-11-30', 'sunt tempora ipsam');
INSERT INTO "public"."resena" VALUES (843, 29, 3, 5, '2021-12-05', 'dolorem blanditiis deleniti');
INSERT INTO "public"."resena" VALUES (844, 29, 4, 1, '2022-01-03', 'delectus possimus error');
INSERT INTO "public"."resena" VALUES (845, 29, 5, 3, '2022-04-02', 'consequatur facilis et');
INSERT INTO "public"."resena" VALUES (846, 29, 6, 1, '2022-02-24', 'illum sint qui');
INSERT INTO "public"."resena" VALUES (847, 29, 7, 1, '2022-06-09', 'libero natus necessitatibus');
INSERT INTO "public"."resena" VALUES (848, 29, 8, 4, '2022-04-25', 'autem quisquam et');
INSERT INTO "public"."resena" VALUES (849, 29, 9, 0, '2021-11-24', 'quia incidunt commodi');
INSERT INTO "public"."resena" VALUES (850, 29, 10, 0, '2022-05-13', 'corrupti ullam quo');
INSERT INTO "public"."resena" VALUES (851, 29, 11, 4, '2022-01-05', 'ratione dicta dolorum');
INSERT INTO "public"."resena" VALUES (852, 29, 12, 3, '2022-02-05', 'est optio modi');
INSERT INTO "public"."resena" VALUES (853, 29, 13, 2, '2022-01-11', 'ab repellendus quo');
INSERT INTO "public"."resena" VALUES (854, 29, 14, 0, '2022-01-07', 'praesentium repellendus voluptatum');
INSERT INTO "public"."resena" VALUES (855, 29, 15, 5, '2021-12-13', 'rerum quasi sequi');
INSERT INTO "public"."resena" VALUES (856, 29, 16, 2, '2021-09-19', 'dignissimos quae magnam');
INSERT INTO "public"."resena" VALUES (857, 29, 17, 5, '2021-07-30', 'magnam quo non');
INSERT INTO "public"."resena" VALUES (858, 29, 18, 4, '2021-12-05', 'quod temporibus quibusdam');
INSERT INTO "public"."resena" VALUES (859, 29, 19, 5, '2021-11-09', 'at voluptas sed');
INSERT INTO "public"."resena" VALUES (860, 29, 20, 4, '2021-09-27', 'veniam voluptatem repudiandae');
INSERT INTO "public"."resena" VALUES (861, 29, 21, 0, '2021-08-23', 'eum voluptate suscipit');
INSERT INTO "public"."resena" VALUES (862, 29, 22, 0, '2022-02-07', 'ut omnis autem');
INSERT INTO "public"."resena" VALUES (863, 29, 23, 2, '2021-06-24', 'reprehenderit labore aut');
INSERT INTO "public"."resena" VALUES (864, 29, 24, 3, '2021-07-15', 'vel optio vitae');
INSERT INTO "public"."resena" VALUES (865, 29, 25, 2, '2021-08-19', 'sed repudiandae quia');
INSERT INTO "public"."resena" VALUES (866, 29, 26, 5, '2022-02-11', 'incidunt reprehenderit aut');
INSERT INTO "public"."resena" VALUES (867, 29, 27, 0, '2022-06-10', 'quia ex cupiditate');
INSERT INTO "public"."resena" VALUES (868, 29, 28, 3, '2021-07-02', 'voluptatem ut qui');
INSERT INTO "public"."resena" VALUES (869, 29, 29, 0, '2021-11-19', 'repudiandae magni saepe');
INSERT INTO "public"."resena" VALUES (870, 29, 30, 1, '2022-06-15', 'velit assumenda sint');
INSERT INTO "public"."resena" VALUES (871, 30, 1, 5, '2021-07-16', 'et corporis id');
INSERT INTO "public"."resena" VALUES (872, 30, 2, 4, '2021-10-08', 'sit ex dicta');
INSERT INTO "public"."resena" VALUES (873, 30, 3, 0, '2022-01-28', 'delectus officia incidunt');
INSERT INTO "public"."resena" VALUES (874, 30, 4, 4, '2021-06-24', 'voluptatem ut odio');
INSERT INTO "public"."resena" VALUES (875, 30, 5, 3, '2021-11-21', 'rem qui est');
INSERT INTO "public"."resena" VALUES (876, 30, 6, 1, '2022-02-13', 'quae provident hic');
INSERT INTO "public"."resena" VALUES (877, 30, 7, 2, '2021-12-26', 'expedita accusantium magni');
INSERT INTO "public"."resena" VALUES (878, 30, 8, 2, '2021-11-16', 'asperiores neque explicabo');
INSERT INTO "public"."resena" VALUES (879, 30, 9, 5, '2022-06-15', 'cumque animi nihil');
INSERT INTO "public"."resena" VALUES (880, 30, 10, 2, '2022-04-16', 'ratione provident quae');
INSERT INTO "public"."resena" VALUES (881, 30, 11, 1, '2021-10-14', 'dolorum voluptas ut');
INSERT INTO "public"."resena" VALUES (882, 30, 12, 2, '2021-12-06', 'commodi facilis iste');
INSERT INTO "public"."resena" VALUES (883, 30, 13, 3, '2022-03-26', 'deleniti cupiditate accusantium');
INSERT INTO "public"."resena" VALUES (884, 30, 14, 4, '2021-10-22', 'culpa id quia');
INSERT INTO "public"."resena" VALUES (885, 30, 15, 3, '2022-01-06', 'quia asperiores et');
INSERT INTO "public"."resena" VALUES (886, 30, 16, 2, '2021-12-03', 'consequatur et aperiam');
INSERT INTO "public"."resena" VALUES (887, 30, 17, 3, '2022-04-28', 'autem aperiam inventore');
INSERT INTO "public"."resena" VALUES (888, 30, 18, 2, '2021-12-06', 'assumenda aut qui');
INSERT INTO "public"."resena" VALUES (889, 30, 19, 0, '2022-02-17', 'non provident delectus');
INSERT INTO "public"."resena" VALUES (890, 30, 20, 3, '2022-05-19', 'reiciendis natus odit');
INSERT INTO "public"."resena" VALUES (891, 30, 21, 2, '2022-05-31', 'nihil quibusdam ipsa');
INSERT INTO "public"."resena" VALUES (892, 30, 22, 0, '2021-10-20', 'magnam voluptate quia');
INSERT INTO "public"."resena" VALUES (893, 30, 23, 4, '2022-03-23', 'quis et voluptas');
INSERT INTO "public"."resena" VALUES (894, 30, 24, 5, '2022-01-24', 'molestiae corrupti sed');
INSERT INTO "public"."resena" VALUES (895, 30, 25, 0, '2021-10-08', 'neque qui sapiente');
INSERT INTO "public"."resena" VALUES (896, 30, 26, 2, '2022-03-10', 'facere aut dolor');
INSERT INTO "public"."resena" VALUES (897, 30, 27, 5, '2022-06-01', 'nisi non deserunt');
INSERT INTO "public"."resena" VALUES (898, 30, 28, 2, '2022-03-18', 'voluptatem quia ab');
INSERT INTO "public"."resena" VALUES (899, 30, 29, 0, '2022-03-31', 'ab est minus');
INSERT INTO "public"."resena" VALUES (900, 30, 30, 2, '2021-07-06', 'sit molestias modi');
INSERT INTO "public"."resena" VALUES (901, 31, 1, 1, '2021-10-26', 'aliquam provident consequatur');
INSERT INTO "public"."resena" VALUES (902, 31, 2, 4, '2021-11-22', 'excepturi sed et');
INSERT INTO "public"."resena" VALUES (903, 31, 3, 2, '2021-12-06', 'omnis qui error');
INSERT INTO "public"."resena" VALUES (904, 31, 4, 3, '2022-03-02', 'occaecati quis placeat');
INSERT INTO "public"."resena" VALUES (905, 31, 5, 4, '2021-08-22', 'totam sit eos');
INSERT INTO "public"."resena" VALUES (906, 31, 6, 3, '2022-02-12', 'consequatur aut ullam');
INSERT INTO "public"."resena" VALUES (907, 31, 7, 1, '2021-11-02', 'eaque saepe itaque');
INSERT INTO "public"."resena" VALUES (908, 31, 8, 0, '2022-05-29', 'dolores et nam');
INSERT INTO "public"."resena" VALUES (909, 31, 9, 5, '2022-01-05', 'qui omnis voluptas');
INSERT INTO "public"."resena" VALUES (910, 31, 10, 1, '2022-04-16', 'ipsa ut nulla');
INSERT INTO "public"."resena" VALUES (911, 31, 11, 2, '2022-04-05', 'aliquid qui dicta');
INSERT INTO "public"."resena" VALUES (912, 31, 12, 5, '2021-09-07', 'eos dignissimos qui');
INSERT INTO "public"."resena" VALUES (913, 31, 13, 2, '2021-09-28', 'quod voluptas consequatur');
INSERT INTO "public"."resena" VALUES (914, 31, 14, 2, '2021-11-15', 'minus necessitatibus quasi');
INSERT INTO "public"."resena" VALUES (915, 31, 15, 0, '2021-11-10', 'distinctio quia sapiente');
INSERT INTO "public"."resena" VALUES (916, 31, 16, 0, '2021-09-09', 'nesciunt ullam sunt');
INSERT INTO "public"."resena" VALUES (917, 31, 17, 1, '2022-03-11', 'aliquid voluptatem non');
INSERT INTO "public"."resena" VALUES (918, 31, 18, 2, '2021-09-14', 'cumque voluptas pariatur');
INSERT INTO "public"."resena" VALUES (919, 31, 19, 4, '2021-06-29', 'rem in laudantium');
INSERT INTO "public"."resena" VALUES (920, 31, 20, 4, '2022-01-01', 'enim atque quisquam');
INSERT INTO "public"."resena" VALUES (921, 31, 21, 3, '2022-06-20', 'impedit possimus eaque');
INSERT INTO "public"."resena" VALUES (922, 31, 22, 5, '2021-11-03', 'sint inventore et');
INSERT INTO "public"."resena" VALUES (923, 31, 23, 3, '2022-04-13', 'vel sequi illo');
INSERT INTO "public"."resena" VALUES (924, 31, 24, 1, '2021-10-27', 'commodi nisi velit');
INSERT INTO "public"."resena" VALUES (925, 31, 25, 1, '2022-05-04', 'porro dolor id');
INSERT INTO "public"."resena" VALUES (926, 31, 26, 5, '2021-09-12', 'cumque velit iure');
INSERT INTO "public"."resena" VALUES (927, 31, 27, 4, '2022-01-24', 'ut consequatur ut');
INSERT INTO "public"."resena" VALUES (928, 31, 28, 3, '2022-02-15', 'repellat et ut');
INSERT INTO "public"."resena" VALUES (929, 31, 29, 5, '2021-06-20', 'animi quo quia');
INSERT INTO "public"."resena" VALUES (930, 31, 30, 5, '2021-08-24', 'et consequatur vitae');
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
INSERT INTO "public"."restaurante" VALUES (1, 'Marvin, Shanahan and Wyman', 'Vermont', 'Clemmie Pines', 1906, 14513, 'South Jaime');
INSERT INTO "public"."restaurante" VALUES (2, 'Heidenreich Group', 'New Mexico', 'Franey Flat', 74054, 43353, 'Fort Hermann');
INSERT INTO "public"."restaurante" VALUES (3, 'Hahn Group', 'Alabama', 'Syble Stream', 74656, 48661, 'Hertaland');
INSERT INTO "public"."restaurante" VALUES (4, 'Grady - Murazik', 'Maryland', 'Jayce Court', 30923, 16506, 'Schultzmouth');
INSERT INTO "public"."restaurante" VALUES (5, 'Bashirian, Koelpin and Bayer', 'Alaska', 'Schoen Harbor', 14688, 90141, 'Vista');
INSERT INTO "public"."restaurante" VALUES (6, 'Leuschke Inc', 'Delaware', 'Thompson Branch', 24593, 10316, 'New Randy');
INSERT INTO "public"."restaurante" VALUES (7, 'Hegmann, Wiegand and Feil', 'Maine', 'Leannon Square', 65388, 93415, 'Kerlukeburgh');
INSERT INTO "public"."restaurante" VALUES (8, 'Sporer - Wuckert', 'Kansas', 'Preston Via', 50549, 58105, 'Hellerborough');
INSERT INTO "public"."restaurante" VALUES (9, 'Kuhlman, Goyette and Hilll', 'New Mexico', 'Etha Cliffs', 25498, 42471, 'Elizabethmouth');
INSERT INTO "public"."restaurante" VALUES (10, 'Kuhn - Cronin', 'Wisconsin', 'Gerlach Crescent', 73463, 86765, 'Veumview');
INSERT INTO "public"."restaurante" VALUES (11, 'Davis Inc', 'Hawaii', 'Hailee Ford', 46675, 74326, 'Southfield');
INSERT INTO "public"."restaurante" VALUES (12, 'Grady Group', 'Texas', 'Francisco Mountain', 49326, 74861, 'Bristol');
INSERT INTO "public"."restaurante" VALUES (13, 'Cartwright - Koss', 'Alabama', 'Raynor Alley', 7740, 79562, 'East Marcellefield');
INSERT INTO "public"."restaurante" VALUES (14, 'Dicki, Durgan and Reichert', 'Oklahoma', 'Nyasia Row', 60975, 32532, 'Fort Maiyastead');
INSERT INTO "public"."restaurante" VALUES (15, 'Kuhlman, Breitenberg and Stehr', 'Connecticut', 'Maynard Run', 4649, 97585, 'O''Connertown');
INSERT INTO "public"."restaurante" VALUES (16, 'Gleason - Kovacek', 'Nevada', 'Sienna Station', 92430, 18898, 'Fort Laurine');
INSERT INTO "public"."restaurante" VALUES (17, 'Roberts Inc', 'Arizona', 'Bridie Forge', 85793, 49312, 'Monahantown');
INSERT INTO "public"."restaurante" VALUES (18, 'Ward and Sons', 'Wisconsin', 'Murazik Glens', 68784, 98858, 'Hickleberg');
INSERT INTO "public"."restaurante" VALUES (19, 'Rath - Fadel', 'North Carolina', 'Metz Parkways', 30332, 40346, 'Fort Garnet');
INSERT INTO "public"."restaurante" VALUES (20, 'Johns - Osinski', 'Vermont', 'Gottlieb Hills', 10976, 53820, 'Borerstad');
INSERT INTO "public"."restaurante" VALUES (21, 'Muller LLC', 'Indiana', 'Lorna Centers', 67833, 63509, 'Abigailshire');
INSERT INTO "public"."restaurante" VALUES (22, 'Thompson, Kunde and Hane', 'Arkansas', 'Bergnaum Lodge', 78586, 43223, 'Nevachester');
INSERT INTO "public"."restaurante" VALUES (23, 'Wolff, Stark and Kuhic', 'Michigan', 'Dahlia Road', 73319, 9925, 'West Babylon');
INSERT INTO "public"."restaurante" VALUES (24, 'Schoen - Schaden', 'Texas', 'Cali Square', 54824, 58982, 'East Damarisstad');
INSERT INTO "public"."restaurante" VALUES (25, 'Boyer, Sporer and Fahey', 'Tennessee', 'White Plaza', 45799, 47019, 'Margeville');
INSERT INTO "public"."restaurante" VALUES (26, 'Altenwerth - Becker', 'Wyoming', 'Tiffany Tunnel', 1598, 52361, 'North Yadira');
INSERT INTO "public"."restaurante" VALUES (27, 'Hilll, Collier and Thiel', 'Ohio', 'Ethan Forge', 90779, 82427, 'Madelynworth');
INSERT INTO "public"."restaurante" VALUES (28, 'Lubowitz, Blanda and Auer', 'Alabama', 'Everette Plains', 13661, 60374, 'South Stevie');
INSERT INTO "public"."restaurante" VALUES (29, 'Bergnaum - Johnson', 'Alaska', 'Alexanne Glen', 6203, 93427, 'Georgetown');
INSERT INTO "public"."restaurante" VALUES (30, 'Reinger - Buckridge', 'Alabama', 'Hirthe Motorway', 46002, 41928, 'New Margaretteworth');
INSERT INTO "public"."restaurante" VALUES (31, 'Reichert LLC', 'Vermont', 'Metz Tunnel', 7282, 16457, 'Leuschketon');
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
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 1, 'f', 'Brianne                                                                                             ', 'Labadie                                                                                             ', 'Bernier                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 2, 'f', 'Fred                                                                                                ', 'Welch                                                                                               ', 'Shields                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 3, 'f', 'Green                                                                                               ', 'Shanahan                                                                                            ', 'Leffler                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 4, 'f', 'Demetrius                                                                                           ', 'Ledner                                                                                              ', 'Anderson                                                                                            ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 5, 'f', 'Jarvis                                                                                              ', 'Erdman                                                                                              ', 'Maggio                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 6, 'f', 'Elwyn                                                                                               ', 'Mueller                                                                                             ', 'Jaskolski                                                                                           ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 7, 'f', 'Allan                                                                                               ', 'Wunsch                                                                                              ', 'Armstrong                                                                                           ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 8, 'f', 'Mattie                                                                                              ', 'West                                                                                                ', 'Boyer                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 9, 'f', 'Porter                                                                                              ', 'Moen                                                                                                ', 'Haag                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 10, 'f', 'Dorris                                                                                              ', 'Leannon                                                                                             ', 'Bartell                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 11, 'f', 'Kamille                                                                                             ', 'Rohan                                                                                               ', 'Harper                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 12, 'f', 'Alanna                                                                                              ', 'Denesik                                                                                             ', 'Skyler                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 13, 'f', 'Kirsten                                                                                             ', 'Legros                                                                                              ', 'Cameron                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 14, 'f', 'Geovanni                                                                                            ', 'Doyle                                                                                               ', 'Rowan                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 15, 'f', 'Sim                                                                                                 ', 'Jast                                                                                                ', 'Harper                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 16, 'f', 'Heber                                                                                               ', 'Lowe                                                                                                ', 'Shiloh                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 17, 'f', 'Elyssa                                                                                              ', 'Kub                                                                                                 ', 'Kai                                                                                                 ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 18, 'f', 'Makenna                                                                                             ', 'Rau                                                                                                 ', 'Charlie                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 19, 'f', 'Xzavier                                                                                             ', 'Dickens                                                                                             ', 'Shiloh                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 20, 'f', 'Zelma                                                                                               ', 'Heathcote                                                                                           ', 'Angel                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 21, 'f', 'Izaiah                                                                                              ', 'Johnston                                                                                            ', 'London                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 22, 'f', 'Cora                                                                                                ', 'Schuster                                                                                            ', 'Harper                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 23, 'f', 'Douglas                                                                                             ', 'Bins                                                                                                ', 'Reese                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 24, 'f', 'Mozell                                                                                              ', 'Veum                                                                                                ', 'Emerson                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 25, 'f', 'Torrey                                                                                              ', 'Zieme                                                                                               ', 'Reign                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 26, 'f', 'Jody                                                                                                ', 'Gutkowski                                                                                           ', 'Billie                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 27, 'f', 'Houston                                                                                             ', 'Rempel                                                                                              ', 'Cameron                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 28, 'f', 'Antoinette                                                                                          ', 'Pacocha                                                                                             ', 'Finley                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 29, 'f', 'Ella                                                                                                ', 'Hagenes                                                                                             ', 'Noah                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 30, 'f', 'Vada                                                                                                ', 'Wisoky                                                                                              ', 'Addison                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 31, 'f', 'Adolph                                                                                              ', 'Lind                                                                                                ', 'Micah                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 32, 'f', 'Laila                                                                                               ', 'Kris                                                                                                ', 'Emerson                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 33, 'f', 'Cesar                                                                                               ', 'Miller                                                                                              ', 'Harper                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 34, 'f', 'Dolores                                                                                             ', 'Koss                                                                                                ', 'Kendall                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 35, 'f', 'Deangelo                                                                                            ', 'Greenfelder                                                                                         ', 'Dakota                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 36, 'f', 'Jaunita                                                                                             ', 'Kulas                                                                                               ', 'Jordan                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 37, 'f', 'Kadin                                                                                               ', 'Nikolaus                                                                                            ', 'Ellis                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 38, 'f', 'Tad                                                                                                 ', 'Bashirian                                                                                           ', 'River                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 39, 'f', 'Gabe                                                                                                ', 'Bednar                                                                                              ', 'Reagan                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 40, 'f', 'Reynold                                                                                             ', 'Renner                                                                                              ', 'August                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 41, 'f', 'Marcellus                                                                                           ', 'Kshlerin                                                                                            ', 'Austin                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 42, 'f', 'Reynold                                                                                             ', 'Hane                                                                                                ', 'Reign                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 43, 'f', 'Cynthia                                                                                             ', 'Spinka                                                                                              ', 'River                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 44, 'f', 'Genesis                                                                                             ', 'Langworth                                                                                           ', 'Avery                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 45, 'f', 'Aida                                                                                                ', 'Flatley                                                                                             ', 'Kyle                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 46, 'f', 'Adam                                                                                                ', 'Ortiz                                                                                               ', 'Leslie                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 47, 'f', 'Hazle                                                                                               ', 'Price                                                                                               ', 'Charlie                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 48, 'f', 'Matilde                                                                                             ', 'Wolf                                                                                                ', 'Elliott                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 49, 'f', 'Judah                                                                                               ', 'Gleichner                                                                                           ', 'Noah                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 50, 'f', 'Marge                                                                                               ', 'Beier                                                                                               ', 'Corey                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 51, 'f', 'Johnson                                                                                             ', 'Feeney                                                                                              ', 'Noah                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 52, 'f', 'Andreane                                                                                            ', 'Gaylord                                                                                             ', 'Harper                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 53, 'f', 'Jedidiah                                                                                            ', 'Rath                                                                                                ', 'Shawn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 54, 'f', 'Julianne                                                                                            ', 'Pacocha                                                                                             ', 'Cameron                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 55, 'f', 'Bart                                                                                                ', 'Leffler                                                                                             ', 'Finley                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 56, 'f', 'Hiram                                                                                               ', 'Doyle                                                                                               ', 'Rory                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 57, 'f', 'Sigmund                                                                                             ', 'Streich                                                                                             ', 'Emerson                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 58, 'f', 'Ayla                                                                                                ', 'Reichert                                                                                            ', 'Dakota                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 59, 'f', 'Lola                                                                                                ', 'Conroy                                                                                              ', 'Reese                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 60, 'f', 'Timmothy                                                                                            ', 'Dare                                                                                                ', 'Kennedy                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 61, 'f', 'Rubye                                                                                               ', 'Effertz                                                                                             ', 'Robin                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 62, 'f', 'Rudolph                                                                                             ', 'Runolfsdottir                                                                                       ', 'Jordan                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 63, 'f', 'Tessie                                                                                              ', 'Herzog                                                                                              ', 'Alex                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 64, 'f', 'Cornell                                                                                             ', 'Mills                                                                                               ', 'Skyler                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 65, 'f', 'Thalia                                                                                              ', 'Morissette                                                                                          ', 'Elliott                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 66, 'f', 'Maia                                                                                                ', 'Dickinson                                                                                           ', 'Nico                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 67, 'f', 'Rhianna                                                                                             ', 'Smitham                                                                                             ', 'Shiloh                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 68, 'f', 'Audreanne                                                                                           ', 'Lang                                                                                                ', 'Hayden                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 69, 'f', 'Brett                                                                                               ', 'Erdman                                                                                              ', 'Greer                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 70, 'f', 'Bette                                                                                               ', 'Harris                                                                                              ', 'Jules                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 71, 'f', 'Carissa                                                                                             ', 'Becker                                                                                              ', 'Hayden                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 72, 'f', 'King                                                                                                ', 'Hintz                                                                                               ', 'Quinn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 73, 'f', 'Alec                                                                                                ', 'Aufderhar                                                                                           ', 'Kai                                                                                                 ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 74, 'f', 'Adell                                                                                               ', 'Harber                                                                                              ', 'Avery                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 75, 'f', 'Alyce                                                                                               ', 'Marks                                                                                               ', 'Finley                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 76, 'f', 'Frieda                                                                                              ', 'Reichert                                                                                            ', 'Micah                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 77, 'f', 'Twila                                                                                               ', 'White                                                                                               ', 'Reese                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 78, 'f', 'Jacinthe                                                                                            ', 'Kuphal                                                                                              ', 'Riley                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 79, 'f', 'Cale                                                                                                ', 'Schowalter                                                                                          ', 'Addison                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 80, 'f', 'Angelita                                                                                            ', 'Sipes                                                                                               ', 'Shawn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 81, 'f', 'Liam                                                                                                ', 'Block                                                                                               ', 'Sasha                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 82, 'f', 'Andreane                                                                                            ', 'Rutherford                                                                                          ', 'Kendall                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 83, 'f', 'Marilie                                                                                             ', 'Leannon                                                                                             ', 'Emerson                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 84, 'f', 'Arvid                                                                                               ', 'Runolfsdottir                                                                                       ', 'Ryan                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 85, 'f', 'Cassidy                                                                                             ', 'Hilll                                                                                               ', 'Quinn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 86, 'f', 'Grover                                                                                              ', 'Brown                                                                                               ', 'Sasha                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 87, 'f', 'Corrine                                                                                             ', 'Littel                                                                                              ', 'Parker                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 88, 'f', 'Angelina                                                                                            ', 'Bradtke                                                                                             ', 'Jaden                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 89, 'f', 'Mavis                                                                                               ', 'Leffler                                                                                             ', 'Brooklyn                                                                                            ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 90, 'f', 'Raoul                                                                                               ', 'Heaney                                                                                              ', 'Jules                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 91, 'f', 'Vanessa                                                                                             ', 'Daniel                                                                                              ', 'Robin                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 92, 'f', 'Markus                                                                                              ', 'Fritsch                                                                                             ', 'Parker                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 93, 'f', 'Eliezer                                                                                             ', 'Jakubowski                                                                                          ', 'Austin                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 94, 'f', 'Kacie                                                                                               ', 'Corkery                                                                                             ', 'Emerson                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 95, 'f', 'Katelin                                                                                             ', 'Kub                                                                                                 ', 'Parker                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 96, 'f', 'Colby                                                                                               ', 'Corwin                                                                                              ', 'Harper                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 97, 'f', 'Corine                                                                                              ', 'O''Keefe                                                                                             ', 'Sawyer                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 98, 'f', 'Celestine                                                                                           ', 'Satterfield                                                                                         ', 'Phoenix                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 99, 'f', 'Bernadine                                                                                           ', 'Carroll                                                                                             ', 'Emerson                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 100, 'f', 'Madalyn                                                                                             ', 'Bogan                                                                                               ', 'Shiloh                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 101, 'f', 'Landen                                                                                              ', 'Huel                                                                                                ', 'Addison                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 102, 'f', 'Alden                                                                                               ', 'Waters                                                                                              ', 'Shawn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 103, 'f', 'Cleveland                                                                                           ', 'Windler                                                                                             ', 'Ellis                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 104, 'f', 'Kira                                                                                                ', 'Corwin                                                                                              ', 'Kendall                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 105, 'f', 'Astrid                                                                                              ', 'Harris                                                                                              ', 'Logan                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 106, 'f', 'Donna                                                                                               ', 'Homenick                                                                                            ', 'Ryan                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 107, 'f', 'Earnest                                                                                             ', 'Gerlach                                                                                             ', 'Angel                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 108, 'f', 'Julius                                                                                              ', 'Pollich                                                                                             ', 'Logan                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 109, 'f', 'Sid                                                                                                 ', 'Ernser                                                                                              ', 'Cameron                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 110, 'f', 'Muriel                                                                                              ', 'Bahringer                                                                                           ', 'Leslie                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 111, 'f', 'Thea                                                                                                ', 'Runolfsson                                                                                          ', 'Riley                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 112, 'f', 'Noble                                                                                               ', 'Kreiger                                                                                             ', 'Reign                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 113, 'f', 'Dante                                                                                               ', 'Gerhold                                                                                             ', 'Angel                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 114, 'f', 'Boris                                                                                               ', 'Oberbrunner                                                                                         ', 'Emerson                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 115, 'f', 'Judd                                                                                                ', 'Orn                                                                                                 ', 'Kai                                                                                                 ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 116, 'f', 'Marianna                                                                                            ', 'Feil                                                                                                ', 'Sage                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 117, 'f', 'Malachi                                                                                             ', 'Sawayn                                                                                              ', 'Jules                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 118, 'f', 'Ray                                                                                                 ', 'Auer                                                                                                ', 'August                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 119, 'f', 'Shad                                                                                                ', 'White                                                                                               ', 'Riley                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 120, 'f', 'Domenica                                                                                            ', 'Paucek                                                                                              ', 'Kai                                                                                                 ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 121, 'f', 'Dashawn                                                                                             ', 'Mraz                                                                                                ', 'Charlie                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 122, 'f', 'Hubert                                                                                              ', 'Mante                                                                                               ', 'Riley                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 123, 'f', 'Margaretta                                                                                          ', 'Kuphal                                                                                              ', 'Brooklyn                                                                                            ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 124, 'f', 'Bernardo                                                                                            ', 'Sanford                                                                                             ', 'Blake                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 125, 'f', 'Diana                                                                                               ', 'Weber                                                                                               ', 'Gray                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 126, 'f', 'Jeramie                                                                                             ', 'Batz                                                                                                ', 'Drew                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 127, 'f', 'Keanu                                                                                               ', 'Ebert                                                                                               ', 'Shiloh                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 128, 'f', 'Granville                                                                                           ', 'Terry                                                                                               ', 'Kyle                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 129, 'f', 'Rodrick                                                                                             ', 'Russel                                                                                              ', 'Phoenix                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 130, 'f', 'Heaven                                                                                              ', 'Kuvalis                                                                                             ', 'Parker                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 131, 'f', 'Fernando                                                                                            ', 'Jerde                                                                                               ', 'Nico                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 132, 'f', 'Lois                                                                                                ', 'Jerde                                                                                               ', 'Emerson                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 133, 'f', 'Gonzalo                                                                                             ', 'Stiedemann                                                                                          ', 'Cameron                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 134, 'f', 'Mac                                                                                                 ', 'Thompson                                                                                            ', 'Noah                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 135, 'f', 'Bert                                                                                                ', 'Mosciski                                                                                            ', 'Micah                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 136, 'f', 'Mable                                                                                               ', 'Hayes                                                                                               ', 'August                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 137, 'f', 'Nyah                                                                                                ', 'Littel                                                                                              ', 'Gray                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 138, 'f', 'America                                                                                             ', 'Glover                                                                                              ', 'Ellis                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 139, 'f', 'Geovanni                                                                                            ', 'Schuppe                                                                                             ', 'Harper                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 140, 'f', 'Dino                                                                                                ', 'Krajcik                                                                                             ', 'Leslie                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 141, 'f', 'Robyn                                                                                               ', 'Weissnat                                                                                            ', 'Jordan                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 142, 'f', 'Alexandre                                                                                           ', 'Torphy                                                                                              ', 'Sage                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 143, 'f', 'Noble                                                                                               ', 'Willms                                                                                              ', 'Rowan                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 144, 'f', 'Kayden                                                                                              ', 'Hermiston                                                                                           ', 'Nico                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 145, 'f', 'Malika                                                                                              ', 'Jaskolski                                                                                           ', 'Nico                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 146, 'f', 'Domenic                                                                                             ', 'Hahn                                                                                                ', 'Finley                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 147, 'f', 'Agustin                                                                                             ', 'Roberts                                                                                             ', 'Bowie                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 148, 'f', 'Mercedes                                                                                            ', 'Gottlieb                                                                                            ', 'Jules                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 149, 'f', 'Seth                                                                                                ', 'Ryan                                                                                                ', 'Sasha                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 150, 'f', 'Ernie                                                                                               ', 'Simonis                                                                                             ', 'Riley                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 151, 'f', 'Helmer                                                                                              ', 'Graham                                                                                              ', 'Ellis                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 152, 'f', 'Anderson                                                                                            ', 'Carter                                                                                              ', 'Gray                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 153, 'f', 'Davon                                                                                               ', 'Weimann                                                                                             ', 'Finley                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 154, 'f', 'Krystel                                                                                             ', 'Schoen                                                                                              ', 'Sawyer                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 155, 'f', 'Alessia                                                                                             ', 'O''Reilly                                                                                            ', 'Addison                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 156, 'f', 'Jaylon                                                                                              ', 'Armstrong                                                                                           ', 'Charlie                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 157, 'f', 'Toby                                                                                                ', 'Farrell                                                                                             ', 'Austin                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 158, 'f', 'Anastasia                                                                                           ', 'Kuhic                                                                                               ', 'Micah                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 159, 'f', 'Kiarra                                                                                              ', 'Shields                                                                                             ', 'Phoenix                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 160, 'f', 'Jarrett                                                                                             ', 'Heller                                                                                              ', 'Bowie                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 161, 'f', 'Ricardo                                                                                             ', 'Harris                                                                                              ', 'Alex                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 162, 'f', 'Wyman                                                                                               ', 'Rice                                                                                                ', 'Rory                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 163, 'f', 'Hassie                                                                                              ', 'Erdman                                                                                              ', 'August                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 164, 'f', 'Dayton                                                                                              ', 'Treutel                                                                                             ', 'River                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 165, 'f', 'Ford                                                                                                ', 'Becker                                                                                              ', 'Robin                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 166, 'f', 'Providenci                                                                                          ', 'Kassulke                                                                                            ', 'Sage                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 167, 'f', 'Isadore                                                                                             ', 'Sawayn                                                                                              ', 'Reese                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 168, 'f', 'Kamren                                                                                              ', 'Herman                                                                                              ', 'Shiloh                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 169, 'f', 'Perry                                                                                               ', 'Simonis                                                                                             ', 'Skyler                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 170, 'f', 'Brycen                                                                                              ', 'Hoeger                                                                                              ', 'Sawyer                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 171, 'f', 'Alexandra                                                                                           ', 'Gusikowski                                                                                          ', 'Avery                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 172, 'f', 'Donnell                                                                                             ', 'Becker                                                                                              ', 'River                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 173, 'f', 'Ethelyn                                                                                             ', 'Boehm                                                                                               ', 'Taylor                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 174, 'f', 'Myrtle                                                                                              ', 'Waters                                                                                              ', 'Kendall                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 175, 'f', 'Gilbert                                                                                             ', 'Stracke                                                                                             ', 'Leslie                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 176, 'f', 'Reid                                                                                                ', 'Dooley                                                                                              ', 'Bailey                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 177, 'f', 'Sasha                                                                                               ', 'Mann                                                                                                ', 'Reese                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 178, 'f', 'Ted                                                                                                 ', 'McDermott                                                                                           ', 'Gray                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 179, 'f', 'Carmel                                                                                              ', 'White                                                                                               ', 'Ellis                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 180, 'f', 'Macy                                                                                                ', 'Weber                                                                                               ', 'Logan                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 181, 'f', 'Edmond                                                                                              ', 'Torphy                                                                                              ', 'Avery                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 182, 'f', 'Fermin                                                                                              ', 'Ledner                                                                                              ', 'Ellis                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 183, 'f', 'Sammy                                                                                               ', 'Leuschke                                                                                            ', 'Rory                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 184, 'f', 'Danielle                                                                                            ', 'Purdy                                                                                               ', 'Sage                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 185, 'f', 'Elian                                                                                               ', 'Pouros                                                                                              ', 'Noah                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 186, 'f', 'Marilie                                                                                             ', 'Stokes                                                                                              ', 'Alex                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 187, 'f', 'Jackeline                                                                                           ', 'Block                                                                                               ', 'Angel                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 188, 'f', 'Jaylin                                                                                              ', 'Mertz                                                                                               ', 'Corey                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 189, 'f', 'Graciela                                                                                            ', 'Schinner                                                                                            ', 'Addison                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 190, 'f', 'Kristina                                                                                            ', 'Waelchi                                                                                             ', 'Anderson                                                                                            ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 191, 'f', 'Dakota                                                                                              ', 'Will                                                                                                ', 'Blake                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 192, 'f', 'Tressie                                                                                             ', 'Conn                                                                                                ', 'Emerson                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 193, 'f', 'Moises                                                                                              ', 'Harris                                                                                              ', 'Corey                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 194, 'f', 'Zora                                                                                                ', 'Veum                                                                                                ', 'Avery                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 195, 'f', 'Cielo                                                                                               ', 'Kemmer                                                                                              ', 'Jaden                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 196, 'f', 'Consuelo                                                                                            ', 'Moen                                                                                                ', 'Austin                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 197, 'f', 'Frankie                                                                                             ', 'Gleason                                                                                             ', 'Jaden                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 198, 'f', 'Ada                                                                                                 ', 'Cronin                                                                                              ', 'Jules                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 199, 'f', 'Ressie                                                                                              ', 'Wunsch                                                                                              ', 'Bailey                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 200, 'f', 'Martina                                                                                             ', 'Ortiz                                                                                               ', 'Corey                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 201, 'f', 'Rowena                                                                                              ', 'Towne                                                                                               ', 'Anderson                                                                                            ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 202, 'f', 'Mollie                                                                                              ', 'Jacobson                                                                                            ', 'Dakota                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 203, 'f', 'Sid                                                                                                 ', 'Bogan                                                                                               ', 'Ryan                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 204, 'f', 'Jalen                                                                                               ', 'Heller                                                                                              ', 'Jordan                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 205, 'f', 'Tia                                                                                                 ', 'Lehner                                                                                              ', 'Finley                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 206, 'f', 'Roma                                                                                                ', 'Streich                                                                                             ', 'Marlowe                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 207, 'f', 'Uriah                                                                                               ', 'Stroman                                                                                             ', 'Arden                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 208, 'f', 'Irwin                                                                                               ', 'Marvin                                                                                              ', 'Nico                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 209, 'f', 'Abdullah                                                                                            ', 'Ebert                                                                                               ', 'Jaden                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 210, 'f', 'Khalid                                                                                              ', 'Stark                                                                                               ', 'Dakota                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 211, 'f', 'Lilly                                                                                               ', 'Block                                                                                               ', 'London                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 212, 'f', 'Brook                                                                                               ', 'Kunde                                                                                               ', 'Hayden                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 213, 'f', 'Elwyn                                                                                               ', 'Corkery                                                                                             ', 'Bailey                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 214, 'f', 'Haven                                                                                               ', 'Moore                                                                                               ', 'Reign                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 215, 'f', 'Darius                                                                                              ', 'Goldner                                                                                             ', 'Shawn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 216, 'f', 'Elmer                                                                                               ', 'McClure                                                                                             ', 'Kyle                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 217, 'f', 'Herbert                                                                                             ', 'Lindgren                                                                                            ', 'Shiloh                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 218, 'f', 'Cleta                                                                                               ', 'McLaughlin                                                                                          ', 'Shawn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 219, 'f', 'Buford                                                                                              ', 'Schowalter                                                                                          ', 'Sawyer                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 220, 'f', 'Asia                                                                                                ', 'Herzog                                                                                              ', 'Ryan                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 221, 'f', 'Karolann                                                                                            ', 'Sipes                                                                                               ', 'Ellis                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 222, 'f', 'Edyth                                                                                               ', 'Grady                                                                                               ', 'Robin                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 223, 'f', 'Garnet                                                                                              ', 'Schmitt                                                                                             ', 'Shiloh                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 224, 'f', 'Jordon                                                                                              ', 'Gottlieb                                                                                            ', 'Bailey                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 225, 'f', 'Jordon                                                                                              ', 'Corwin                                                                                              ', 'Jordan                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 226, 'f', 'Barrett                                                                                             ', 'Kuhn                                                                                                ', 'Nico                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 227, 'f', 'Carmine                                                                                             ', 'Sauer                                                                                               ', 'Rowan                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 228, 'f', 'Audra                                                                                               ', 'McCullough                                                                                          ', 'Logan                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 229, 'f', 'Durward                                                                                             ', 'Halvorson                                                                                           ', 'Kendall                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 230, 'f', 'Ebba                                                                                                ', 'Kris                                                                                                ', 'Ryan                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 231, 'f', 'Frances                                                                                             ', 'Johns                                                                                               ', 'Parker                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 232, 'f', 'Clifford                                                                                            ', 'Hackett                                                                                             ', 'Skyler                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 233, 'f', 'Hadley                                                                                              ', 'Rohan                                                                                               ', 'Sawyer                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 234, 'f', 'Myrna                                                                                               ', 'Bradtke                                                                                             ', 'James                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 235, 'f', 'Bridie                                                                                              ', 'Stroman                                                                                             ', 'Greer                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 236, 'f', 'Lucinda                                                                                             ', 'Jaskolski                                                                                           ', 'Emerson                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 237, 'f', 'Cruz                                                                                                ', 'Mertz                                                                                               ', 'Kennedy                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 238, 'f', 'Donnell                                                                                             ', 'Homenick                                                                                            ', 'Rowan                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 239, 'f', 'Evan                                                                                                ', 'Hoeger                                                                                              ', 'Leslie                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 240, 'f', 'Carley                                                                                              ', 'Ritchie                                                                                             ', 'Hayden                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 241, 'f', 'Mariah                                                                                              ', 'Boehm                                                                                               ', 'Leslie                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 242, 'f', 'Sylvan                                                                                              ', 'Volkman                                                                                             ', 'Quinn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 243, 'f', 'Wilhelm                                                                                             ', 'Effertz                                                                                             ', 'Rory                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 244, 'f', 'Idell                                                                                               ', 'Gerlach                                                                                             ', 'Robin                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 245, 'f', 'Callie                                                                                              ', 'Stokes                                                                                              ', 'Ryan                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 246, 'f', 'Cristina                                                                                            ', 'Wyman                                                                                               ', 'Riley                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 247, 'f', 'Danny                                                                                               ', 'Graham                                                                                              ', 'Taylor                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 248, 'f', 'Myrna                                                                                               ', 'Cremin                                                                                              ', 'Arden                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 249, 'f', 'Alyce                                                                                               ', 'Price                                                                                               ', 'London                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 250, 'f', 'Helmer                                                                                              ', 'Abshire                                                                                             ', 'Corey                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 251, 'f', 'Liana                                                                                               ', 'Johnston                                                                                            ', 'Gray                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 252, 'f', 'Elaina                                                                                              ', 'Huel                                                                                                ', 'Jordan                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 253, 'f', 'Korey                                                                                               ', 'Wyman                                                                                               ', 'Avery                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 254, 'f', 'Sharon                                                                                              ', 'Raynor                                                                                              ', 'Rowan                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 255, 'f', 'Danika                                                                                              ', 'Rolfson                                                                                             ', 'Kendall                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 256, 'f', 'Ashton                                                                                              ', 'Turner                                                                                              ', 'Quinn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 257, 'f', 'Roxane                                                                                              ', 'Lowe                                                                                                ', 'Reagan                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 258, 'f', 'Mallory                                                                                             ', 'Marquardt                                                                                           ', 'Quinn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 259, 'f', 'Asia                                                                                                ', 'Adams                                                                                               ', 'Charlie                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 260, 'f', 'Fabiola                                                                                             ', 'Brown                                                                                               ', 'Reese                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 261, 'f', 'Russel                                                                                              ', 'Ferry                                                                                               ', 'Bailey                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 262, 'f', 'Francisco                                                                                           ', 'Leuschke                                                                                            ', 'Sasha                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 263, 'f', 'Destany                                                                                             ', 'Cronin                                                                                              ', 'Blake                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 264, 'f', 'Kenton                                                                                              ', 'Kunze                                                                                               ', 'Corey                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 265, 'f', 'Arnold                                                                                              ', 'Weimann                                                                                             ', 'Leslie                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 266, 'f', 'Kaci                                                                                                ', 'Walker                                                                                              ', 'Jaden                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 267, 'f', 'Lyric                                                                                               ', 'Littel                                                                                              ', 'Austin                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 268, 'f', 'Ella                                                                                                ', 'Anderson                                                                                            ', 'London                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 269, 'f', 'Agustin                                                                                             ', 'Monahan                                                                                             ', 'Sawyer                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 270, 'f', 'Freida                                                                                              ', 'Macejkovic                                                                                          ', 'Rowan                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 271, 'f', 'Madisen                                                                                             ', 'Hammes                                                                                              ', 'Bowie                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 272, 'f', 'Chris                                                                                               ', 'Schmeler                                                                                            ', 'Brooklyn                                                                                            ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 273, 'f', 'Alysson                                                                                             ', 'Franecki                                                                                            ', 'Shawn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 274, 'f', 'Gregorio                                                                                            ', 'Jacobi                                                                                              ', 'Billie                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 275, 'f', 'Amir                                                                                                ', 'Satterfield                                                                                         ', 'Corey                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 276, 'f', 'Verla                                                                                               ', 'Lang                                                                                                ', 'Angel                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 277, 'f', 'Rae                                                                                                 ', 'Feeney                                                                                              ', 'Kyle                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 278, 'f', 'Marc                                                                                                ', 'Mitchell                                                                                            ', 'Quinn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 279, 'f', 'Arden                                                                                               ', 'Nicolas                                                                                             ', 'Noah                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 280, 'f', 'Carlie                                                                                              ', 'Streich                                                                                             ', 'Leslie                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 281, 'f', 'Clifford                                                                                            ', 'Gleichner                                                                                           ', 'Marlowe                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 282, 'f', 'Fae                                                                                                 ', 'Ritchie                                                                                             ', 'Brooklyn                                                                                            ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 283, 'f', 'Dorothea                                                                                            ', 'Schultz                                                                                             ', 'Drew                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 284, 'f', 'Brenda                                                                                              ', 'Upton                                                                                               ', 'Shawn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 285, 'f', 'Doyle                                                                                               ', 'McGlynn                                                                                             ', 'London                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 286, 'f', 'Roel                                                                                                ', 'Lang                                                                                                ', 'Bailey                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 287, 'f', 'Harmony                                                                                             ', 'Conn                                                                                                ', 'Kendall                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 288, 'f', 'Brooke                                                                                              ', 'Gottlieb                                                                                            ', 'Taylor                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 289, 'f', 'Noel                                                                                                ', 'Gutmann                                                                                             ', 'London                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 290, 'f', 'Layla                                                                                               ', 'Denesik                                                                                             ', 'London                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 291, 'f', 'Lucile                                                                                              ', 'Donnelly                                                                                            ', 'James                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 292, 'f', 'Era                                                                                                 ', 'Jakubowski                                                                                          ', 'Shawn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 293, 'f', 'Sanford                                                                                             ', 'Daniel                                                                                              ', 'Avery                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 294, 'f', 'Jennyfer                                                                                            ', 'Carroll                                                                                             ', 'August                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 295, 'f', 'Jorge                                                                                               ', 'Hackett                                                                                             ', 'Jordan                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 296, 'f', 'Annalise                                                                                            ', 'Sipes                                                                                               ', 'Arden                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 297, 'f', 'Luella                                                                                              ', 'Casper                                                                                              ', 'Finley                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 298, 'f', 'Milan                                                                                               ', 'Hansen                                                                                              ', 'Austin                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 299, 'f', 'Judson                                                                                              ', 'Franey                                                                                              ', 'Taylor                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 300, 'f', 'Jaylon                                                                                              ', 'Gutmann                                                                                             ', 'Jamie                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 301, 'f', 'Edmond                                                                                              ', 'Huels                                                                                               ', 'Marlowe                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 302, 'f', 'Leola                                                                                               ', 'Hilpert                                                                                             ', 'Reagan                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 303, 'f', 'Celine                                                                                              ', 'Lind                                                                                                ', 'Bowie                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 304, 'f', 'Kenton                                                                                              ', 'Osinski                                                                                             ', 'Nico                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 305, 'f', 'Orville                                                                                             ', 'Heidenreich                                                                                         ', 'Bowie                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 306, 'f', 'Cortez                                                                                              ', 'Macejkovic                                                                                          ', 'August                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 307, 'f', 'Jaeden                                                                                              ', 'Schmitt                                                                                             ', 'Jules                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 308, 'f', 'Harmon                                                                                              ', 'Gusikowski                                                                                          ', 'Jamie                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 309, 'f', 'Israel                                                                                              ', 'Reichert                                                                                            ', 'Quinn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 310, 'f', 'Joshua                                                                                              ', 'Braun                                                                                               ', 'Billie                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 311, 'f', 'Ignatius                                                                                            ', 'Kihn                                                                                                ', 'Dakota                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 312, 'f', 'Cyril                                                                                               ', 'Kutch                                                                                               ', 'Harper                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 313, 'f', 'Carrie                                                                                              ', 'Littel                                                                                              ', 'Reese                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 314, 'f', 'Kaitlyn                                                                                             ', 'Roob                                                                                                ', 'Billie                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 315, 'f', 'Brice                                                                                               ', 'Donnelly                                                                                            ', 'Rory                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 316, 'f', 'Margaretta                                                                                          ', 'Labadie                                                                                             ', 'Kennedy                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 317, 'f', 'Mellie                                                                                              ', 'Hand                                                                                                ', 'Reign                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 318, 'f', 'Darby                                                                                               ', 'Feil                                                                                                ', 'Gray                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 319, 'f', 'Bridie                                                                                              ', 'Rohan                                                                                               ', 'Bowie                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 320, 'f', 'Sylvan                                                                                              ', 'Koelpin                                                                                             ', 'Kyle                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 321, 'f', 'Maybelle                                                                                            ', 'Wisozk                                                                                              ', 'Taylor                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 322, 'f', 'Edgardo                                                                                             ', 'Harvey                                                                                              ', 'Reese                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 323, 'f', 'Pierce                                                                                              ', 'Stracke                                                                                             ', 'Logan                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 324, 'f', 'Germaine                                                                                            ', 'Thiel                                                                                               ', 'Quinn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 325, 'f', 'Pearlie                                                                                             ', 'Bruen                                                                                               ', 'Greer                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 326, 'f', 'Ole                                                                                                 ', 'Howe                                                                                                ', 'August                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 327, 'f', 'Elian                                                                                               ', 'Huels                                                                                               ', 'Logan                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 328, 'f', 'Annamarie                                                                                           ', 'Weber                                                                                               ', 'Charlie                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 329, 'f', 'Lisa                                                                                                ', 'Huel                                                                                                ', 'London                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 330, 'f', 'Gaetano                                                                                             ', 'Moen                                                                                                ', 'Elliott                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 331, 'f', 'Maurine                                                                                             ', 'Koss                                                                                                ', 'Harper                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 332, 'f', 'Deven                                                                                               ', 'Weimann                                                                                             ', 'Kennedy                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 333, 'f', 'Manuela                                                                                             ', 'Schmeler                                                                                            ', 'Harper                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 334, 'f', 'Miracle                                                                                             ', 'O''Keefe                                                                                             ', 'Reagan                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 335, 'f', 'Blaise                                                                                              ', 'Schiller                                                                                            ', 'Kai                                                                                                 ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 336, 'f', 'Casper                                                                                              ', 'Hayes                                                                                               ', 'Reagan                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 337, 'f', 'Santos                                                                                              ', 'Cronin                                                                                              ', 'Marlowe                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 338, 'f', 'Rahul                                                                                               ', 'Marquardt                                                                                           ', 'Arden                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 339, 'f', 'Madelynn                                                                                            ', 'Runolfsdottir                                                                                       ', 'Kai                                                                                                 ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 340, 'f', 'General                                                                                             ', 'Weimann                                                                                             ', 'Corey                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 341, 'f', 'Veronica                                                                                            ', 'Ratke                                                                                               ', 'Rowan                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 342, 'f', 'Gaston                                                                                              ', 'Leffler                                                                                             ', 'Addison                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 343, 'f', 'Margie                                                                                              ', 'Runte                                                                                               ', 'Angel                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 344, 'f', 'Junius                                                                                              ', 'Harris                                                                                              ', 'Kai                                                                                                 ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 345, 'f', 'Bettye                                                                                              ', 'Mertz                                                                                               ', 'Robin                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 346, 'f', 'Freeda                                                                                              ', 'Breitenberg                                                                                         ', 'Cameron                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 347, 'f', 'Precious                                                                                            ', 'Conroy                                                                                              ', 'Ellis                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 348, 'f', 'Adrienne                                                                                            ', 'Johns                                                                                               ', 'Sawyer                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 349, 'f', 'Rossie                                                                                              ', 'Walker                                                                                              ', 'Shawn                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 350, 'f', 'Jacinthe                                                                                            ', 'Lind                                                                                                ', 'Charlie                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 351, 'f', 'Cleveland                                                                                           ', 'Watsica                                                                                             ', 'North                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 352, 'f', 'Pamela                                                                                              ', 'Fay                                                                                                 ', 'Sasha                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 353, 'f', 'Lilyan                                                                                              ', 'Fahey                                                                                               ', 'Charlie                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 354, 'f', 'Giuseppe                                                                                            ', 'Leuschke                                                                                            ', 'Greer                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 355, 'f', 'Deondre                                                                                             ', 'Raynor                                                                                              ', 'Jules                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 356, 'f', 'Rachel                                                                                              ', 'Deckow                                                                                              ', 'James                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 357, 'f', 'Maude                                                                                               ', 'Metz                                                                                                ', 'Cameron                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 358, 'f', 'Dwight                                                                                              ', 'Conroy                                                                                              ', 'Kai                                                                                                 ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 359, 'f', 'Issac                                                                                               ', 'Goyette                                                                                             ', 'Arden                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 360, 'f', 'Naomie                                                                                              ', 'Streich                                                                                             ', 'Dakota                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 361, 'f', 'Damon                                                                                               ', 'Kuhic                                                                                               ', 'Reese                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 362, 'f', 'Celia                                                                                               ', 'Huel                                                                                                ', 'Elliott                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 363, 'f', 'Micheal                                                                                             ', 'Schaefer                                                                                            ', 'Reagan                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 364, 'f', 'Wilber                                                                                              ', 'Aufderhar                                                                                           ', 'Jamie                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 365, 'f', 'Laron                                                                                               ', 'Wiegand                                                                                             ', 'Austin                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 366, 'f', 'Allan                                                                                               ', 'Vandervort                                                                                          ', 'Robin                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 367, 'f', 'Orville                                                                                             ', 'Homenick                                                                                            ', 'Elliott                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 368, 'f', 'Anastacio                                                                                           ', 'Treutel                                                                                             ', 'Angel                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 369, 'f', 'Ludwig                                                                                              ', 'Treutel                                                                                             ', 'Avery                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 370, 'f', 'Brandi                                                                                              ', 'O''Conner                                                                                            ', 'Sawyer                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 371, 'f', 'Kristoffer                                                                                          ', 'Fritsch                                                                                             ', 'Harper                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 372, 'f', 'Sonia                                                                                               ', 'Cormier                                                                                             ', 'Kai                                                                                                 ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 373, 'f', 'Monica                                                                                              ', 'Russel                                                                                              ', 'Reagan                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 374, 'f', 'Ezequiel                                                                                            ', 'Rowe                                                                                                ', 'Avery                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 375, 'f', 'Zelda                                                                                               ', 'Green                                                                                               ', 'Bailey                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 376, 'f', 'Andres                                                                                              ', 'Cassin                                                                                              ', 'Bailey                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 377, 'f', 'Vernice                                                                                             ', 'Bauch                                                                                               ', 'Addison                                                                                             ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 378, 'f', 'Holden                                                                                              ', 'Marks                                                                                               ', 'Blake                                                                                               ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 379, 'f', 'Alaina                                                                                              ', 'Carroll                                                                                             ', 'Sawyer                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 380, 'f', 'Elmer                                                                                               ', 'Ortiz                                                                                               ', 'Sage                                                                                                ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES (NULL, NULL, NULL, NULL, 381, 'f', 'Karine                                                                                              ', 'Oberbrunner                                                                                         ', 'Austin                                                                                              ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."usuario" VALUES ('admin@ciencias.unam.mx', '$2b$12$KhaK0niAc.JHierViRb0Ne6SI1oo91bvcS3SocDbR0h19W37J5JtG', '85b0ad5c74e627f7a402d82e645580f3de6f80dd8be882ec4c18cec6195391bf39817b5290e0c376', 'administrador', 382, 'f', 'admin                                                                                               ', 'istrador                                                                                            ', NULL, 'adminopolis', 'admin', 12, 12, 'admin');
INSERT INTO "public"."usuario" VALUES ('rep@ciencias.unam.mx', '$2b$12$ODstwsQg49U0C.DfbO77ZeOtNxwZ4VygV7MahLbWQdzVHMxtbudzq', 'f8c5cd1c4f610f022150a22b3e019a2f5337c483a393ce9fd65676f7ca45e74df5d12b6ea1167f59', 'repartidor', 384, 'f', 'rep                                                                                                 ', 'artidor                                                                                             ', NULL, 'rep', 'rep', 123, 123, 'rep');
INSERT INTO "public"."usuario" VALUES ('mes@ciencias.unam.mx', '$2b$12$K/1.haVf1T66DEOOkCy7Z.Osm9kTxoyKAVIXvOwFRjDnV.KyucHHO', NULL, 'mesero', 385, 'f', 'mes                                                                                                 ', 'ero                                                                                                 ', NULL, 'mes', 'mes', 123, 123, 'mes');
INSERT INTO "public"."usuario" VALUES ('mes2@ciencias.unam.mx', '$2b$12$0lzIzp8x5xudUIFC2KoQOOncFKCfByplCyG0qUGt3MiDJYcQwhdFO', NULL, 'mesero', 386, 'f', 'mes                                                                                                 ', 'ero2                                                                                                ', NULL, 'mes', 'mes', 123, 123, 'mes');
INSERT INTO "public"."usuario" VALUES ('cliente@ciencias.unam.mx', '$2b$12$tD698fQUqdA2WXUzSqchJ.CWjU6s89XzdViok5c1gmoQQigZb8DRG', '02ebbcaa2deb37c397990935251273401a71e1fe3de21085928a3a8a6cde77daadc47eb3048dc165', 'cliente', 383, 'f', 'cliente                                                                                             ', 'cliente                                                                                             ', NULL, 'cliente', 'cliente', 123, 123, 'cliente');
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."administrador_idadmin_seq"
OWNED BY "public"."administrador"."idadmin";
SELECT setval('"public"."administrador_idadmin_seq"', 33, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cliente_idcliente_seq"
OWNED BY "public"."cliente"."idcliente";
SELECT setval('"public"."cliente_idcliente_seq"', 32, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."contenidoorden_idcontenidoorden_seq"
OWNED BY "public"."contenidoorden"."idcontenidoorden";
SELECT setval('"public"."contenidoorden_idcontenidoorden_seq"', 311, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."entregadomicilio_identregadomicilio_seq"
OWNED BY "public"."entregadomicilio"."identregadomicilio";
SELECT setval('"public"."entregadomicilio_identregadomicilio_seq"', 158, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."menu_idmenu_seq"
OWNED BY "public"."menu"."idmenu";
SELECT setval('"public"."menu_idmenu_seq"', 32, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."mesa_idmesa_seq"
OWNED BY "public"."mesa"."idmesa";
SELECT setval('"public"."mesa_idmesa_seq"', 311, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."mesero_idmesero_seq"
OWNED BY "public"."mesero"."idmesero";
SELECT setval('"public"."mesero_idmesero_seq"', 311, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."orden_idorden_seq"
OWNED BY "public"."orden"."idorden";
SELECT setval('"public"."orden_idorden_seq"', 312, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."platillo_idplatillo_seq"
OWNED BY "public"."platillo"."idplatillo";
SELECT setval('"public"."platillo_idplatillo_seq"', 621, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."repartidor_idrepartidor_seq"
OWNED BY "public"."repartidor"."idrepartidor";
SELECT setval('"public"."repartidor_idrepartidor_seq"', 12, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."resena_idresena_seq"
OWNED BY "public"."resena"."idresena";
SELECT setval('"public"."resena_idresena_seq"', 931, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."restaurante_idrestaurante_seq"
OWNED BY "public"."restaurante"."idrestaurante";
SELECT setval('"public"."restaurante_idrestaurante_seq"', 32, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."usuario_idusuario_seq"
OWNED BY "public"."usuario"."idusuario";
SELECT setval('"public"."usuario_idusuario_seq"', 387, true);

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
-- Indexes structure for table entregadomicilio
-- ----------------------------
CREATE UNIQUE INDEX "entregadomicilio_idorden_key" ON "public"."entregadomicilio" USING btree (
  "idorden" "pg_catalog"."int4_ops" ASC NULLS LAST
);

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
CREATE UNIQUE INDEX "resena_idrestaurante_idcliente_key" ON "public"."resena" USING btree (
  "idrestaurante" "pg_catalog"."int4_ops" ASC NULLS LAST,
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
