import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Services {
/*
  POST:
  https://snake-api-mysql.herokuapp.com/SnakesApi/Users/Create


  PUT:
  https://snake-api-mysql.herokuapp.com/SnakesApi/Users/Edit/:id


  GET:
  https://snake-api-mysql.herokuapp.com/SnakesApi/Users/GetList
  */

  void postDataSighting(var avistamiento) async {
    var url = "https://snake-api-mysql.herokuapp.com/SnakesApi/Sighting/Create";

    var response = await post(Uri.parse(url),
        headers: {
          //"Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(avistamiento),
        encoding: Encoding.getByName("utf-8"));
  }

  void postDataCreateUser(var usuario) async {
    var url = "https://snake-api-mysql.herokuapp.com/SnakesApi/Users/Create";

    var response = await post(Uri.parse(url),
        headers: {
          //"Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(usuario),
        encoding: Encoding.getByName("utf-8"));
  }


  //Future<User> authenticateUser(String username, String password) async {
  Future<bool> authenticateUser(String username, String password) async {
    final http.Response response = await http.post(
      'https://snake-api-mysql.herokuapp.com/SnakesApi/Users/Authenticate',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'UserName': username,
        'Password': password
      }),
    );
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return true;//(json.decode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      //throw Exception('Failed to authenticate user');
      return false;
    }
  }
}