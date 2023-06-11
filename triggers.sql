CREATE TABLE juegoJunio (
id_game INT PRIMARY KEY,
name VARCHAR(30),
description VARCHAR(150)
);

SELECT * from juegojunio;

DELIMITER $$
CREATE TRIGGER newgamejunio
AFTER INSERT ON juego
FOR EACH ROW 
INSERT INTO juegoJunio (id_game, name, description) VALUES (NEW.id_juego, NEW.nombre, NEW.descripcion);
INSERT INTO juego (id_juego, nombre,id_empresa, fecha,id_categoria, descripcion) VALUES (8,'DAY OF DEFEEAT:SOURCE',1,'2010-07-12',3,'Day of Defeat te ofrece la acción en línea más trepidante, ambientada en la Europa de la Segunda Guerra Mundial.');

END$$

Select * from juego;
Select * from juegojunio;

CREATE TABLE registro_compras (
id int primary key auto_increment,
comprador int,
juego int,
fecha datetime
);

DELIMITER //

CREATE TRIGGER informacion_compra
AFTER INSERT ON compra
FOR EACH ROW
BEGIN
    INSERT INTO registro_compras(comprador, juego)
    VALUES (NEW.id_usuario, NEW.id_juego);
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER setear_fecha_registro
BEFORE INSERT ON registro_compras
FOR EACH ROW
BEGIN
    SET NEW.fecha = NOW();
END //

DELIMITER ;

select * from compra ;

insert INTO compra(id_compra, id_usuario, id_juego, monto)values(9,4,8,685.00);
insert INTO compra(id_compra, id_usuario, id_juego, monto)values(10,2,4,0.00);

select * from registro_compras ; 

