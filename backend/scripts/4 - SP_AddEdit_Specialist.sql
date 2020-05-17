CREATE DEFINER=`root`@`localhost` PROCEDURE `specialistAddOrEdit`(
  IN _nbSpecialist INT, 
  IN _nameSpecialist varchar(45),
  IN _passwordSpecialist varchar(45),
  IN _authorAnswer varchar(45)
)
BEGIN
  IF _nbSpecialist = 0 THEN 
  INSERT INTO specialist(NameSpecialist, PaswordSpecialist, AuthorAnswer)
  VALUES(_nameSpecialist, _passwordSpecialist, _authorAnswer);
  SET _nbSpecialist = last_insert_id();
  
  ELSE 
  UPDATE specialist
  SET NameSpecialist = _nameSpecialist,
  PaswordSpecialist = _passwordSpecialist,
  AuthorAnswer = _authorAnswer
  WHERE NbSpecialist = _nbSpecialist;
  END IF;
  SELECT  _nbSpecialist AS NbSpecialist;
END