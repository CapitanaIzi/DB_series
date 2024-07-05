CREATE DATABASE segundo_db;

USE segundo_db;
DROP TABLE donghuas; 

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

-- para eliminar la tabla
DROP TABLE datos_adicionales; 
CREATE TABLE datos_adicionales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    donghua_id INT,
    vistas FLOAT NOT NULL,
    temporales_totales INT NOT NULL,
    adaptacion TINYINT(1) DEFAULT 0,
    subtitulos TINYINT(1) DEFAULT 0,
    FOREIGN KEY (donghua_id) REFERENCES donghuas(id) 
);


INSERT INTO datos_adicionales (donghua_id,vistas,temporales_totales,adaptacion,subtitulos)VALUES(1,18656570,2,1,1);
INSERT INTO datos_adicionales (donghua_id,vistas,temporales_totales,adaptacion,subtitulos)VALUES(2,13176969,1,1,1);
INSERT INTO datos_adicionales (donghua_id,vistas,temporales_totales,adaptacion,subtitulos)VALUES(3,2581508,1,2,1);
INSERT INTO datos_adicionales (donghua_id,vistas,temporales_totales,adaptacion,subtitulos)VALUES(4,158077,4,3,1);
INSERT INTO datos_adicionales (donghua_id,vistas,temporales_totales,adaptacion)VALUES(5,850971,2,1);

SELECT * FROM datos_adicionales;

SELECT * FROM donghuas JOIN datos_adicionales ON donghuas.id=donghua_id;

    -- FOREIGN KEY (donghua_id) REFERENCES donghuas(id)  es para relacionar el id de una tabla y la otra

    /*// Este proyecto es del Profe
const { createConnection } = require("mysql2/promise");
/* const modulo = require("modulo"); */
const leer = require("prompt-sync")();

async function main() {
    const conexionDB = await crearConexion();
    let opcionMenu = 0;
    console.log("1 - Mostrar todos los donghuas");
    console.log("2 - Seleccionar donghuas por episodios disponibles");
    console.log("3 - Mostrar todos los donghuas con Datos Adicionales");
    console.log("4 - Para ver Donghuas en Emision o Finalizado");
    console.log("5 - Para eliminar la tabla de Datos Adicionales");
    opcionMenu = Number(leer());
    switch (opcionMenu) {
        case 1:
            const [resultado] = await conexionDB.query("SELECT * FROM donghuas");
            console.table(resultado);
            break;
        case 2:
            console.log("Ingresa el numero de episodios minimos que quieras ver, y te recomiendo donghuas");
            const donghuaEpisodios = Number(leer());
            const [episodiosBuscado] = await conexionDB.query("SELECT * FROM donghuas WHERE episodios>= ?", [donghuaEpisodios]);
            console.table(episodiosBuscado);
            break;
        case 3:
            const [resultadoBuscado] = await conexionDB.query("SELECT * FROM donghuas JOIN datos_adicionales ON donghuas.id=donghua_id");
            console.table(resultadoBuscado);
            break;
        case 4:
            console.log("Ingresa 0 para ver Donghuas FINALIZADOS y 1 para los que estan en EMISION");
            const estadoDonghua = Number(leer());
            const [estadoBuscado] = await conexionDB.query("SELECT titulo,episodios FROM donghuas WHERE estado= ?", [estadoDonghua]);
            console.table(estadoBuscado);
            break;
        case 5:
            const [resultadoFinal] = await conexionDB.query("DROP TABLE datos_adicionales");
            console.table(resultadoFinal);
            break;
        default:
            console.log("Opcion no encontrada");
    }
    conexionDB.end();
}

main();

async function crearConexion() {
    return await createConnection({
        host: "localhost",
        user: "root",
        database: "segundo_db",
        password: "1234"
    });
}*/

    
