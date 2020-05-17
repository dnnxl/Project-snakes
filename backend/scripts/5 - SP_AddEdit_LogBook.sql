CREATE DEFINER=`root`@`localhost` PROCEDURE `logBookAddOrEdit`(
  IN _idLogBook INT, 
  IN _change varchar(200)
)
BEGIN
  IF _idLogBook = 0 THEN 
  INSERT INTO logbook(vChange)
  VALUES(_change);
  SET _idLogBook = last_insert_id();
  
  ELSE 
  UPDATE logbook
  SET vChange = _change
  WHERE idLogBook = _idLogBook;
  END IF;
  SELECT  _idLogBook AS idLogBook;
END