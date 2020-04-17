/********************************************************************/
/*  Date	Name	Description                                 */
/*  --------------------------------------------------------------- */
/*                                                                  */
/*  1/17/2020  Eric Walter	Initial deployment of Project1 script. */
/*	4/17/2020  Eric Walter	Converted from mySql to MS SQL   */
/********************************************************************/

DROP DATABASE IF EXISTS photography;
GO
CREATE DATABASE photography;
GO
USE photography;
GO
--create employees table
CREATE TABLE employee
(
	employeeID INT NOT NULL identity,
	firstName VARCHAR(255) NOT NULL,
	lastName VARCHAR(255) NOT NULL,
	primary key(employeeID)
);
--create contact table
CREATE TABLE visitor
(
	visitorID INT NOT NULL identity,
	visitorPhone varchar(25) NOT NULL,
	visitorName VARCHAR(255) NOT NULL,
	visitorEmail VARCHAR(255) NOT NULL,
	visitorNum TINYINT NOT NULL,
	visitorHours TINYINT NOT NULL,
	employeeID INT NOT NULL REFERENCES employee(employeeID),
	primary key (visitorID)
);

INSERT INTO employee
	(firstName, lastName)
VALUES
	('John','Goodman'), ('John','Candy'), ('Mike','Row'), ('Lane','Chadwick'), ('Fox','McCloud'),
	('James','Hetfield'), ('Gordon','Ramsey'), ('Bob','Sagat'), ('Jean','Claude'), ('Bob','Marley'),
	('Son','Goku'), ('Kal','El'), ('Luigi','Mario'), ('Sandy','Cheeks'), ('Timmy','Turner'),
	('Bruce','Wayne'), ('Clark','Kent'), ('Steve','Rodgers'), ('Sonic','Hedgehog'), ('Mario','Mario');
GO
	
create procedure InsertVisitor
	(@visitorName varchar(255), @visitorPhone varchar(255), @visitorEmail varchar(255), @visitorNum int, @visitorHours int, @employeeID int)
as
INSERT INTO visitor
	(visitorName, visitorPhone, visitorEmail, visitorNum, visitorHours, employeeID)
VALUES
	(@visitorName,
	@visitorPhone,
	@visitorEmail,
	@visitorNum,
	@visitorHours,
	@employeeID);

	create user [EJApp] FOR LOGIN [EJApp] WITH DEFAULT_SCHEMA=[dbo]
	GO
	grant execute on InsertVisitor to EJApp
	GO