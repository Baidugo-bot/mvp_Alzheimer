import 'package:flutter/material.dart';

import 'package:jiffy/jiffy.dart';
//
import 'package:projeto_estudo/src/controller/ProfileController.dart';
import 'package:projeto_estudo/src/views/EditProfileView.dart';

import '../../AppController.dart';
import '../components/CustomButton.dart';

class ProfileView extends StatefulWidget {
  String nome = "";
  int data = 0;
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  // debugShowCheckedModeBanner: false;
  @override
  Widget build(BuildContext context) {
    DateTime agora = DateTime.now();
    print(
        (agora.difference(ProfileController.instance.dataNasc).inDays / 365)
            .toString()
            .substring(0, 2));

    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: CustomAppBar.instance.actionDefault(context, "/profile", Text("Perfil"),
        InkWell(
            onTap: (){
              Navigator.of(context).pushNamed('/editProfile');
            },
            splashColor: Colors.blue,
            child: Icon(Icons.edit)

        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
//informações tela principal
          
              CircleAvatar(
              backgroundColor: Colors.white,
              radius: 85,
              child: CircleAvatar(
            backgroundImage: ProfileController.instance.image,
            radius: 100,
          )
          ),
          
          Text(
            "Nome: ${ProfileController.instance.nome}",
            style: TextStyle(fontSize: 24,),
          ),
          Text(
            "Nascimento: ${Jiffy(ProfileController.instance.dataNasc).format("MMMM do yyyy")}",
            style: TextStyle(fontSize: 24),
          ),
          Text(
            "Idade: ${(agora.difference(ProfileController.instance.dataNasc).inDays / 365).toString().substring(0, 2)}",
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
