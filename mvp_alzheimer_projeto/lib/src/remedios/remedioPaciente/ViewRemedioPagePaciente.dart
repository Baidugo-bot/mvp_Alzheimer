import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/remedios/ViewRemedioPage.dart';

import 'package:projeto_estudo/src/remedios/RegisterRemedio.dart';
import 'package:projeto_estudo/src/remedios/remedioPaciente/RemedioPagePaciente.dart';
import 'package:projeto_estudo/src/remedios/masage_responce.dart';

import '../../../AppController.dart';
import '../../components/CustomButton.dart';

class ViewRemedioPaciente extends StatefulWidget {
  final String _title;
  ViewRemedioPaciente(this._title);
  @override
  State<StatefulWidget> createState() => _ViewRemedioPaciente();
}

class _ViewRemedioPaciente extends State<ViewRemedioPaciente> {
  @override
  Widget build(BuildContext context) {
    AppController.instance.remedio.map((e) => print(e));
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => VisualizarRemedio(
                          AppController.instance.remedio[index])));
            },
            title: Text(AppController.instance.remedio[index].nome +
                " " +
                AppController.instance.remedio[index].dosagem),
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
