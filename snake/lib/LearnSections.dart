import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';


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