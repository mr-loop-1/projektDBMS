use sometro;

CREATE TABLE stack_Final (Stations VARCHAR(20), Track INT);
CREATE TABLE stack_Compare (Station VARCHAR(20), Track INT);

insert into stack_Compare (Station, Track) SELECT 0, 1;

select * from stack_Compare;

DELIMITER $$
IF select 0 = 0 THEN SELECT 1; END IF

DELIMITER $$ 
CREATE TRIGGER autoTrack BEFORE INSERT
ON stack_Compare
FOR EACH ROW
BEGIN
	END$$

DROP PROCEDURE IF EXISTS insertStation;

DELIMITER $$
CREATE PROCEDURE insertStation (insertstationID, starter, destination) 
BEGIN
DECLARE nextNode INT DEFAULT NULL;
INSERT INTO stack_Compare (Stations)
	SELECT Name from Station WHERE Station_ID = insertstationID;
IF 
SET nextNode = (SELECT Next_Station FROM Station WHERE Station_ID = insertstationID);
IF next IS NULL
	THEN 
IF next = -1
	THEN insertJunction (
    
CREATE PROCEDURE insert (starter, destination)
BEGIN
DECLARE nextNode

CREATE PROCDURE insertFromJunction (insertJunctioID, starter, destination)
BEGIN
IF SELECT 

$$
DELIMITER ;
DELIMITER $$
IF select 0 = 0 THEN SELECT 1; END IF $$