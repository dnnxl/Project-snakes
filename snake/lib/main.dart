import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

