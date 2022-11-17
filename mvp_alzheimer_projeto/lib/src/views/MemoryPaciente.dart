import 'dart:io';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import '../components/CustomButton.dart';
import '../controller/SessionController.dart';
import '../models/MemoryModel.dart';
import 'package:intl/intl.dart';
class MemoriesPacienteView extends StatefulWidget {
  MemoriesPacienteView({Key? key}) : super(key: key);

  @override
  State<MemoriesPacienteView> createState() => MemoriesPacienteViewState();
}

class MemoriesPacienteViewState extends State<MemoriesPacienteView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: CustomAppBar.instance.getNamedDefault(context, "/", Text(" Memórias ",style: TextStyle(color: Colors.black),)),
      body: ListView.builder(
          itemCount: MemoryModel.instance.memories.length,
          // if 0 then show message
          itemBuilder: (BuildContext build, int index) {

            return Card(
              color: AppController.instance.mainColor,
              child: InkWell(
                splashColor: Colors.grey.withAlpha(70),
                onTap: () {
                  Navigator.of(context).pushNamed('/seememoryPaciente', arguments: {
                    "memory": MemoryModel.instance.memories[index]
                  });
                },
                child: SizedBox(
                  height: 160,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage:
                        MemoryModel.instance.memories[index].getImage(),
                      ),
                      Container(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              MemoryModel.instance.memories[index]
                                  .getTitle(),
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              MemoryModel.instance.memories[index]
                                  .getConvertedDate()
                                  .toString()
                                  .substring(0, 10),
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
