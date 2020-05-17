CREATE DEFINER=`root`@`localhost` PROCEDURE `sightingAddOrEdit`(
  IN _NbSighting INT, 
  IN _UserName varchar(45),
  IN _UserContact varchar(45),
  IN _DTSighting date,
  IN _XCoordinate float,
  IN _YCoordinate float,
  IN _TxtComent varchar(45),
  IN _imageId int, 
  IN _informationId int
)
BEGIN
 IF _NbSighting = 0 THEN 
  INSERT INTO sighting(UserName,UserContact,DTSighting, XCoordinate, YCoordinate, TxtComent, Image_NbImage, PrincipalInformation_idPrincipalInformation)
  VALUES(_UserName,_UserContact,_DTSighting,_XCoordinate,_YCoordinate,_TxtComent,_imageId,_informationId);
  SET _NbSighting = last_insert_id();
  
  ELSE 
  UPDATE sighting
  SET UserName = _TextAnswer,
  UserContact =_Sighting_NbSighting,
  DTSighting = _answer_Nbanswer,
  XCoordinate = _XCoordinate,
  YCoordinate =_YCoordinate ,
  TxtComent=_TxtComent, 
  Image_NbImage=_imageId, 
  PrincipalInformation_idPrincipalInformation=_informationId
  WHERE NbSighting = _NbSighting;
  END IF;
  SELECT  _NbSighting AS NbSighting;
END