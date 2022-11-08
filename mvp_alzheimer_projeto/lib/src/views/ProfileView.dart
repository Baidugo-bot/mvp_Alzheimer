import 'package:flutter/material.dart';

import 'package:jiffy/jiffy.dart';
//
import 'package:projeto_estudo/src/controller/ProfileController.dart';
import 'package:projeto_estudo/src/views/EditProfileView.dart';

import '../models/FamilyModel.dart';

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
      backgroundColor: Color.fromRGBO(121,188,218, 1),
      body: Column(
        children: <Widget>[
          TopBar(),
        ],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
//botão volta menu principal
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Icon(
                Icons.keyboard_return,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 50.0,
              ),
            ),
            Text(" Perfil"),

//botão editar perfil
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/editProfile');
              },
              child: Icon(null,
                // Icons.edit,
                // color: Color.fromARGB(255, 255, 255, 255),
                size: 50.0,
              ),
            ),
          ],
        ),
      ),
      
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
// //informações tela principal
          
//               Row(
//                     mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: <Widget>[
//                                     Image(
//                                       image: FamilyModel.instance.famili[index]
//                                           .getImage(),
//                                       height: 115,
//                                     ),
//                 ],
//               ),
          
//           Text(
//             "Nome: ${ProfileController.instance.nome}",
//             style: TextStyle(fontSize: 24,),
//           ),
//           Text(
//             "Nascimento: ${Jiffy(ProfileController.instance.dataNasc).format("MMMM do yyyy")}",
//             style: TextStyle(fontSize: 24),
//           ),
//           Text(
//             "Idade: ${(agora.difference(ProfileController.instance.dataNasc).inDays / 365).toString().substring(0, 2)}",
//             style: TextStyle(fontSize: 20),
//           ),
//           Container(
//             height: 80,
//           ),
//         ],
//       ),
    );

  }
  
}
class TopBar extends StatelessWidget {
  var index;

@override
  Widget build(BuildContext context) {
    DateTime agora = DateTime.now();
    print(
        (agora.difference(ProfileController.instance.dataNasc).inDays / 365)
            .toString()
            .substring(0, 2));


return Stack(
  
  children: <Widget>[
 Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
//informações tela principal
          
              Row(
                    mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Image(
                                      image: FamilyModel.instance.famili[index]
                                          .getImage(),
                                      height: 115,
                                    ),
                ],
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
  ]
);
  
  }
}