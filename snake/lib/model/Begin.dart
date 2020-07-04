import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:snake/bloc/provider.dart';

class Begin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double defaultScreenWidth = 180.0;
    double defaultScreenHeight = 360.0;  ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    final bloc = Provider.of(context);

    Color c1 = const Color(0xFFFFFF);
    return new Scaffold(
      backgroundColor: Colors.black,

      body: Container(
        padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(10.0), bottom: ScreenUtil.instance.setWidth(0.0), right: ScreenUtil.instance.setHeight(364.0), left: ScreenUtil.instance.setHeight(28.0)),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/principal.png'),
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
                      padding: EdgeInsets.only(right: ScreenUtil.instance.setHeight(32.0)),

                      child: FlatButton.icon(

                        icon: Image.asset('images/avistamiento.png' ,width: ScreenUtil.instance.setHeight(180.0),height: ScreenUtil.instance.setHeight(70.0),),
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
                        icon: Image.asset('images/credits.png' ,width: ScreenUtil.instance.setHeight(120.0),height: ScreenUtil.instance.setHeight(60.0),),
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
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.black,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        tooltip: "Salir",
        onPressed: () async {
          Navigator.pushNamed(context, "login");
        },
        child: Icon(Icons.exit_to_app),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}