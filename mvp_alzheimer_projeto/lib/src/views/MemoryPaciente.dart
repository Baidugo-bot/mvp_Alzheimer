import 'dart:io';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/controller/PacienteController.dart';
import '../components/CustomButton.dart';
import '../controller/PacienteController.dart';
import '../controller/PacienteController.dart';
import '../models/MemoryModel.dart';
import 'package:intl/intl.dart';
class MemoryPaciente extends StatefulWidget {
  MemoryPaciente({Key? key}) : super(key: key);

  @override
  State<MemoryPaciente> createState() => MemoryPacienteState();
}

class MemoryPacienteState extends State<MemoryPaciente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: CustomAppBar.instance.getNamedDefault(context, "/", Text(" Memórias ",style: TextStyle(color: Colors.black),)),
      body: ListView.builder(
          itemCount: 1,
          // if 0 then show message
          itemBuilder: (BuildContext build, int index) {

            return Card(
              color: AppController.instance.mainColor,
              child: InkWell(
                splashColor: Colors.grey.withAlpha(70),
                onTap: () {
                  Navigator.of(context).pushNamed('/seememoryPaciente', arguments: {
                    "memory": Memory(title: "",
                        date: DateTime.now(),
                        description: "",
                        identifier: 0,
                        image:  AssetImage("assets/images/imagemEscolha.png"),
                        imgLink: "assets/images/imagemEscolha.png")
                  });
                },
                child: SizedBox(
                  height: 160,
                  child: Row(
                    children: [
                       CircleAvatar(
                         radius: 60,
                       ),
                      Container(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              MemoryPacienteController.instance.title,
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              MemoryPacienteController.instance.date.toString().substring(0, 10),
                              style: TextStyle(
                                fontSize: 22, color: Colors.black,),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
