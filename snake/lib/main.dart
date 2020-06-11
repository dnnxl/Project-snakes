import 'dart:async';
import 'dart:io';
//import 'package:device_preview/device_preview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

File _image;

Future main() async {

  WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  SystemChrome.setEnabledSystemUIOverlays([]);


  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(new MyApp());
}

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

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Begin(),
      routes: <String, WidgetBuilder>{

        "/inicio": (BuildContext context) => Begin(),

        "/encr": (BuildContext context) => InCR(),
        "/aprendamos": (BuildContext context) => Learn(),
        "/contactos": (BuildContext context) => Contacts(),
        "/acercade": (BuildContext context) => About(),
        "/sighting": (BuildContext context) =>Sighting(),
        "/ojos": (BuildContext context) => Eyes(),
        "/cabeza": (BuildContext context) => Head(),
        "/escamas": (BuildContext context) => Scales(),
        "/fosetaloreal": (BuildContext context) => LorealPit(),
        "/corales": (BuildContext context) => Corals(),
      },
    );
  }
}

class Begin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double defaultScreenWidth = 180.0;
    double defaultScreenHeight = 360.0;  ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    Color c1 = const Color(0xFFFFFF);
    return new Scaffold(
      backgroundColor: Colors.black,

      body: Container(
        padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15.0), bottom: ScreenUtil.instance.setWidth(0.0), right: ScreenUtil.instance.setHeight(364.0), left: ScreenUtil.instance.setHeight(28.0)),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/actividad_main.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.lerp(Alignment.bottomLeft, Alignment.bottomRight, 0)),
        ),

        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: ScreenUtil.instance.setHeight(62.0)),

                      child: FlatButton.icon(

                        icon: Image.asset('images/avistamiento.png' ,width: ScreenUtil.instance.setHeight(150.0),height: ScreenUtil.instance.setHeight(60.0),),
                        color: c1,

                          label: Text("",style: TextStyle(
                              color: Colors.transparent, fontSize: 0.0)),
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/sighting");
                        },
                      ),
                    )
                  ],
                ),

                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: ScreenUtil.instance.setHeight(2.0)),
                      child: FlatButton.icon(
                        icon: Image.asset('images/encr.png' ,width: ScreenUtil.instance.setHeight(120.0),height: ScreenUtil.instance.setHeight(60.0),),
                        color: Colors.transparent,//Colors.green,
                        label: Text("",style: TextStyle(
                            color: Colors.white, fontSize: 0.0)),
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/encr");
                        },
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: ScreenUtil.instance.setHeight(42.0)),
                      child: FlatButton.icon(
                        icon: Image.asset('images/contactos.png' ,width: ScreenUtil.instance.setHeight(120.0),height: ScreenUtil.instance.setHeight(60.0),),
                        color: Colors.transparent,//Colors.green,
                        label: Text("",style: TextStyle(
                            color: Colors.white, fontSize: 0.0)),
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/contactos");},
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: ScreenUtil.instance.setHeight(92.0)),
                      child: FlatButton.icon(
                        icon: Image.asset('images/acercade.png' ,width: ScreenUtil.instance.setHeight(120.0),height: ScreenUtil.instance.setHeight(60.0),),
                        color: Colors.transparent,//Colors.green,
                        label: Text("",style: TextStyle(
                          color: Colors.white, fontSize: 0.0)),
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/acercade");},
                        ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}

class Services {

  void postData(var avistamiento) async {
    var url = "https://snake-api-mysql.herokuapp.com/SnakesApi/Sighting/Create";

    var response = await post(Uri.parse(url),
        headers: {
          //"Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(avistamiento),
        encoding: Encoding.getByName("utf-8"));

  }
}


//Sections of the app

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

  bool checkBoxValueBite = false;
  bool checkBoxValueCall911 = false;

  final myControllerName = TextEditingController();

  final myControllerDescription = TextEditingController();

  final myControllerEmail = TextEditingController();



  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    //print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
    //setState(() {
    _image = image;
    imagenes = imagenes + 1;
    print(imagenes);
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

    //getImage();
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
                      '¿Mordió? : ',
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
                /*Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'Ingrese su nombre',
                          labelText: 'Nombre *',
                          fillColor: Colors.black,
                          hoverColor: Colors.black,

                        ),
                        controller: myControllerName,
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
                ),*/
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          hintText: 'Ingrese su correo',
                          labelText: 'Correo *',
                          fillColor: Colors.white,
                          hoverColor: Colors.white,
                          focusColor: Colors.white,


                        ),
                        cursorColor: Colors.white,
                        controller: myControllerEmail,
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
                      padding: EdgeInsets.all(0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.insert_comment),
                          hintText: 'Ingrese la descripción',
                          labelText: 'Descripción *',

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
                      padding: EdgeInsets.all(0),
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
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,



    );
  }
}

class Learn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        //padding: EdgeInsets.only(top: 0, bottom: 10, right: 0, left: 392),
        padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15.0), bottom: ScreenUtil.instance.setWidth(0.0), right: ScreenUtil.instance.setHeight(0.0), left: ScreenUtil.instance.setHeight(416.0)),
        //padding: EdgeInsets.only(top: data.size.height/150, bottom: data.size.height/150, right: data.size.width/1050, left: data.size.height*1.0888),

        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/actividad_aprendamos.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.lerp(Alignment.bottomLeft, Alignment.bottomRight, 0)),
        ),
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: ScreenUtil.instance.setHeight(28.0)),
                      child: FlatButton.icon(
                        icon: Image.asset('images/botones/ojos.png' ,width: ScreenUtil.instance.setHeight(160.0) ,height: ScreenUtil.instance.setHeight(50.0),),
                        //icon: Image.asset('images/botones/ojos.png' ,width: 150,height: 50,),
                        color: Colors.transparent,

                        label: Text("",style: TextStyle(
                            color: Colors.transparent, fontSize: 0.0)),
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/ojos");
                        },
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: ScreenUtil.instance.setHeight(28.0)),
                      child: FlatButton.icon(
                        icon: Image.asset('images/botones/cabeza.png' ,width: ScreenUtil.instance.setHeight(160.0) ,height: ScreenUtil.instance.setHeight(50.0),),
                        color: Colors.transparent,

                        label: Text("",style: TextStyle(
                            color: Colors.transparent, fontSize: 0.0)),
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/cabeza");
                        },
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: ScreenUtil.instance.setHeight(28.0)),
                      child: FlatButton.icon(
                        icon: Image.asset('images/botones/escamas.png' ,width: ScreenUtil.instance.setHeight(160.0) ,height: ScreenUtil.instance.setHeight(50.0),),
                        color: Colors.transparent,

                        label: Text("",style: TextStyle(
                            color: Colors.transparent, fontSize: 0.0)),
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/escamas");
                        },
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: ScreenUtil.instance.setHeight(28.0)),
                      child: FlatButton.icon(
                        icon: Image.asset('images/botones/foseta.png' ,width: ScreenUtil.instance.setHeight(160.0) ,height: ScreenUtil.instance.setHeight(50.0),),
                        color: Colors.transparent,

                        label: Text("",style: TextStyle(
                            color: Colors.transparent, fontSize: 0.0)),
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/fosetaloreal");
                        },
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: ScreenUtil.instance.setHeight(28.0)),
                      child: FlatButton.icon(
                        icon: Image.asset('images/botones/corales.png' ,width: ScreenUtil.instance.setHeight(160.0) ,height: ScreenUtil.instance.setHeight(50.0),),
                        color: Colors.transparent,

                        label: Text("",style: TextStyle(
                            color: Colors.transparent, fontSize: 0.0)),
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/corales");
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: ScreenUtil.instance.setHeight(525.0)),
        child: FloatingActionButton(
          hoverColor: Colors.black,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          mini: true,
          tooltip: 'Volver',
          onPressed: () async {
            Navigator.pushNamed(context, "/encr");
          },
          child: Icon(Icons.arrow_back),

        ),
      ),
    );
  }
}

class InCR extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,

      body: Container(
        padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(84.0), bottom: ScreenUtil.instance.setWidth(0.0), right: ScreenUtil.instance.setHeight(70.5), left: ScreenUtil.instance.setHeight(323.0)),
        //padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(15.0), bottom: ScreenUtil.instance.setWidth(0.0), right: ScreenUtil.instance.setHeight(364.0), left: ScreenUtil.instance.setHeight(28.0)),

        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/cr.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.lerp(Alignment.bottomLeft, Alignment.bottomRight, ScreenUtil.instance.setHeight(1.0))),
        ),
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(17.0)),

                      child: FlatButton.icon(
                        icon: Image.asset('images/aprendamos.png' ,width: ScreenUtil.instance.setHeight(150.0), height: ScreenUtil.instance.setHeight(50.0),),
                        color: Colors.transparent,

                        label: Text("",style: TextStyle(
                            color: Colors.transparent, fontSize: 0.0)),
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/aprendamos");
                        },
                      ),

                    )
                  ],
                ),
              ],
            ),
          ],
        ),

      ),

      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: ScreenUtil.instance.setHeight(525.0)),
        child: FloatingActionButton(
          hoverColor: Colors.black,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          mini: true,
          tooltip: 'Volver',
          onPressed: () async {
            Navigator.pushNamed(context, "/inicio");
          },
          child: Icon(Icons.arrow_back),

        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class Contacts extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(84.0), bottom: ScreenUtil.instance.setWidth(0.0), right: ScreenUtil.instance.setHeight(66.0), left: ScreenUtil.instance.setHeight(355.0)),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/contactos.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
      ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(right: ScreenUtil.instance.setHeight(525.0)),
          child: FloatingActionButton(
            hoverColor: Colors.black,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            mini: true,
            tooltip: 'Volver',
            onPressed: () async {
              Navigator.pushNamed(context, "/inicio");
            },
            child: Icon(Icons.arrow_back),

          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked
    );
  }
}

class About extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(30.0), bottom: ScreenUtil.instance.setWidth(10.0), right: ScreenUtil.instance.setHeight(466.0), left: ScreenUtil.instance.setHeight(10.0)),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/actividad_about.png'),
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
      ),

      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: ScreenUtil.instance.setHeight(525.0)),
        child: FloatingActionButton(
        hoverColor: Colors.black,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        mini: true,
        tooltip: 'Volver',
        onPressed: () async {
          Navigator.pushNamed(context, "/inicio");
        },
        child: Icon(Icons.arrow_back),

        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}


//Sections of Learn

class Eyes extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(30.0), bottom: ScreenUtil.instance.setWidth(10.0), right: ScreenUtil.instance.setHeight(466.0), left: ScreenUtil.instance.setHeight(10.0)),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/ojos.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: ScreenUtil.instance.setHeight(525.0)),
        child: FloatingActionButton(
          hoverColor: Colors.black,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          mini: true,
          tooltip: 'Volver',
          onPressed: () async {
            Navigator.pushNamed(context, "/aprendamos");
          },
          child: Icon(Icons.arrow_back),

        ),
      ),
    );
  }
}

class Head extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(30.0), bottom: ScreenUtil.instance.setWidth(10.0), right: ScreenUtil.instance.setHeight(466.0), left: ScreenUtil.instance.setHeight(10.0)),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/cabeza.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: ScreenUtil.instance.setHeight(525.0)),
        child: FloatingActionButton(
          hoverColor: Colors.black,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          mini: true,
          tooltip: 'Volver',
          onPressed: () async {
            Navigator.pushNamed(context, "/aprendamos");
          },
          child: Icon(Icons.arrow_back),

        ),
      ),
    );
  }
}

class Scales extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(30.0), bottom: ScreenUtil.instance.setWidth(10.0), right: ScreenUtil.instance.setHeight(466.0), left: ScreenUtil.instance.setHeight(10.0)),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/escamas.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: ScreenUtil.instance.setHeight(525.0)),
        child: FloatingActionButton(
          hoverColor: Colors.black,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          mini: true,
          tooltip: 'Volver',
          onPressed: () async {
            Navigator.pushNamed(context, "/aprendamos");
          },
          child: Icon(Icons.arrow_back),

        ),
      ),
    );
  }
}

class LorealPit extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(30.0), bottom: ScreenUtil.instance.setWidth(10.0), right: ScreenUtil.instance.setHeight(466.0), left: ScreenUtil.instance.setHeight(10.0)),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/foseta_loreal.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: ScreenUtil.instance.setHeight(525.0)),
        child: FloatingActionButton(
          hoverColor: Colors.black,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          mini: true,
          tooltip: 'Volver',
          onPressed: () async {
            Navigator.pushNamed(context, "/aprendamos");
          },
          child: Icon(Icons.arrow_back),

        ),
      ),
    );
  }
}

class Corals extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(30.0), bottom: ScreenUtil.instance.setWidth(10.0), right: ScreenUtil.instance.setHeight(466.0), left: ScreenUtil.instance.setHeight(10.0)),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/corales.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: ScreenUtil.instance.setHeight(525.0)),
        child: FloatingActionButton(
          hoverColor: Colors.black,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          mini: true,
          tooltip: 'Volver',
          onPressed: () async {
            Navigator.pushNamed(context, "/aprendamos");
          },
          child: Icon(Icons.arrow_back),

        ),
      ),
    );
  }
}


