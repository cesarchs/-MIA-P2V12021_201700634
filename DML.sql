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


~~~
EN ESTE PROCEDURE, ENCOTRAMOS LA FUNICONALIDAD DE QUE NOS COMPARA ENTRE TODOS LOS USUARIOS LAS CREDENCIALES INGRESADAS POR LA PERONA QUE EMPLEA EL PROGRAMA, PARA VERIFICAR LA VERACIDAD DE SU CUENTA.
~~~
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


CREATE OR REPLACE PROCEDURE "LOGINN" (NUSUARIO IN VARCHAR2, CUSUARIO IN VARCHAR2) IS
BEGIN
    SELECT u.usuario_usuario
    from usuario u
    where usuario_usuario = NUSUARIO
        and contrasena_usuario = CUSUARIO;
END "LOGINN";  

DROP PROCEDURE LOGINN


EXECUTE LOGINN ('CESAR','CESAR');

create table prueba100 (
usuario_p varchar2(100),
contrasena_p varchar2(100)
);

select * from prueba100

~~~
EN ESTE PROCEDURE, ENCOTRAMOS LA FUNICONALIDAD DE QUE EL PROCEDIMIENTO NOS VA A INGRESAR UN USUARIO LA  BASE DE DATOS. EN DONDE SOLAMENTE DEBEMOS DE MANDAR LOS DATOS LLAMANDO AL PROCEDURE DESDE LA DEL SERVIDOR SIN NECESIDAD DE MOSTRAR LO QUE SE PODRIA APRECIAR DE LA ARQUITECTURA DE NUESTRA BASE DE DATOS.


~~~
-- -    registrar usuario

CREATE OR REPLACE PROCEDURE "REGISTROUSUARIO" (nombre_usuario IN VARCHAR2, usuario_usuario IN VARCHAR2, foto_usuario_url IN VARCHAR2, contrasena_usuario IN VARCHAR2) IS
BEGIN
    INSERT INTO usuario(nombre_usuario,usuario_usuario,foto_usuario_url,contrasena_usuario) VALUES (nombre_usuario,usuario_usuario,foto_usuario_url,contrasena_usuario);
END "REGISTROUSUARIO";



drop procedure "REGISTROUSUARIO"
EXECUTE "REGISTROUSUARIO" ('ARMANDO E','armando3','url foto','contrasena hash');

delete from usuario
 where id_usuario=77;
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