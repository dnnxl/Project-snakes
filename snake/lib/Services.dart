import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

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