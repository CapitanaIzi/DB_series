CREATE DATABASE segundo_db;

USE segundo_db;

CREATE TABLE donghuas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR (70),
    estado TINYINT (1),
    episodios INT NOT NULL
);
INSERT INTO donghuas (titulo,estado,episodios) VALUES ( "Combat Continent",0,263);
INSERT INTO donghuas (titulo,estado,episodios) VALUES ( "Martial Master",1,450);
INSERT INTO donghuas (titulo,estado,episodios) VALUES ( "Throne Of Seal",1,113);
INSERT INTO donghuas (titulo,estado,episodios) VALUES ( "No Doubt In Us",0,12);
INSERT INTO donghuas (titulo,estado,episodios) VALUES ( "Please Spare, My Life",0,12);


SHOW DATABASES;
SHOW TABLES;
SELECT * FROM donghuas;

CREATE TABLE datos_adicionales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    donghua_id INT,
    vistas FLOAT NOT NULL,
    temporales_totales INT NOT NULL,
    adaptacion VARCHAR(20),
    subtitulos TINYINT(1) DEFAULT 0,
    FOREIGN KEY (donghua_id) REFERENCES donghuas(id) 
);


INSERT INTO datos_adicionales (donghua_id,vistas,temporales_totales,adaptacion,subtitulos)VALUES(1,18656570,2,"Novela",1);
INSERT INTO datos_adicionales (donghua_id,vistas,temporales_totales,adaptacion,subtitulos)VALUES(2,13176969,1,"Novela",1);
INSERT INTO datos_adicionales (donghua_id,vistas,temporales_totales,adaptacion,subtitulos)VALUES(3,2581508,1,"Novela ligera",1);
INSERT INTO datos_adicionales (donghua_id,vistas,temporales_totales,adaptacion,subtitulos)VALUES(4,158077,4,"Manhua",1);
INSERT INTO datos_adicionales (donghua_id,vistas,temporales_totales,adaptacion)VALUES(5,850971,2,"Novela");

SELECT * FROM datos_adicionales;

SELECT * FROM donghuas JOIN datos_adicionales ON id=donghua_id;

DROP TABLE datos_adicionales; -- para eliminar la tabla

    -- FOREIGN KEY (donghua_id) REFERENCES donghuas(id)  es para relacionar el id de una tabla y la otra
