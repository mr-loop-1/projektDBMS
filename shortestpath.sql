

drop table IF EXISTS stack_Compare;
drop table IF EXISTS lastNode;

CREATE TABLE stack_Compare (Station VARCHAR(20), Track INT);
CREATE TABLE lastNode (Last_Station_ID INT, I INT);

AlTER table lastNode ADD PRimary key (I);
INSERT INTO lastNode VALUES (1, 1);
Drop trigger if exists lastAdded;

DELIMITER $$

CREATE TRIGGER lastAdded AFTER INSERT
ON stack_Compare FOR EACH ROW
BEGIN
	UPDATE lastNode SET Last_Station_ID = (SELECT Station.Station_ID FROM Station, stack_Compare WHERE New.Station = Station.Name) WHERE I = 1;
END $$



DELIMITER ;

DROP PROCEDURE IF EXISTS insertStation;
DROP PROCEDURE IF EXISTS insertMain;

DELIMITER $$
SET max_sp_recursion_depth=3;
CREATE PROCEDURE insertStation (insertstationID INT, starter VARCHAR(20), destination VARCHAR(20)) 
this_procedure:BEGIN

DECLARE nextNode INT DEFAULT NULL;
INSERT INTO stack_Compare (Station)
	SELECT Name from Station WHERE Station_ID = insertstationID;

IF insertStationID IN (SELECT Station_ID FROM Station WHERE Name = starter OR Name = destination)
	THEN LEAVE this_procedure;
END IF;
SET nextNode = (SELECT Next_Station FROM Station WHERE Station_ID = insertstationID);
IF nextNode IS NULL
	THEN LEAVE this_procedure;
END IF;
IF nextNode = -1
	THEN LEAVE this_procedure;
ELSE CALL insertStation (nextNode, starter, destination);
END IF;
END
$$

CREATE PROCEDURE insertMain (starter VARCHAR(20), destination VARCHAR(20))
BEGIN
DECLARE nextNode INT DEFAULT NULL;
CALL insertStation(8, starter, destination);
loop1: LOOP
SET nextNode = (SELECT Station.Next_Station FROM Station, lastNode WHERE Station.Station_ID = lastNode.Last_Station_ID);
IF nextNode IN (SELECT Station_ID FROM Station WHERE Name = starter OR Name = destination)
	THEN LEAVE loop1;
END IF;
END LOOP loop1;
END;
$$

DELIMITER ;

CALL insertMain('G1','RG');

SELECT * FROM stack_Compare;

select * from lastNode;