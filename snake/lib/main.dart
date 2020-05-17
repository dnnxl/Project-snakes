import 'dart:async';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
File _image;
Position position;

Future main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);


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
    Color c1 = const Color(0xFFFFFF);
    return new Scaffold(
      backgroundColor: Colors.black,

      body: Container(
        padding: EdgeInsets.only(top: 20, bottom: 0, right: 302, left: 48),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/actividad_main.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.lerp(Alignment.bottomLeft, Alignment.bottomRight, 0.2)),
        ),

        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 62.0),

                      child: FlatButton.icon(

                        icon: Image.asset('images/avistamiento.png' ,width: 150,height: 60,),
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
                      padding: EdgeInsets.only(right: 22.0),

                      child: FlatButton.icon(
                        icon: Image.asset('images/aprendamos.png' ,width: 150,height: 60,),
                        color: Colors.transparent,//Colors.green,
                        label: Text("",style: TextStyle(
                            color: Colors.white, fontSize: 0.0)),
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/aprendamos");
                        },
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 2.0),
                      child: FlatButton.icon(
                        icon: Image.asset('images/encr.png' ,width: 150,height: 60,),
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
                      padding: EdgeInsets.only(left: 22.0),
                      child: FlatButton.icon(
                        icon: Image.asset('images/contactos.png' ,width: 150,height: 60,),
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
                      padding: EdgeInsets.only(left: 62.0),
                      child: FlatButton.icon(
                        icon: Image.asset('images/acercade.png' ,width: 150,height: 60,),
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


//Sections of the app

class Sighting extends StatelessWidget {

  var latitud = 0.0;
  var longitud = 0.0;
  var nombre = "";
  var descripcion = "";
  final myControllerName = TextEditingController();
  final myControllerDescription = TextEditingController();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
    //setState(() {
    _image = image;
    //});
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Container(

        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage('images/avistamientos.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.center
          ),
        ),
        padding: EdgeInsets.only(top: 30, bottom: 10, right: 200, left: 200),
        child: Column(
          children: <Widget>[

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Text(
                        'Avistamientos',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
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
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
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
                      padding: EdgeInsets.all(10),
                      child: FlatButton(
                        color: Colors.lime,
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          nombre = myControllerName.text;
                          descripcion = myControllerDescription.text;
                          latitud = position.latitude;
                          longitud = position.longitude;

                          Navigator.pushNamed(context, "/inicio");
                        },
                        child: SizedBox(
                          width: 70,
                          height: 30,
                          child: Center(
                            child:
                            Text("Aceptar", textAlign: TextAlign.center),
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

      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.black,
        backgroundColor: Colors.black,
        onPressed: getImage,
        mini: true,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class Learn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: 0, bottom: 10, right: 0, left: 392),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/actividad_aprendamos.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.lerp(Alignment.bottomLeft, Alignment.bottomRight, 1)),
        ),
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: FlatButton.icon(
                        icon: Image.asset('images/botones/ojos.png' ,width: 150,height: 50,),
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
                      padding: EdgeInsets.all(10),
                      child: FlatButton.icon(
                        icon: Image.asset('images/botones/cabeza.png' ,width: 150,height: 50,),
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
                      padding: EdgeInsets.all(10),
                      child: FlatButton.icon(
                        icon: Image.asset('images/botones/escamas.png' ,width: 150,height: 50,),
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
                      padding: EdgeInsets.all(10),
                      child: FlatButton.icon(
                        icon: Image.asset('images/botones/foseta.png' ,width: 150,height: 50,),
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
                      padding: EdgeInsets.all(10),
                      child: FlatButton.icon(
                        icon: Image.asset('images/botones/corales.png' ,width: 150,height: 50,),
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
    );
  }
}

class InCR extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: 30, bottom: 10, right: 466, left: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/cr.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
      ),
    );
  }
}

class Contacts extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: 30, bottom: 10, right: 466, left: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/actividad_contacto.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: 30, bottom: 10, right: 466, left: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/actividad_about.png'),
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
      ),
    );
  }
}


//Sections of Learn

class Eyes extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: 30, bottom: 10, right: 466, left: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/ojos.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.center),
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
        padding: EdgeInsets.only(top: 30, bottom: 10, right: 466, left: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/cabeza.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.center),
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
        padding: EdgeInsets.only(top: 30, bottom: 10, right: 466, left: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/escamas.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.center),
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
        padding: EdgeInsets.only(top: 30, bottom: 10, right: 466, left: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/foseta_loreal.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.center),
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
        padding: EdgeInsets.only(top: 30, bottom: 10, right: 466, left: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/corales.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
      ),
    );
  }
}


