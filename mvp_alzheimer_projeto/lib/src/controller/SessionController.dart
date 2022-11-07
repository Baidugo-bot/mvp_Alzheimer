

import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart' as http;
class SessionController {
  static SessionController instance = SessionController();

  Future<String> tryLogin(String email,String passWord) async {
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

    dynamic returned = jsonDecode(response.body);
    dynamic fixed = jsonDecode(returned["data"]);
    print(fixed["Email"]);
    if(returned["auth"]==null){
      print(returned["auth"]);
      return "";
    }else{
      print("teste");
      return "";
    }
  }

  void register(String tipoCuidador,String email,String passWord) async {
    final response = await http.post(
      Uri.parse('https://alzheimer-db.herokuapp.com/register/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'tipo_cuidador':tipoCuidador,
        'email':email,
        'senha':passWord,
      }),
    );
    print(response.body);
    dynamic posCollected = jsonDecode(response.body);
    dynamic posUpdated = jsonDecode(posCollected["data"]);
    // if(posCollected["message"]!="Não encontrado"){
    //   ;
    // }else{
    //   ;
    // }
  }
}