import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

//
import 'package:projeto_estudo/src/controller/FamilyController.dart';
import 'package:projeto_estudo/src/views/AddFamily.dart';

import '../../AppController.dart';
import '../components/CustomButton.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.instance.getNamedDefault(
          context,
          "/",
          const Text(
            'Família',
            style: TextStyle(color: Colors.black),
          )),
      body: Column(
        children: const <Widget>[
          TopBar(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          Navigator.of(context).pushNamed('/addFamily');
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class TopBar extends StatelessWidget {
  final int contBox;

  const TopBar({Key? key, this.contBox = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime agora = DateTime.now();

    print((agora.difference(FamilyController.instance.dataNasc).inDays / 365)
        .toString()
        .substring(0, 2));
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            height: 50,
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppController.instance.mainColor,
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppController.instance.mainColor,
                ),
                height: MediaQuery.of(context).size.height - 64,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppController.instance.mainColor,
                        ),
                        height: MediaQuery.of(context).size.height - 180,
                        child: ListView.builder(
                          itemCount: FamilyModel.instance.famili.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              color: AppController.instance.mainColor,
                              child: InkWell(
                                splashColor: Colors.grey.withAlpha(70),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed('/seeFamily', arguments: {
                                    "family": FamilyModel.instance.famili[index]
                                  });
                                },
                                child: SizedBox(
                                  height: 160,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 60,
                                        backgroundImage: FamilyModel
                                            .instance.famili[index]
                                            .getImage(),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width -
                                            135,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Parentesco: ${FamilyModel.instance.famili[index].parentesco}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 22,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(
                                              "Nome: ${FamilyModel.instance.famili[index].title}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 22,
                                                //fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Idade: ${(agora.difference(FamilyModel.instance.famili[index].date).inDays / 365).toString().substring(0, 2)}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 22,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(
                                              "Telefone: ${FamilyModel.instance.famili[index].Telephone}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 22,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
