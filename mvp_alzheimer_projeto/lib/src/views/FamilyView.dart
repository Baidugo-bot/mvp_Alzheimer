import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
//
import 'package:projeto_estudo/src/controller/FamilyController.dart';
import 'package:projeto_estudo/src/views/AddFamily.dart';

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
      appBar:
          CustomAppBar.instance.getNamedDefault(context, "/", Text('Familia')),
      body: Column(
        children: <Widget>[
          TopBar(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/addFamily');
        },
        backgroundColor: Colors.grey,
        child: Icon(
          Icons.add,
          color: Color.fromRGBO(121, 188, 218, 1),
          size: 40.0,
        ),
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
    var index;
    return Stack(
      children: <Widget>[
        Container(
          height: 50,
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(), color: Color.fromRGBO(121, 188, 218, 1)),
        ),
        Column(
          children: [
            // Image(
            //               image: FamilyModel.instance.famili[index].getImage(),
            //               height: 120,),
            //             Container(width: 10,),

            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(121, 188, 218, 1)),
                height: MediaQuery.of(context).size.height - 99,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(121, 188, 218, 1),
                        ),
                        height: MediaQuery.of(context).size.height - 150,
                        child: ListView.builder(
                          itemCount: FamilyModel.instance.famili.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              splashColor: Colors.grey.withAlpha(70),
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('/seeFamily', arguments: {
                                  "family": FamilyModel.instance.famili[index]
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(121, 188, 218, 1),
                                  border: Border.all(),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Image(
                                      image: FamilyModel.instance.famili[index]
                                          .getImage(),
                                      height: 115,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          120,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Parentesco: ${FamilyModel.instance.famili[index].parentesco}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            "Nome: ${FamilyModel.instance.famili[index].title}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Idade: ${(agora.difference(FamilyModel.instance.famili[index].date).inDays / 365).toString().substring(0, 2)}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            "Telefone: ${FamilyModel.instance.famili[index].Telephone}",
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
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 150, right: 5, left: 5, bottom: 10),
          child: Container(),
        )
      ],
    );
  }
}
