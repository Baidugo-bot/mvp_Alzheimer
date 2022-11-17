import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:projeto_estudo/src/controller/FamilyController.dart';
import 'package:projeto_estudo/src/views/AddFamily.dart';
import '../../AppController.dart';
import '../components/CustomButton.dart';
import '../controller/PacienteController.dart';
import '../models/FamilyModel.dart';

class FamilyPaciente extends StatelessWidget {
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
    );
  }
}

class TopBar extends StatelessWidget {
  final int contBox;

  const TopBar({Key? key, this.contBox = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime agora = DateTime.now();
    return Stack(
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
                                Navigator.of(context).pushNamed(
                                    '/seeFamilyPaciente',
                                    arguments: {
                                      "family": Family(
                                          title: "${FamilyPacienteController.instance.title}",
                                          date: DateTime.now(),
                                          Telephone: "${FamilyPacienteController.instance.Telephone}",
                                          parentesco: "${FamilyPacienteController.instance.parentesco}",
                                          identifier: 0,
                                          image: AssetImage(
                                              "assets/images/imagemEscolha.png"),
                                          imgLink:
                                              "assets/images/imagemEscolha.png")
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
                                            "Parentesco: ${FamilyPacienteController.instance.parentesco}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            "Nome: ${FamilyPacienteController.instance.title}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              //fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Idade: ${FamilyController.instance.calculateAge(FamilyPacienteController.instance.date).toString()}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            "Telefone: ${FamilyPacienteController.instance.Telephone}",
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
    );
  }
}
