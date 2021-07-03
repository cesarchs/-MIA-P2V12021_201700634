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


-------------- SELECTS DE TODAS LAS TABLAS
SELECT * FROM usuario;
SELECT * FROM estado_bot;
SELECT * FROM tipo_mensaje;
SELECT * FROM chat;
SELECT * FROM usuario_chat;
SELECT * FROM mensaje;
SELECT * FROM amigo;
SELECT * FROM solicitud;
SELECT * FROM publicacion;
SELECT * FROM tag_publicacion;
SELECT * FROM tag_detalle;


---------------- INSERTS A LAS TABLAS
    
INSERT INTO usuario(nombre_usuario,usuario_usuario,foto_usuario_url,contrasena_usuario) VALUES ('cesar chamale','cesarchs','url foto','hash contrasena');
INSERT INTO usuario(nombre_usuario,usuario_usuario,foto_usuario_url,contrasena_usuario) VALUES ('leonel sican','leonelchs','url foto','hash contrasena');
INSERT INTO usuario(nombre_usuario,usuario_usuario,foto_usuario_url,contrasena_usuario) VALUES ('gabriela mu','luisaga','url foto','hash contrasena');
INSERT INTO usuario(nombre_usuario,usuario_usuario,foto_usuario_url,contrasena_usuario) VALUES ('carmen','carmencita','url foto','hash contrasena');

INSERT INTO estado_bot(estado_bot, descripcion_bot) VALUES ('endendido','el bot esta ENCENDIDO en esta cuenta');
INSERT INTO estado_bot(estado_bot, descripcion_bot) VALUES ('apagado','el bot esta APAGADO en esta cuenta');

INSERT INTO tipo_mensaje(tipo_mensaje, descripcion_tipo_mensaje) VALUES('texto','es un mensaje normal de texto');
INSERT INTO tipo_mensaje(tipo_mensaje, descripcion_tipo_mensaje) VALUES('imagen','es un mensaje de tipo imagen');

INSERT INTO chat(fecha_chat,fk_id_estado_bot) VALUES(sysdate,1);
INSERT INTO chat(fecha_chat,fk_id_estado_bot) VALUES(sysdate,1);
INSERT INTO chat(fecha_chat,fk_id_estado_bot) VALUES(sysdate,1);

INSERT INTO usuario_chat(fk_id_usuario,fk_id_chat) VALUES (1,1);
INSERT INTO usuario_chat(fk_id_usuario,fk_id_chat,descripcion_usu_chat) VALUES (2,1,'en usuario 2 esta en el chat 1');
INSERT INTO usuario_chat(fk_id_usuario,fk_id_chat,descripcion_usu_chat) VALUES (3,2,'en usuario 3 esta en el chat 2');
INSERT INTO usuario_chat(fk_id_usuario,fk_id_chat,descripcion_usu_chat) VALUES (4,2,'en usuario 3 esta en el chat 2');


INSERT INTO mensaje(mensaje,url_mensaje,fecha_mensaje,fk_id_usuario,fk_id_chat,fk_id_tipo_mensaje) VALUES('que onda amigo','no hay url',sysdate,1,1,1);
INSERT INTO mensaje(mensaje,url_mensaje,fecha_mensaje,fk_id_usuario,fk_id_chat,fk_id_tipo_mensaje) VALUES('que onda perooo','no hay url',sysdate,2,1,1);
INSERT INTO mensaje(mensaje,url_mensaje,fecha_mensaje,fk_id_usuario,fk_id_chat,fk_id_tipo_mensaje) VALUES('*perroooo','no hay url',sysdate,2,1,1);
INSERT INTO mensaje(mensaje,url_mensaje,fecha_mensaje,fk_id_usuario,fk_id_chat,fk_id_tipo_mensaje) VALUES('hola, como estas?','',sysdate,3,2,1);
INSERT INTO mensaje(mensaje,url_mensaje,fecha_mensaje,fk_id_usuario,fk_id_chat,fk_id_tipo_mensaje) VALUES('holaa, bien gracias','',sysdate,4,2,1);

INSERT INTO amigo(fk_id_usuario, fk_id_usuario2, fecha_amigo) VALUES(1,2,sysdate);
INSERT INTO amigo(fk_id_usuario, fk_id_usuario2, fecha_amigo) VALUES(3,4,sysdate);
INSERT INTO amigo(fk_id_usuario, fk_id_usuario2, fecha_amigo) VALUES(21,4,sysdate);
INSERT INTO amigo(fk_id_usuario, fk_id_usuario2, fecha_amigo) VALUES(21,1,sysdate);
SELECT * FROM USUARIO

INSERT INTO solicitud(fk_id_usuario, fk_id_usuario2, fecha_solicitud) VALUES (2,3,sysdate);

INSERT INTO publicacion(imagen_publicacion_url, texto_publicacion,nombre_publicacion, fk_id_usuario, fecha_publicacion) VALUES ('aca va la url','esta es la primera publicacion xd','nombre publicacion xd',1,sysdate);
INSERT INTO publicacion(imagen_publicacion_url, texto_publicacion, fk_id_usuario, fecha_publicacion) VALUES ('aca va la url','esta es la segunda publicacion xd',2,sysdate);
INSERT INTO publicacion(imagen_publicacion_url, texto_publicacion, fk_id_usuario, fecha_publicacion) VALUES ('aca va la url','esta es la segunda publicacion del usu 1 xd',1,sysdate);
INSERT INTO publicacion(imagen_publicacion_url, texto_publicacion, fk_id_usuario, fecha_publicacion) VALUES ('aca va la url','esta es la segunda publicacion del usu 2 xd',2,sysdate);
INSERT INTO publicacion(imagen_publicacion_url, texto_publicacion, fk_id_usuario, fecha_publicacion) VALUES ('aca va la url',' publicacion xd',3,sysdate);
INSERT INTO publicacion(imagen_publicacion_url, texto_publicacion, fk_id_usuario, fecha_publicacion) VALUES ('aca va la url',' publicacion xd',4,sysdate);
INSERT INTO publicacion(imagen_publicacion_url, texto_publicacion, fk_id_usuario, fecha_publicacion) VALUES ('aca va la url',' publicacion 2 xd',3,sysdate);
INSERT INTO publicacion(imagen_publicacion_url, texto_publicacion, fk_id_usuario, fecha_publicacion) VALUES ('aca va la url',' publicacion 3 xd',3,sysdate);

INSERT INTO tag_publicacion(nombre_tag) VALUES ('hoysisale');
INSERT INTO tag_publicacion(nombre_tag) VALUES ('deuna');
INSERT INTO tag_publicacion(nombre_tag) VALUES ('contokio');
INSERT INTO tag_publicacion(nombre_tag) VALUES ('salearchivos');
INSERT INTO tag_publicacion(nombre_tag) VALUES ('nomorirignorado');
INSERT INTO tag_publicacion(nombre_tag) VALUES ('voycontodo');
INSERT INTO tag_publicacion(nombre_tag) VALUES ('saleensemestre');

INSERT INTO tag_detalle (fk_id_tag_publicacion, fk_id_publicacion) VALUES (1,1);
INSERT INTO tag_detalle (fk_id_tag_publicacion, fk_id_publicacion) VALUES (1,2);
INSERT INTO tag_detalle (fk_id_tag_publicacion, fk_id_publicacion) VALUES (2,1);
INSERT INTO tag_detalle (fk_id_tag_publicacion, fk_id_publicacion) VALUES (2,2);
INSERT INTO tag_detalle (fk_id_tag_publicacion, fk_id_publicacion) VALUES (3,1);
INSERT INTO tag_detalle (fk_id_tag_publicacion, fk_id_publicacion) VALUES (3,2);
INSERT INTO tag_detalle (fk_id_tag_publicacion, fk_id_publicacion) VALUES (4,4);
INSERT INTO tag_detalle (fk_id_tag_publicacion, fk_id_publicacion) VALUES (3,3);

------------------- DROP TABLES
DROP TABLE usuario;
DROP TABLE estado_bot;
DROP TABLE tipo_mensaje;
DROP TABLE chat;
DROP TABLE usuario_chat;
DROP TABLE mensaje;
DROP TABLE amigo;
DROP TABLE solicitud;
DROP TABLE publicacion;
DROP TABLE tag_publicacion;
DROP TABLE tag_detalle;
------------------- CONSULTAS

--para log in (user, contrasena) experimentar para ver como validar que este correcto ambos casos

SELECT u.id_usuario, u.usuario_usuario
from usuario u
where usuario_usuario = 'luisaga'
    and contrasena_usuario = 'hash contrasena'
    
    
CREATE OR REPLACE FUNCTION "LOGIN" (NUSUARIO IN VARCHAR2, CUSUARIO IN VARCHAR2)
RETURN VARCHAR2 IS
BEGIN
DECLARE RESPUESTA VARCHAR2(10);
BEGIN
    SELECT u.usuario_usuario
    INTO RESPUESTA
    from usuario u
    where usuario_usuario = NUSUARIO
        and contrasena_usuario = CUSUARIO;
    RETURN RESPUESTA;
END;
END "LOGIN";  

select * from usuario

SELECT LOGIN ('carmencita','hash contrasena') AS USUARIO FROM DUAL;





create table prueba100 (
usuario_p varchar2(100),
contrasena_p varchar2(100)
);

select * from prueba100



-- -    registrar usuario

CREATE OR REPLACE PROCEDURE "REGISTROUSUARIO" (nombre_usuario IN VARCHAR2, usuario_usuario IN VARCHAR2, foto_usuario_url IN VARCHAR2, contrasena_usuario IN VARCHAR2) IS
BEGIN
    INSERT INTO usuario(nombre_usuario,usuario_usuario,foto_usuario_url,contrasena_usuario) VALUES (nombre_usuario,usuario_usuario,foto_usuario_url,contrasena_usuario);
END "REGISTROUSUARIO";



drop procedure "REGISTROUSUARIO"
EXECUTE "REGISTROUSUARIO" ('ARMANDO E','armando','url foto','contrasena hash');
select * from usuario


--listar tus amigos
    
select * from amigo


SELECT id_usuario, usuario_usuario
FROM usuario
where id_usuario in
                (SELECT fk_id_usuario
                 FROM amigo
                 where fk_id_usuario2 = 1    
                 UNION
                 SELECT fk_id_usuario2
                 FROM amigo
                 where fk_id_usuario = 1);


-- listado de NO AMIGOS 
select * from amigo;
select * from usuario

SELECT id_usuario, usuario_usuario
FROM usuario
where id_usuario NOT IN
                (SELECT fk_id_usuario
                 FROM amigo
                 where fk_id_usuario2 = 3    
                 UNION
                 SELECT fk_id_usuario2
                 FROM amigo
                 where fk_id_usuario = 3)
                 AND id_usuario <> 3;


-- pasa saber cual es mi id_user

SELECT id_usuario 
from usuario 
where usuario_usuario = 'carmencita'