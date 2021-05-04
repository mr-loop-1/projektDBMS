use metro3;
CREATE TABLE Station (
	Station_ID INT,
    Name VARCHAR(20),
    Prev_Station INT,
    Next_Station INT,
	PRIMARY KEY (Station_ID)
);

INSERT INTO Station VALUES
	(1, 'A', NULL, 2),
    (2, 'B', 1, 3),
    (3, 'C', 2, 10),
    (4, 'D', NULL, 10),
    (5, 'E', NULL, 10),
    (6, 'F', NULL, 7),
    (7, 'G', 6, 8),
    (8, 'H', -1, -1),
    (9, 'I', NULL, 8),
    (10, 'J', -1, -1),
    (11, 'K', -1, -1),
    (12, 'L', NULL, 13),
    (13, 'M', 12, 14),
    (14, 'N', -1, -1),
    (15, 'O', 14, 11),
    (16, 'P', 17, 11),
    (17, 'Q', 18, 16),
    (18, 'R', 19, 17),
    (19, 'S', NULL, 18),
    (20, 'T', NULL, 11);
    
CREATE TABLE Hybrid (
	Hybrid_ID INT,
    N INT,
    K INT,
    J INT,
    H INT
);

INSERT INTO Hybrid VALUES 
	(1, 15, 10, 11, 9),
    (2, 13, 15, 5, 7),
    (3, 20, 16, 4, 10),
    (4, NULL, NULL, 3, NULL), 
    (5, NULL, NULL, 8, NULL),
    (6, NULL, NULL, NULL, NULL);
    
CREATE TABLE half
	(K VARCHAR(20),
    J VARCHAR(20)
);

INSERT INTO half VALUES
	('A','L'), ('B','M'), ('C','N'), ('D','O'), ('E','P'), ('F','Q'), ('G','R'), ('H','S'), ('I','T');
