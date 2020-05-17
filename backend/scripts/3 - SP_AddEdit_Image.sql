CREATE DEFINER=`root`@`localhost` PROCEDURE `imageAddOrEdit`(
  IN _nbImage INT, 
  IN _snakeType tinyint
)
BEGIN
  IF _nbImage = 0 THEN 
  INSERT INTO image(SnakeType)
  VALUES(_snakeType);
  SET _nbImage = last_insert_id();
  
  ELSE 
  UPDATE image
  SET SnakeType = _snakeType
  WHERE NbImage= _nbImage;
  END IF;
  SELECT  _nbImage AS NbImage;
END