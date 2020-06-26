CREATE TABLE `IMAGE` (
  `idImage` INT,
  `snakeType` TINY INT,
  `idSighting` INT,
  PRIMARY KEY (`idImage`),
  KEY `FK` (`idSighting`)
);

CREATE TABLE `SIGHTING` (
  `idSighting` INT,
  `description` VARCHAR(200),
  `dateSighting` DATE,
  `xCoordinate` FLOAT,
  `yCoordinate` FLOAT,
  `bite` TINY INT,
  `call` TINY INT,
  `date` DATE,
  `idUser` INT,
  PRIMARY KEY (`idSighting`),
  KEY `FK` (`idUser`)
);

CREATE TABLE `USER` (
  `idUser` INT,
  `username` VARCHAR(200),
  `mail` VARCHAR(200),
  `name` VARCHAR(200),
  `password` VARCHAR(200),
  `rol` VARCHAR(200),
  PRIMARY KEY (`idUser`)
);

CREATE TABLE `BINNACLE` (
  `idBinnacle` INT,
  `rol` VARCHAR(200),
  `table` VARCHAR(45),
  `date` DATE,
  PRIMARY KEY (`idBinnacle`)
);

CREATE TABLE `INFORMATION` (
  `idInfo` INT,
  `key` VARCHAR(45),
  `value` VARCHAR(200),
  PRIMARY KEY (`idInfo`)
);

