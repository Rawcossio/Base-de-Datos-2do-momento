CREATE DATABASE Biblioteca --Crear bases der datos Biblioteca 

Use Biblioteca--Poner en uso la base de  datos

CREATE TABLE Libro(
Idlibro int primary key,
Titulo varchar(50) NOT NULL,
Editorial varchar(50) NOT NULL,
Area varchar(50) NOT NULL,
)

CREATE TABLE LibAut(
IdAutor int primary key,
Idlibro int foreign key references Libro)

CREATE TABLE Prestamo(
Idlector int primary key,
Idlibro int foreign key references Libro,
FechaPrestamo date,
FechaDevolucion date,
Devuelto bit
)

CREATE TABLE Autor(
IdAutor int primary key,
Nombre varchar(50) NOT NULL,
Nacionalidad varchar(50) NOT NULL)

DROP TABLE Prestamo-- Se elimina la tabla prestamos, ya que no contiene primary key

CREATE TABLE Estudiante(
Idlector int primary key,
CI varchar(50) NOT NULL,
Nombre varchar(50) NOT NULL,
Direccion varchar(50) NOT NULL,
Carrera varchar(50) NOT NULL,
Edad int
)

--Se crea nuevamente la tabla prestamo, ya quie solo contiene claves foraneas

CREATE TABLE Prestamo( 
Idlector int foreign key references Estudiante,
Idlibro int foreign key references Libro,
FechaPrestamo date,
FechaDevolucion date,
Devuelto bit
)

--Se registran los datos de la tabla  Estudiante

INSERT INTO Estudiante(Idlector, CI, Nombre,Direccion,Carrera,Edad) VALUES
(0001, '15483611','Ruben Blades','CL 4 SUR 50 E 44', 'Musica', 30),
(0002, '22174351','Michael Jackson','CR 54 SUR 10 B 24','Danza', 20),
(0003, '43344583','Jon Bon Jovi','DG 74 30 A 24','Arte', 15),
(0004, '1001666312','Elton Jhon','CR 33 70 A 24','Moda', 19),
(0005, '1001666312','Silvestre Stalone','CR 30 74  26','Teatro', 20)

SELECT Nombre, edad FROM Estudiante --Listar Nombre y edad de los estudiantes

SELECT*FROM Estudiante WHERE Carrera='Musica'--Estudiantes que pertenecen a la carrera de Musica

SELECT*FROM Estudiante WHERE Nombre LIKE 'S%'--Estudiantes donde Nombre empieza en la letra S

SELECT*FROM Estudiante WHERE Edad>15--Estudiantes mayores de 15 años

--Se registran los datos de la tabla  Autor

INSERT INTO Autor(IdAutor,Nombre,Nacionalidad) VALUES
(1000,'Mario Mendoza', 'Colombiano'),
(2000,'Ernesto Sabato', 'Argentino'),
(3000,'Ernest Heminway', 'NorteAmericano'),
(4000,'Adolfo Hitler', 'Aleman'),
(5000,'Willian Shakespeare', 'Ingles')

SELECT*FROM Autor WHERE Nacionalidad='Colombiano'--Autores que tienen nacionalidad Colombiana

--Se registran los datos de la tabla Libro 

INSERT INTO Libro(Idlibro,Titulo,Editorial,Area)VALUES
(0100,'Satanas', 'Alfaguara', 'Literatura'),
(0200,'100 años de soledad', 'Penguin','Literatura'),
(0300,'El mundo de Sofia', 'Norma','Filosofia'),
(0400,'Orientacion de Objetos en JAVA', 'Alpha', 'Informatica'),
(0500,'Constitucion de 1991', 'Nacional', 'Leyes')

SELECT*FROM Libro WHERE Area NOT IN('Informatica')--Mostrar todos los libros menos los del area de Informatica

SELECT*FROM Estudiante WHERE Edad BETWEEN 20 AND 30 -- Mostrar estudiantes entre 20 y 30 años

SELECT*FROM Estudiante WHERE CI LIKE '%00%'--mostrar todos los registros que en cualquier parte de la identificación tenga el 00