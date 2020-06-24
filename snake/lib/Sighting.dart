import 'dart:async';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Services.dart';

File _image;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home: Scaffold(
          appBar: AppBar(
            title: Text('Image Picker Example'),
          ),
          body: Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(_image),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: getImage,
            tooltip: 'Pick Image',
            child: Icon(Icons.add_a_photo),
          ),
        ));
  }
}

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

  var imagenes = 0;
  var modo1 = 1;
  var modo2 = 0;

  bool checkBoxValueBite = false;
  bool checkBoxValueCall911 = false;

  final myControllerName = TextEditingController();

  final myControllerDescription = TextEditingController();

  final myControllerEmail = TextEditingController();



  Future getImage() async {
    //print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
    //setState(() {
    if( modo1 == 1 || modo2 == 1){
      var image = await ImagePicker.pickImage(source: ImageSource.camera);
      _image = image;
      imagenes = imagenes + 1;
      print(imagenes);
      modo1 = 0;
      modo2 = 0;
    }
    //});
  }

  @override
  Widget build(BuildContext context) {
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
                          labelText: 'Descripción',

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

                          position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                          nombre = myControllerName.text;
                          descripcion = myControllerDescription.text;
                          correo = myControllerEmail.text;

                          latitud = position.latitude;
                          longitud = position.longitude;



                          var avistamiento = {
                            "UserName": nombre,
                            "UserContact": correo,
                            "XCoordinate": longitud.toString(),
                            "YCoordinate": latitud.toString(),
                            "TxtComent": descripcion,
                            "ImageId": null,
                            "infoId": null
                          };

                          Services service = new Services();
                          service.postData(avistamiento);
                          Navigator.pushNamed(context, "/inicio");
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
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,



    );
  }
}