import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
//
import 'package:projeto_estudo/src/controller/FamilyController.dart';
import 'package:projeto_estudo/src/views/AddFamily.dart';

import '../models/FamilyModel.dart';

class FamilyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;
  
    return Tela();

  }
}

 class Tela extends StatelessWidget {
   int contBox = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        centerTitle: true,
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
                size: 40.0,
              ),
            ),
            Text(
              " Familiares",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
//botão add perfil
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.add,size: 40.0,), onPressed: () {
                        GestureDetector(
                          onTap:() => contBox++
                        );
                          Navigator.pushNamed(context, '/addFamily');

                       
                     
                  }),
                  
                ]),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          TopBar(contBox: contBox),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  final int contBox;
  
  const TopBar({Key? key, this.contBox = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime agora = DateTime.now();
     
    print(
        (agora.difference(FamilyController.instance.dataNasc).inDays / 365)
            .toString()
            .substring(0, 2));
    return Stack(
      children: <Widget>[
        Container(
          height: 50,
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
          color: Colors.lightBlue,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white),
            height: MediaQuery.of(context).size.height - 99,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 150,
                    child: ListView.builder(
                      itemCount: FamilyModel.instance.family.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(
                                      "https://loremflickr.com/320/32$index"),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 160,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Nome${FamilyModel.instance.family[index].title}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Idade${(agora.difference(FamilyModel.instance.family[index].date).inDays / 365).toString().substring(0, 2)}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    "Telefone${(agora.difference(FamilyModel.instance.family[index].date).inDays / 365).toString().substring(0, 2)}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 150, right: 5, left: 5, bottom: 10),
          child: Container(),
        )
      ],
    );
  }
}
