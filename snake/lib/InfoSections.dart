import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';


//Sections of the app

class Learn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final data = MediaQuery.of(context);
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