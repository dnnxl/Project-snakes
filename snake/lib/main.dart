import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
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

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Serpientes de Costa Rica',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        'login'       : (BuildContext context) => LoginPage(),
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
*/

import 'package:snake/routes/routes.dart';
import 'bloc/provider.dart';

/*void main() {
  runApp(MyApp());
}*/

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

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
          title: 'Serpientes de Costa Rica',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: 'login',
          routes: getRoutes(),
        )
    );
  }
}

