CREATE TABLE Line (
	Line_ID INT,
    Line_Name VARCHAR(20),
    PRIMARY KEY (Line_ID)
);

CREATE TABLE Station (
	Station_ID INT,
    Name VARCHAR(20),
    Line_ID INT,
    Prev_Station INT,
    Next_Station INT,
    Hybrid_ID INT,
	PRIMARY KEY (Station_ID),
    FOREIGN KEY (Line_ID) REFERENCES Line(Line_ID),
    FOREIGN KEY (Hybrid_ID) REFERENCES Hybrid(Hybrid_ID)
);

ALTER TABLE Station ADD FOREIGN KEY (Prev_Station) REFERENCES Station(Station_ID);
ALTER TABLE Station ADD FOREIGN KEY (Next_Station) REFERENCES Station(Station_ID);

CREATE TABLE Hybrid (
	Hybrid_ID INT,
    Station1 INT,
    Station2 INT,
    Station3 INT,
    Station4 INT
    PRIMARY KEY (Hybrid_ID),
    FOREIGN KEY (Station1) REFERENCES Station(Station_ID),
    FOREIGN KEY (Station2) REFERENCES Station(Station_ID),
    FOREIGN KEY (Station3) REFERENCES Station(Station_ID),
    FOREIGN KEY (Station4) REFERENCES Station(Station_ID)
);

INSERT INTO Line VALUES 
	(1,'Red'), 
	(2,'Yellow'), 
    (3,'Green');
    
INSERT INTO Station VALUES
	(1,'R1',1,NULL,2,NULL),
    (2,'R2',1,1,3,NULL),
    (3,'RG',1,-1,-1,1),
    (4,'RY',1,-1,-1,2),
    (5,'R3',1,4,6,NULL),
    (6,'R4',1,5,NULL,NULL),
    (7,'G1',3,NULL,8,NULL),
    (8,'G2',3,7,3,NULL),
    (9,'Y1',2,NULL,4,NULL),
    (10,'Y2',2,4,11,NULL),
    (11,'Y3',2,10,NULL,NULL);
