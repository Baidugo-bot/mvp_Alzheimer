import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/controller/PacienteController.dart';
import 'package:projeto_estudo/src/controller/SessionController.dart';
import 'package:projeto_estudo/src/remedios/ViewRemedioPage.dart';

import 'package:projeto_estudo/src/remedios/RegisterRemedio.dart';
import 'package:projeto_estudo/src/remedios/VisualizarRemedio.dart';
import 'package:projeto_estudo/src/remedios/masage_responce.dart';

import '../../AppController.dart';
import '../components/CustomButton.dart';

class ViewRemedioPaciente extends StatefulWidget {
  final String _title;
  ViewRemedioPaciente(this._title);
  @override
  State<StatefulWidget> createState() => _ViewRemedioPaciente();
}

class _ViewRemedioPaciente extends State<ViewRemedioPaciente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: CustomAppBar.instance.getNamedDefault(
          context,
          "/",
          Text(
            " Remédio Paciente ",
            style: TextStyle(color: Colors.black),
          )),
      body: ListView.builder(
        itemCount: AppController.instance.remedio.length,
        itemBuilder: (context, index) {
          return ListTile(

            title: Text(AppController.instance.remedio[index].nome.toString()+" "+AppController.instance.remedio[index].dosagem.toString()),
            subtitle: Text(AppController.instance.remedio[index].hora
                .toString()
                .substring(10, 15)),
            leading: CircleAvatar(
              child: Text(
                  AppController.instance.remedio[index].nome.substring(0, 1)),
            ),
          );
        },
      ),
    );
  }
}