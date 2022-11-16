import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import 'package:projeto_estudo/src/remedios/RegisterRemedio.dart';
import 'package:projeto_estudo/src/remedios/ViewRemedioPage.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/remedios/text_box.dart';

import '../../../AppController.dart';
import '../../components/CustomButton.dart';

class VisualizarRemedio extends StatefulWidget {
  final Remedio _remedio;
  VisualizarRemedio(this._remedio);
  @override
  State<StatefulWidget> createState() => _VisualizarRemedio();
}

class _VisualizarRemedio extends State<VisualizarRemedio> {
  late TextEditingController controllerNome;
  late TextEditingController controllerDosagem;
  late TextEditingController controllerObservacao;
  late TextEditingController controllerHorario;
  dynamic teste = TimeOfDay.now();
  String Hora = "";
  dynamic horas;
  dynamic teste2;

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  @override
  void initState() {
    Remedio c = widget._remedio;
    controllerNome = new TextEditingController(text: c.nome);
    controllerDosagem = new TextEditingController(text: c.dosagem);
    controllerObservacao = new TextEditingController(text: c.observacao);
    teste = c.hora;
    horas = DateTime(teste.hour, teste.minute);
    teste2 = DateFormat.jm();
    Hora = teste2.format(horas).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: CustomAppBar.instance.getNamedDefault(
          context,
          "/remedioPaciente",
          Text(
            " Remédio ",
            style: TextStyle(color: Colors.black),
          )),
      body: ListView(
        children: [
          TextBox(controllerNome, "Nome"),
          TextBox(controllerDosagem, "Dosagem"),
          Text(Hora,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                wordSpacing: 20,
                letterSpacing: 10,
              )),
          TextBox(
            controllerObservacao,
            "Observação",
          ),
        ],
      ),
    );
  }
}
