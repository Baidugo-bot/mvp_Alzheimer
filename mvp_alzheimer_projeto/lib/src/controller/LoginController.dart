

import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart' as http;
class LoginController {
  static LoginController instance = LoginController();

  void tryLogin(String email,String passWord) async {
    print("mandando local");
    final response = await http.post(
      Uri.parse('https://alzheimer-db.herokuapp.com/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email':email,
        'senha':passWord,
      }),
    );
    print(response.body);
    if (response.statusCode == 201) {
      print("success");
    } else {
      throw Exception('Failed to create album.');
    }



  }
}