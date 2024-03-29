------------------- CREACION DE TABLAS
alter session set nls_date_format = 'dd/MON/yyyy hh24:mi:ss'

CREATE TABLE usuario(
    id_usuario NUMBER GENERATED BY DEFAULT AS IDENTITY,
    nombre_usuario VARCHAR2(100),
    usuario_usuario VARCHAR2(100) UNIQUE,
    foto_usuario_url VARCHAR2(200),
    contrasena_usuario VARCHAR2(100),
    descripcion_usuario VARCHAR2(100) default 'descripcion usuario',
    PRIMARY KEY(id_usuario)
);

CREATE TABLE estado_bot(
    id_estado_bot NUMBER GENERATED BY DEFAULT AS IDENTITY,
    estado_bot VARCHAR2(100),
    descripcion_bot VARCHAR2(100) default 'Descripcion bot',
    PRIMARY KEY(id_estado_bot)
);

CREATE TABLE tipo_mensaje(
    id_tipo_mensaje NUMBER GENERATED BY DEFAULT AS IDENTITY,
    tipo_mensaje VARCHAR2(100),
    descripcion_tipo_mensaje VARCHAR2(100) default 'Descripcion tipo mensaje',
    PRIMARY KEY(id_tipo_mensaje)
);

CREATE TABLE chat(
    id_chat NUMBER GENERATED BY DEFAULT AS IDENTITY,
    descripcion_chat VARCHAR2(100) default 'Descripcion chat',
    fecha_chat DATE,
    fk_id_estado_bot NUMBER,
    FOREIGN KEY (fk_id_estado_bot) REFERENCES estado_bot (id_estado_bot),
    PRIMARY KEY(id_chat)  
);

CREATE TABLE usuario_chat(
    fk_id_usuario NUMBER,
    fk_id_chat NUMBER,
    descripcion_usu_chat VARCHAR2(100) default 'Descripcion usu_chat', 
    FOREIGN KEY (fk_id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (fk_id_chat) REFERENCES chat(id_chat),
    PRIMARY KEY(fk_id_usuario,fk_id_chat)  
);

CREATE TABLE mensaje(
    id_mensaje NUMBER GENERATED BY DEFAULT AS IDENTITY,
    mensaje VARCHAR2(200),
    url_mensaje VARCHAR2(200),
    descripcion_mensaje VARCHAR2(100) default 'Descripcion mensaje',
    fecha_mensaje DATE,
    fk_id_usuario NUMBER,
    fk_id_chat NUMBER,
    fk_id_tipo_mensaje NUMBER,
    FOREIGN KEY (fk_id_usuario) REFERENCES usuario (id_usuario),
    FOREIGN KEY (fk_id_chat) REFERENCES chat (id_chat),
    FOREIGN KEY (fk_id_tipo_mensaje) REFERENCES tipo_mensaje (id_tipo_mensaje),
    PRIMARY KEY(id_mensaje)  
);

CREATE TABLE amigo(
    id_amigo NUMBER GENERATED BY DEFAULT AS IDENTITY,
    descripcion_amigo VARCHAR2(100) default 'Descripcion amigo',
    fk_id_usuario NUMBER,
    fk_id_usuario2 NUMBER,
    fecha_amigo DATE,
    FOREIGN KEY (fk_id_usuario) REFERENCES usuario (id_usuario),
    FOREIGN KEY (fk_id_usuario2) REFERENCES usuario (id_usuario),
    PRIMARY KEY(id_amigo)  
);

CREATE TABLE solicitud(
    id_solicitud NUMBER GENERATED BY DEFAULT AS IDENTITY,
    descripcion_solicitud VARCHAR2(100) default 'Descripcion solicitud',
    fk_id_usuario NUMBER,
    fk_id_usuario2 NUMBER,
    fecha_solicitud DATE,
    FOREIGN KEY (fk_id_usuario) REFERENCES usuario (id_usuario),
    FOREIGN KEY (fk_id_usuario2) REFERENCES usuario (id_usuario),
    PRIMARY KEY(id_solicitud)
);

CREATE TABLE publicacion(
    id_publicacion NUMBER GENERATED BY DEFAULT AS IDENTITY,
    imagen_publicacion_url VARCHAR2(200),
    texto_publicacion VARCHAR2(200),
    nombre_publicacion VARCHAR2(100) default 'Nombre publicidad',
    descripcion_publicacion VARCHAR2(100) default 'Descripcion publicidad',
    fk_id_usuario NUMBER,
    fecha_publicacion DATE,
    FOREIGN KEY (fk_id_usuario) REFERENCES usuario (id_usuario),
    PRIMARY KEY(id_publicacion)  
);

CREATE TABLE tag_publicacion(
    id_tag_publicacion NUMBER GENERATED BY DEFAULT AS IDENTITY,
    nombre_tag VARCHAR2(100) UNIQUE,
    descripcion_tag VARCHAR2(100) default 'Descripcion tag',
    PRIMARY KEY(id_tag_publicacion)  
);

CREATE TABLE tag_detalle(
    fk_id_tag_publicacion NUMBER,
    fk_id_publicacion NUMBER,
    descripcion_tag_detalle VARCHAR2(100) default 'Descripcion tag detalle', 
    FOREIGN KEY (fk_id_tag_publicacion) REFERENCES tag_publicacion(id_tag_publicacion),
    FOREIGN KEY (fk_id_publicacion) REFERENCES publicacion(id_publicacion),
    PRIMARY KEY(fk_id_tag_publicacion,fk_id_publicacion)  
);