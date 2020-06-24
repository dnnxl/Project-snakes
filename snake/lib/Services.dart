import 'package:http/http.dart';
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