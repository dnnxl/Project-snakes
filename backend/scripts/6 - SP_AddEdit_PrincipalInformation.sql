CREATE DEFINER=`root`@`localhost` PROCEDURE `principalInfoAddOrEdit`(
 IN _idPrincipalInformation INT, 
  IN _DTSighting date,
  IN _XCoordinate float,
  IN _YCoordinate float,
  IN _AditionalInformation varchar(500),
  IN _ImageId int
  )
BEGIN
  IF _idPrincipalInformation = 0 THEN 
  INSERT INTO principalinformation(DTSighting, XCoordinate, YCoordinate,AditionalInformation,Image_NbImage)
  VALUES(_DTSighting, _XCoordinate, _YCoordinate,_AditionalInformation,_ImageId);
  SET _idPrincipalInformation = last_insert_id();
  
  ELSE 
  UPDATE principalinformation
  SET DTSighting = _nameSpecialist,
  XCoordinate = _passwordSpecialist,
  YCoordinate = _authorAnswer,
  AditionalInformation = _AditionalInformation,
  Image_NbImage = _ImageId
  WHERE idPrincipalInformation = _idPrincipalInformation;
  END IF;
  SELECT  _idPrincipalInformation AS idPrincipalInformation;
END