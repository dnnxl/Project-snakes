import 'dart:async';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snake/bloc/provider.dart';
import 'Services.dart';
import 'package:intl/intl.dart';
import 'dart:convert';


class Sighting extends StatefulWidget {

  @override
  _SightingState createState() => _SightingState();
}

class _SightingState extends State<Sighting> {
  Position position;

  var latitud = 0.0;
  var longitud = 0.0;
  var nombre = "";
  var descripcion = "";
  var correo = "";
  var fecha = DateTime.now();


  var modo1 = 1;
  var modo2 = 0;
  var toolTipIcon = "Tomar otra foto";

  bool primeraParte = true;

  List<File> images = [];
  List<String> imagesBase64 = [];
  var imagesCounter = 0;


  bool checkBoxValueBite = false;
  bool checkBoxValueCall911 = false;

  final myControllerName = TextEditingController();

  final myControllerDescription = TextEditingController();

  final myControllerEmail = TextEditingController();



  Future getImage() async {
    //print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
    //setState(() {
    if(images.length == 5){
      toolTipIcon = "Máximo de fotos es 5";
    }

    if(( modo1 == 1 || modo2 == 1) && images.length < 5){//Control the amount of files to upload

      images.add(await ImagePicker.pickImage(source: ImageSource.camera));
      imagesCounter = imagesCounter + 1;
      modo1 = 0;
      modo2 = 0;
    }

    if(primeraParte){//Valida para realizar la primera parte del avistamiento.

      position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      nombre = myControllerName.text;
      correo = myControllerEmail.text;
      latitud = position.latitude;
      longitud = position.longitude;
      String formattedDate = DateFormat('yyyy-MM-dd').format(fecha);
      //CAMBIAR LUEGO
      var userId = 1;

      var imagen = images.elementAt(0);
      String base64Image = base64Encode(imagen.readAsBytesSync());


      var avistamiento = {
        "Fecha": formattedDate,
        "UserId": userId,
        "XCoordinate": longitud.toString(),
        "YCoordinate": latitud.toString(),
        "ImageId": base64Image
      };

      Services service = new Services();
      service.postDataSighting(avistamiento);


      primeraParte = false;
    }
  }

  void _mensajeAvistamientoExitoso(context) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text("Avistamiento exitoso"),
            content: Text("Gracias por su reporte."),
            actions: <Widget>[
              RaisedButton(
                color: Color.fromRGBO(39, 204, 192, 1.0),
                child: Text("Aceptar", style: TextStyle(color: Colors.white),),
                onPressed: (){ Navigator.of(context).pop(); Navigator.pushReplacementNamed(context, '/inicio');},
              )
            ],
          );
        }
    );
  }

  void convertToBase64(){
    String base64Image;
    var image;

    for(int i = 1; i<imagesCounter; i++ ){
      image = images.elementAt(i);
      base64Image = base64Encode(image.readAsBytesSync());
      imagesBase64.add(base64Image);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    print("================");
    print("Usuario: ${bloc.user}");
    print("Password: ${bloc.password}");
    print("================");

    double defaultScreenWidth = 180.0;
    double defaultScreenHeight = 360.0;  ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    getImage();

    return new Scaffold(
      backgroundColor: Colors.black,
      body:

      Container(

        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage('images/avistamiento-3.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.center
          ),
        ),

        padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(6.0), bottom: ScreenUtil.instance.setWidth(5.0), right: ScreenUtil.instance.setHeight(200.0), left: ScreenUtil.instance.setHeight(200.0)),

        child: SingleChildScrollView( child: Column(
          children: <Widget>[

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: ScreenUtil.instance.setWidth(5.0)),
                      child: Text(
                        'Reportes',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: ScreenUtil.instance.setSp(8.0), ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '¿Hubo mordedura? : ',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: ScreenUtil.instance.setSp(5.0), ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Checkbox(
                        value: checkBoxValueBite,
                        onChanged: (bool value){
                          checkBoxValueBite = value;
                          setState((){
                            checkBoxValueBite = value;
                          });
                        },
                        checkColor: Colors.white,
                        activeColor: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '¿Llamó al 911? : ',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: ScreenUtil.instance.setSp(5.0), ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Checkbox(
                        value: checkBoxValueCall911,
                        onChanged: (bool value){

                          checkBoxValueCall911 = value;
                          setState((){
                            checkBoxValueCall911 = value;
                          });
                        },
                        checkColor: Colors.white,
                        activeColor: Colors.black,
                      ),
                    ),
                  ],
                ),


                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.insert_comment),
                          hintText: 'Ingrese la descripción',
                          labelText: 'Descripción y comentarios',

                        ),
                        controller: myControllerDescription,
                        onSaved: (String value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String value) {
                          return value.contains('@') ? 'Do not use the @ char.' : null;
                        },
                      ),
                    )
                  ],
                ),

                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(40),
                      child: FlatButton(
                        color: Colors.green,
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),

                        onPressed: () async {

                          //position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                          //nombre = myControllerName.text;
                          descripcion = myControllerDescription.text;
                          //correo = myControllerEmail.text;

                          //latitud = position.latitude;
                          //longitud = position.longitude;

                          convertToBase64();

                          var avistamiento = {
                            "Bite": checkBoxValueBite,
                            "Call911": checkBoxValueCall911,
                            "TxtComent": descripcion,
                            "ImageId": imagesBase64,
                          };

                          Services service = new Services();
                          service.postDataSighting(avistamiento);
                          //Navigator.pushNamed(context, "/inicio");
                          _mensajeAvistamientoExitoso(context);
                        },
                        child: SizedBox(
                          width: ScreenUtil.instance.setHeight(70.0),
                          height: ScreenUtil.instance.setHeight(30.0),
                          child: Center(
                            child:
                            Text("Terminar", textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),

          ],
        ),
        ),
      ),


      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.black,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () {
          modo2 = 1;
          getImage();
        },
        tooltip: toolTipIcon,
        child: Icon(Icons.add_a_photo),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,



    );
  }
}