CREATE TABLE Cliente (
    idCliente char(18) NOT NULL,
    nombre char(100) NOT NULL,
    aPatermo char(100),
    aMaterno char(100),
    correo varchar(100) NOT NULL,
    contrasena varchar(100) NOT NULL,
    estado varchar(100),
    calle varchar(100),
    numero int,
    cp int,
    municipio VARCHAR(100),
    CONSTRAINT pk_cliente PRIMARY KEY(idCliente),
    CONSTRAINT chk_correo CHECK(correo LIKE '%_@__%.__%')
);

CREATE TABLE Repartidor (
    idRepartidor char(18) NOT NULL,
    nombre char(100) NOT NULL,
    aPatermo char(100),
    aMaterno char(100),
    correo varchar(100) NOT NULL,
    contrasena varchar(100) NOT NULL,
    CONSTRAINT pk_repartidor PRIMARY KEY(idRepartidor),
    CONSTRAINT chk_correo CHECK(correo LIKE '%_@__%.__%')
);

CREATE TABLE Franquicia (
    idFranquicia char(18) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT pk_franquicia PRIMARY KEY(idFranquicia)
);

CREATE TABLE Restaurante (
    idRestaurante CHAR(18) NOT NULL unique,
    idFranquicia CHAR(18) NOT NULL,
    nombre VARCHAR(100),
    estado varchar(100),
    calle varchar(100),
    numero int,
    cp int,
    municipio VARCHAR(100),
	CONSTRAINT fk_restaurante FOREIGN KEY(idFranquicia) REFERENCES Franquicia(idFranquicia),
    CONSTRAINT pk_restaurante PRIMARY KEY(idFranquicia, idRestaurante)
);

CREATE TABLE Menu (
    idMenu CHAR(18) NOT NULL unique,
    idRestaurante CHAR(18) NOT NULL,
    idFranquicia CHAR(18) NOT NULL,
    CONSTRAINT pk_menu PRIMARY KEY(idMenu, idRestaurante, idFranquicia),
    CONSTRAINT fk_menu1 FOREIGN KEY(idRestaurante, idFranquicia) REFERENCES Restaurante(idRestaurante, idFranquicia) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Platillo(
    idPlatillo CHAR(18) NOT NULL UNIQUE,
    idMenu CHAR(18) NOT NULL,
    idRestaurante CHAR(18) NOT NULL,
    idFranquicia CHAR(18) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    costo int NOT NULL,
    CONSTRAINT pk_platillo PRIMARY KEY(idPlatillo, idMenu, idRestaurante, idFranquicia),
    CONSTRAINT fk_paltillo1 FOREIGN KEY(idMenu, idRestaurante, idFranquicia) REFERENCES Menu(idMenu, idRestaurante, idFranquicia) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_costo CHECK(costo >= 0)
);

CREATE TABLE OrdenEnvio (
    idOrdenEnvio CHAR(18) NOT NULL,
    costo INT NOT NULL,
    CONSTRAINT pk_oe PRIMARY KEY(idOrdenEnvio),
    CONSTRAINT chk_costo CHECK(costo >= 0)
);

CREATE TABLE OrdenNormal(
    idOrdenNormal CHAR(18) NOT NULL,
    costo int NOT NULL,
    CONSTRAINT pk_on PRIMARY KEY(idOrdenNormal),
    CONSTRAINT chk_costo CHECK(costo >= 0)
);

CREATE TABLE ContenidoOrden(
    idOrdenNormal CHAR(18),
    idOrdenEnvio CHAR(18),
    idPlatillo CHAR(18),
    CONSTRAINT fk_contenido1 FOREIGN KEY(idOrdenNormal) REFERENCES OrdenNormal(idOrdenNormal) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_contenido2 FOREIGN KEY(idOrdenEnvio) REFERENCES OrdenEnvio(idOrdenEnvio) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_contenido3 FOREIGN KEY(idPlatillo) REFERENCES Platillo(idPlatillo) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_tipo CHECK((idOrdenEnvio IS NULL AND idOrdenNormal IS NOT NULL) OR (idOrdenEnvio IS NOT NULL AND idOrdenNormal IS NULL))
);

CREATE TABLE EntregaDomicilio (
    idRepartidor CHAR(18) NOT NULL,
    idOrdenEnvio CHAR(18) NOT NULL,
    estado CHAR(18) NOT NULL,
    CONSTRAINT fk_or1 FOREIGN KEY(idRepartidor) REFERENCES Repartidor(idRepartidor) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_or2 FOREIGN KEY(idOrdenEnvio) REFERENCES OrdenEnvio(idOrdenEnvio) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE OrdenesCliente(
    idCliente CHAR(18) NOT NULL,
    idOrdenEnvio CHAR(18),
    idOrdenNormal CHAR(18),
    metodoPago CHAR(18),
    CONSTRAINT fk_oc1 FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_oc2 FOREIGN KEY(idOrdenEnvio) REFERENCES OrdenEnvio(idOrdenEnvio) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_oc3 FOREIGN KEY(idOrdenNormal) REFERENCES OrdenNormal(idOrdenNormal) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_tipo CHECK((idOrdenEnvio IS NULL AND idOrdenNormal IS NOT NULL) OR (idOrdenEnvio IS NOT NULL AND idOrdenNormal IS NULL))
);

CREATE TABLE Administrador (
    idAdmin CHAR(18) NOT NULL,
	idRestaurante CHAR(18) NOT NULL,
    nombre char(100) NOT NULL,
    aPatermo char(100),
    aMaterno char(100),
    correo varchar(100) NOT NULL,
    contrasena varchar(100) NOT NULL,
    CONSTRAINT pk_admin PRIMARY KEY(idAdmin),
	CONSTRAINT fk_admin FOREIGN KEY(idRestaurante) REFERENCES Restaurante(idRestaurante) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Mesero (
    idMesero char(18) NOT NULL,
    idAdmin CHAR(18) NOT NULL,
    idRestaurante CHAR(18) NOT NULL,
    nombre char(100) NOT NULL,
    aPatermo char(100),
    aMaterno char(100),
    correo varchar(100) NOT NULL,
    contrasena varchar(100) NOT NULL,
    CONSTRAINT pk_mesero PRIMARY KEY(idMesero),
    CONSTRAINT fk_mesero1 FOREIGN KEY(idAdmin) REFERENCES Administrador(idAdmin) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_mesero2 FOREIGN KEY(idRestaurante) REFERENCES Restaurante(idRestaurante) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_correo CHECK(correo LIKE '%_@__%.__%')
);

CREATE TABLE Cocinero (
    idCocinero char(18) NOT NULL,
    idAdmin CHAR(18) NOT NULL,
    idRestaurante CHAR(18) NOT NULL,
    nombre char(100) NOT NULL,
    aPatermo char(100),
    aMaterno char(100),
    correo varchar(100) NOT NULL,
    contrasena varchar(100) NOT NULL,
    CONSTRAINT pk_cocinero PRIMARY KEY(idCocinero),
    CONSTRAINT fk_cocinero1 FOREIGN KEY(idAdmin) REFERENCES Administrador(idAdmin) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_cocinero2 FOREIGN KEY(idRestaurante) REFERENCES Restaurante(idRestaurante) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_correo CHECK(correo LIKE '%_@__%.__%')
);

CREATE TABLE RegistroRestaurante(
    idAdmin CHAR(18) NOT NULL,
    idRestaurante CHAR(18) NOT NULL,
    fecha DATE NOT NULL,
    CONSTRAINT fk_reg1 FOREIGN KEY(idAdmin) REFERENCES Administrador(idAdmin) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_reg2 FOREIGN KEY(idRestaurante) REFERENCES Restaurante(idRestaurante) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE EntregaMesa (
    idMesero CHAR(18) NOT NULL,
    idOrdenNormal CHAR(18) NOT NULL,
    estado CHAR(18) NOT NULL,
    CONSTRAINT fk_em1 FOREIGN KEY(idMesero) REFERENCES Mesero(idMesero) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_em2 FOREIGN KEY(idOrdenNormal) REFERENCES OrdenNormal(idOrdenNormal) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PrepararOrden (
    idCocinero CHAR(18) NOT NULL,
    idOrdenEnvio CHAR(18),
    idOrdenNormal CHAR(18),
    CONSTRAINT fk_po1 FOREIGN KEY(idCocinero) REFERENCES Cocinero(idCocinero) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_po2 FOREIGN KEY(idOrdenEnvio) REFERENCES OrdenEnvio(idOrdenEnvio) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_po3 FOREIGN KEY(idOrdenNormal) REFERENCES OrdenNormal(idOrdenNormal) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_tipo CHECK((idOrdenEnvio IS NULL AND idOrdenNormal IS NOT NULL) OR (idOrdenEnvio IS NOT NULL AND idOrdenNormal IS NULL))
);
