/*
        ORDEN EN EL QUE DEBO DE CREAR LAS TABLAS
usuario
estado bot 
tipo mensaje 
fecha
chat
usuario_chat
mensaje
amigo
solicitud
publicacion
tag
*/
------------------- CREACION DE TABLAS
CREATE TABLE usuario(
    id_usuario NUMBER GENERATED BY DEFAULT AS IDENTITY,
    nombre_usuario VARCHAR2(100),
    usuario_usuario VARCHAR2(100),
    contrasena_usuario VARCHAR2(100),
    foto_usuario_url VARCHAR2(200),
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

CREATE TABLE fecha(
    id_fecha NUMBER GENERATED BY DEFAULT AS IDENTITY,
    fecha date,
    descripcion_fecha VARCHAR2(100) default 'Descripcion fecha',
    PRIMARY KEY(id_fecha)
);
alter session set nls_date_format = 'dd/MON/yyyy hh24:mi:ss'

CREATE TABLE chat(
    id_chat NUMBER GENERATED BY DEFAULT AS IDENTITY,
    descripcion_chat VARCHAR2(100) default 'Descripcion chat',
    fk_id_fecha NUMBER,
    fk_id_estado_bot NUMBER,
    FOREIGN KEY (fk_id_fecha) REFERENCES fecha (id_fecha),
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
    fk_id_fecha NUMBER,
    fk_id_usuario NUMBER,
    fk_id_chat NUMBER,
    fk_id_tipo_mensaje NUMBER,
    FOREIGN KEY (fk_id_fecha) REFERENCES fecha (id_fecha),
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
    fk_id_fecha NUMBER,
    FOREIGN KEY (fk_id_usuario) REFERENCES usuario (id_usuario),
    FOREIGN KEY (fk_id_usuario2) REFERENCES usuario (id_usuario),
    FOREIGN KEY (fk_id_fecha) REFERENCES fecha (id_fecha),
    PRIMARY KEY(id_amigo)  
);

CREATE TABLE solicitud(
    id_solicitud NUMBER GENERATED BY DEFAULT AS IDENTITY,
    descripcion_solicitud VARCHAR2(100) default 'Descripcion solicitud',
    fk_id_usuario NUMBER,
    fk_id_usuario2 NUMBER,
    fk_id_fecha NUMBER,
    FOREIGN KEY (fk_id_usuario) REFERENCES usuario (id_usuario),
    FOREIGN KEY (fk_id_usuario2) REFERENCES usuario (id_usuario),
    FOREIGN KEY (fk_id_fecha) REFERENCES fecha (id_fecha),
    PRIMARY KEY(id_solicitud)
);

CREATE TABLE publicacion(
    id_publicacion NUMBER GENERATED BY DEFAULT AS IDENTITY,
    imagen_publicacion_url VARCHAR2(200),
    texto_publicacion VARCHAR2(200),
    nombre_publicacion VARCHAR2(100),
    descripcion_publicacion VARCHAR2(100) default 'Descripcion publicidad',
    fk_id_usuario NUMBER,
    fk_id_fecha NUMBER,
    FOREIGN KEY (fk_id_usuario) REFERENCES usuario (id_usuario),
    FOREIGN KEY (fk_id_fecha) REFERENCES fecha (id_fecha),
    PRIMARY KEY(id_publicacion)  
);

CREATE TABLE tag_publicacion(
    id_tag_publicacion NUMBER GENERATED BY DEFAULT AS IDENTITY,
    nombre_tag VARCHAR2(100),
    descripcion_tag VARCHAR2(100) default 'Descripcion tag',
    fk_id_publicacion NUMBER,
    FOREIGN KEY (fk_id_publicacion) REFERENCES publicacion (id_publicacion),
    PRIMARY KEY(id_tag_publicacion)  
);


-------------- SELECTS DE TODAS LAS TABLAS
SELECT * FROM usuario;
SELECT * FROM estado_bot;
SELECT * FROM tipo_mensaje;
SELECT * FROM fecha;
SELECT * FROM chat;
SELECT * FROM usuario_chat;
SELECT * FROM mensaje;
SELECT * FROM amigo;
SELECT * FROM solicitud;
SELECT * FROM publicacion;
SELECT * FROM tag_publicacion;


---------------- INSERTS A LAS TABLAS

insert into fecha (fecha) values (SYSDATE + 1 );
drop table fecha;

------------------- DROP TABLES
DROP TABLE FECHA;
DROP TABLE usuario;
DROP TABLE estado_bot;
DROP TABLE tipo_mensaje;
DROP TABLE fecha;
DROP TABLE chat;
DROP TABLE usuario_chat;
DROP TABLE mensaje;
DROP TABLE amigo;
DROP TABLE solicitud;
DROP TABLE publicacion;
DROP TABLE tag_publicacion;
------------------- CONSULTAS

select fecha
from fecha
order by fecha desc