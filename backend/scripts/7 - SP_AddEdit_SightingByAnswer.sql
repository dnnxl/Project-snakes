CREATE DEFINER=`root`@`localhost` PROCEDURE `sightingbyAnswerAddOrEdit`(
  IN _idSightingByAnswer INT, 
  IN _TextAnswer varchar(45),
  IN _Sighting_NbSighting INT,
  IN _answer_Nbanswer INT
)
BEGIN
 IF _idSightingByAnswer = 0 THEN 
  INSERT INTO sightingbyanswer(TextAnswer,Sighting_NbSighting,answer_Nbanswer)
  VALUES(_TextAnswer,_Sighting_NbSighting,_answer_Nbanswer);
  SET _idSightingByAnswer = last_insert_id();
  
  ELSE 
  UPDATE sightingbyanswer
  SET TextAnswer = _TextAnswer,
  Sighting_NbSighting =_Sighting_NbSighting,
  answer_Nbanswer = _answer_Nbanswer
  WHERE idSightingByAnswer= _idSightingByAnswer;
  END IF;
  SELECT  _idSightingByAnswer AS idSightingByAnswer;
END