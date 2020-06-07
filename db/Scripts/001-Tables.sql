
CREATE TABLE `SIGHTING` (
  `idSighting` INT,
  `description` VARCHAR(200),
  `dateSighting` DATE,
  `xCoordinate` FLOAT,
  `yCoordinate` FLOAT,
  `bite` TINYINT,
  `call` TINYINT,
  `date` DATE,
  `idUser` INT,
  PRIMARY KEY (`idSighting`),
  CONSTRAINT FK_idUser FOREIGN KEY (`idUser`) REFERENCES USER_SNAKE(`idUser`)
);

CREATE TABLE `IMAGE_SNAKE` (
  `idImage` INT,
  `snakeType` TINYINT,
  `idSighting` INT,
  PRIMARY KEY (`idImage`),
  CONSTRAINT FK_idSighting FOREIGN KEY (`idSighting`) REFERENCES SIGHTING(`idSighting`)
);

CREATE TABLE `USER_SNAKE` (
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

CREATE TABLE `USER_ANSWER_SIGHTING` (
  `idAnswer` INT,
  `answerText` VARCHAR(200),
  `dateAnswer` DATE,
  `idUser` INT,
  `idSighting` INT,
  PRIMARY KEY (`idAnswer`),
  CONSTRAINT FK_idUserAnswer FOREIGN KEY (`idUser`) REFERENCES USER_SNAKE(`idUser`)
  CONSTRAINT FK_idSightingAnswer FOREIGN KEY (`idSighting`) REFERENCES SIGHTING(`idSighting`)
);
