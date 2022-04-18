CREATE TABLE Cliente (
    idCliente SERIAL  NOT NULL,
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
    idRepartidor SERIAL,
    nombre char(100) NOT NULL,
    aPatermo char(100),
    aMaterno char(100),
    correo varchar(100) NOT NULL,
    contrasena varchar(100) NOT NULL,
    CONSTRAINT pk_repartidor PRIMARY KEY(idRepartidor),
    CONSTRAINT chk_correo CHECK(correo LIKE '%_@__%.__%')
);

CREATE TABLE Franquicia (
    idFranquicia SERIAL,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT pk_franquicia PRIMARY KEY(idFranquicia)
);

CREATE TABLE Restaurante (
    idRestaurante SERIAL,
    idFranquicia INT,
    nombre VARCHAR(100),
    estado varchar(100),
    calle varchar(100),
    numero int,
    cp int,
    municipio VARCHAR(100),
	CONSTRAINT fk_restaurante FOREIGN KEY(idFranquicia) REFERENCES Franquicia(idFranquicia),
    CONSTRAINT pk_restaurant PRIMARY KEY(idFranquicia, idRestaurante)
);

CREATE TABLE Menu (
    idMenu SERIAL,
    idRestaurante INT NOT NULL,
    idFranquicia INT NOT NULL,
    CONSTRAINT pk_menu PRIMARY KEY(idMenu, idRestaurante, idFranquicia),
    CONSTRAINT fk_menu1 FOREIGN KEY(idRestaurante, idFranquicia) REFERENCES Restaurante(idRestaurante, idFranquicia) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Platillo(
    idPlatillo SERIAL,
    idMenu INT NOT NULL,
    idRestaurante INT NOT NULL,
    idFranquicia INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    costo int NOT NULL,
    CONSTRAINT pk_platillo PRIMARY KEY(idPlatillo, idMenu, idRestaurante, idFranquicia),
    CONSTRAINT fk_paltillo1 FOREIGN KEY(idMenu, idRestaurante, idFranquicia) REFERENCES Menu(idMenu, idRestaurante, idFranquicia) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_costo CHECK(costo >= 0)
);

CREATE TABLE OrdenEnvio (
    idOrdenEnvio INT NOT NULL,
    costo INT NOT NULL,
    CONSTRAINT pk_oe PRIMARY KEY(idOrdenEnvio),
    CONSTRAINT chk_costo CHECK(costo >= 0)
);

CREATE TABLE OrdenNormal(
    idOrdenNormal INT NOT NULL,
    costo int NOT NULL,
    CONSTRAINT pk_on PRIMARY KEY(idOrdenNormal),
    CONSTRAINT chk_costo CHECK(costo >= 0)
);

CREATE TABLE ContenidoOrden(
    idOrdenNormal INT,
    idOrdenEnvio INT,
    idPlatillo INT,
    CONSTRAINT fk_contenido1 FOREIGN KEY(idOrdenNormal) REFERENCES OrdenNormal(idOrdenNormal) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_contenido2 FOREIGN KEY(idOrdenEnvio) REFERENCES OrdenEnvio(idOrdenEnvio) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_contenido3 FOREIGN KEY(idPlatillo) REFERENCES Platillo(idPlatillo) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_tipo CHECK((idOrdenEnvio IS NULL AND idOrdenNormal IS NOT NULL) OR (idOrdenEnvio IS NOT NULL AND idOrdenNormal IS NULL))
);

CREATE TABLE EntregaDomicilio (
    idRepartidor INT NOT NULL,
    idOrdenEnvio INT NOT NULL,
    estado CHAR(18) NOT NULL,
    CONSTRAINT fk_or1 FOREIGN KEY(idRepartidor) REFERENCES Repartidor(idRepartidor) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_or2 FOREIGN KEY(idOrdenEnvio) REFERENCES OrdenEnvio(idOrdenEnvio) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE OrdenesCliente(
    idCliente INT NOT NULL,
    idOrdenEnvio INT,
    idOrdenNormal INT,
    metodoPago CHAR(18),
    CONSTRAINT fk_oc1 FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_oc2 FOREIGN KEY(idOrdenEnvio) REFERENCES OrdenEnvio(idOrdenEnvio) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_oc3 FOREIGN KEY(idOrdenNormal) REFERENCES OrdenNormal(idOrdenNormal) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_tipo CHECK((idOrdenEnvio IS NULL AND idOrdenNormal IS NOT NULL) OR (idOrdenEnvio IS NOT NULL AND idOrdenNormal IS NULL))
);

CREATE TABLE Administrador (
    idAdmin SERIAL,
	  idRestaurante INT NOT NULL,
    nombre char(100) NOT NULL,
    aPatermo char(100),
    aMaterno char(100),
    correo varchar(100) NOT NULL,
    contrasena varchar(100) NOT NULL,
    CONSTRAINT pk_admin PRIMARY KEY(idAdmin),
	CONSTRAINT fk_admin FOREIGN KEY(idRestaurante) REFERENCES Restaurante(idRestaurante) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Mesero (
    idMesero SERIAL,
    idAdmin INT NOT NULL,
    idRestaurante INT NOT NULL,
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
    idCocinero SERIAL NOT NULL,
    idAdmin INT NOT NULL,
    idRestaurante INT NOT NULL,
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
    idAdmin INT NOT NULL,
    idRestaurante INT NOT NULL,
    fecha DATE NOT NULL,
    CONSTRAINT fk_reg1 FOREIGN KEY(idAdmin) REFERENCES Administrador(idAdmin) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_reg2 FOREIGN KEY(idRestaurante) REFERENCES Restaurante(idRestaurante) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE EntregaMesa (
    idMesero SERIAL,
    idOrdenNormal int NOT NULL,
    estado CHAR(18) NOT NULL,
    CONSTRAINT fk_em1 FOREIGN KEY(idMesero) REFERENCES Mesero(idMesero) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_em2 FOREIGN KEY(idOrdenNormal) REFERENCES OrdenNormal(idOrdenNormal) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PrepararOrden (
    idCocinero INT NOT NULL,
    idOrdenEnvio INT,
    idOrdenNormal INT,
    CONSTRAINT fk_po1 FOREIGN KEY(idCocinero) REFERENCES Cocinero(idCocinero) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_po2 FOREIGN KEY(idOrdenEnvio) REFERENCES OrdenEnvio(idOrdenEnvio) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_po3 FOREIGN KEY(idOrdenNormal) REFERENCES OrdenNormal(idOrdenNormal) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_tipo CHECK((idOrdenEnvio IS NULL AND idOrdenNormal IS NOT NULL) OR (idOrdenEnvio IS NOT NULL AND idOrdenNormal IS NULL))
);
