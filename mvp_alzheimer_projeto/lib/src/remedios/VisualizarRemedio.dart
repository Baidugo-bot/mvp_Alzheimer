import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import 'package:projeto_estudo/src/remedios/RegisterRemedio.dart';
import 'package:projeto_estudo/src/remedios/ViewRemedioPage.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/remedios/text_box.dart';

import '../../AppController.dart';
import '../components/CustomButton.dart';

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

  @override
  void initState() {
    Remedio c = widget._remedio;
    controllerNome = new TextEditingController(text: c.nome);
    controllerDosagem = new TextEditingController(text: c.dosagem);
    controllerObservacao = new TextEditingController(text: c.observacao);
    var horario =  '15:21';
    controllerHorario = new TextEditingController(text: horario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: CustomAppBar.instance.getNamedDefault(
          context,
          "/seeRemedioPaciente",
          Text(
            " Remédio ",
            style: TextStyle(color: Colors.black),
          )),
      body: Column(
        children: [
          TextBox(controllerNome, "Nome"),
          TextBox(controllerDosagem, "Dosagem"),
          TextBox(controllerHorario, "Hora"),
          TextBox(controllerObservacao, "Observação"),
        ],
      ),
    );
  }
}