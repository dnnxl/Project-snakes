import 'package:flutter/material.dart';
import 'package:snake/pages/home_page.dart';

import 'package:snake/pages/login_page.dart';
import 'package:snake/pages/signup_page.dart';

import 'package:snake/content/Begin.dart';
import 'package:snake/content/InfoSections.dart';
import 'package:snake/content/LearnSections.dart';
import 'package:snake/content/Sighting.dart';

Map<String, WidgetBuilder> getRoutes() {

  return <String, WidgetBuilder> {
    'login'       : (BuildContext context) => LoginPage(),
    'signup'       : (BuildContext context) => SignupPage(),
    'home'       : (BuildContext context) => HomePage(),
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
  };

}