import 'package:http/http.dart';
import 'package:http/http.dart' as http;
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


  //Future<User> authenticateUser(String username, String password) async {
  Future<JsonCodec> authenticateUser(String username, String password) async {
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
      return (json.decode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to authenticate user');
    }
  }
}