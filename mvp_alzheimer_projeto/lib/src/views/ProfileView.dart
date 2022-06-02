import 'package:flutter/material.dart';

import 'package:jiffy/jiffy.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/views/EditProfileView.dart';

class ProfileView extends StatefulWidget {
  String nome = "";
  int data = 0;
  ProfileView();
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  // debugShowCheckedModeBanner: false;
  @override
  Widget build(BuildContext context) {
    DateTime agora = DateTime.now();
    print(
        (agora.difference(AppController.instance.profile.dataNasc).inDays / 365)
            .toString()
            .substring(0, 2));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(" Perfil"),
        actions: [
//botão editar perfil
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return EditProfile();
              }));
            },
            child: Icon(
              Icons.edit,
              color: Colors.red,
              size: 30.0,
            ),
          ),
//botão volta menu principal
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Icon(
              Icons.keyboard_return,
              color: Colors.red,
              size: 30.0,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
//informações tela principal
          Center(
              child: CircleAvatar(
            backgroundImage: AppController.instance.profile.image,
            radius: 100,
          )),
          Text(
            "Nome: ${AppController.instance.profile.nome}",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Nascimento: ${Jiffy(AppController.instance.profile.dataNasc).format("MMMM do yyyy")}",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Idade: ${(agora.difference(AppController.instance.profile.dataNasc).inDays / 365).toString().substring(0, 2)}",
            style: TextStyle(fontSize: 20),
          ),
          Container(
            height: 80,
          ),
        ],
      ),
    );
  }
}
