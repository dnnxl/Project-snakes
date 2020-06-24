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

import 'Begin.dart';
import 'Sighting.dart';
import 'LearnSections.dart';
import 'InfoSections.dart';

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


