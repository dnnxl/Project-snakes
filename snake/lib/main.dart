import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
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

        "/ojos": (BuildContext context) => Eyes(),
        "/cabeza": (BuildContext context) => Head(),
        "/escamas": (BuildContext context) => Scales(),
        "/fosetaloreal": (BuildContext context) => LorealPit(),
      },
    );
  }
}

class Begin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: 30, bottom: 10, right: 418, left: 60),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/actividad_main.jpg'),
              //fit: BoxFit.cover,
              alignment: Alignment.center),
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
                      child: RaisedButton(
                        color: Colors.green,
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/encr");
                        },
                        child: SizedBox(
                          width: 70,
                          height: 30,
                          child: Center(
                            child:
                            Text("En Costa Rica", textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.green,
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/aprendamos");
                        },
                        child: SizedBox(
                          width: 70,
                          height: 30,
                          child: Center(
                            child:
                            Text("Aprendamos", textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.green,
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/contactos");
                        },
                        child: SizedBox(
                          width: 70,
                          height: 30,
                          child: Center(
                            child:
                            Text("Contactos", textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.green,
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/acercade");
                        },
                        child: SizedBox(
                          width: 70,
                          height: 30,
                          child: Center(
                            child:
                            Text("Acerca de", textAlign: TextAlign.center),
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
    );
  }
}


//Sections of the app

class InCR extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: 30, bottom: 10, right: 466, left: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/cr.jpg'),
              //fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
      ),
    );
  }
}

class Learn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: 30, bottom: 10, right: 26, left: 450),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/actividad_aprendamos.jpg'),
              //fit: BoxFit.cover,
              alignment: Alignment.center),
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
                      child: RaisedButton(
                        color: Colors.lime,
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/ojos");
                        },
                        child: SizedBox(
                          width: 70,
                          height: 30,
                          child: Center(
                            child:
                            Text("Ojos", textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.lime,
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/cabeza");
                        },
                        child: SizedBox(
                          width: 70,
                          height: 30,
                          child: Center(
                            child:
                            Text("Cabeza", textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.lime,
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/escamas");
                        },
                        child: SizedBox(
                          width: 70,
                          height: 30,
                          child: Center(
                            child:
                            Text("Escamas", textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.lime,
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/fosetaloreal");
                        },
                        child: SizedBox(
                          width: 70,
                          height: 30,
                          child: Center(
                            child:
                            Text("Foseta Loreal", textAlign: TextAlign.center),
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
              //fit: BoxFit.cover,
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
              image: AssetImage('images/actividad_about.jpg'),
              //fit: BoxFit.cover,
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
              //fit: BoxFit.cover,
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
              //fit: BoxFit.cover,
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
              //fit: BoxFit.cover,
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
              //fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
      ),
    );
  }
}



