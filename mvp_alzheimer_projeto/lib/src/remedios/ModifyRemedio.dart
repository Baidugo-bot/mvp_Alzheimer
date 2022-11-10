import 'package:projeto_estudo/src/remedios/ViewRemedioPage.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/remedios/text_box.dart';

import '../../AppController.dart';
import '../components/CustomButton.dart';

class ModifyRemedio extends StatefulWidget {
  final Remedio _remedio;
  ModifyRemedio(this._remedio);
  @override
  State<StatefulWidget> createState() => _ModifyRemedio();
}

class _ModifyRemedio extends State<ModifyRemedio> {
  late TextEditingController controllerNome;
  late TextEditingController controllerDosagem;
  late TextEditingController controllerHora;
  late TextEditingController controllerData;
  late TextEditingController controllerObservacao;

  @override
  void initState() {
    Remedio c = widget._remedio;
    controllerNome = new TextEditingController(text: c.nome);
    controllerDosagem = new TextEditingController(text: c.dosagem);
    controllerHora = new TextEditingController(text: c.hora);
    controllerData = new TextEditingController(text: c.data);
    controllerObservacao = new TextEditingController(text: c.observacao);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: CustomAppBar.instance.getNamedDefault(
          context,
          "/remedioPage",
          Text(
            " Remédio ",
            style: TextStyle(color: Colors.black),
          )),
      body: ListView(
        children: [
          TextBox(controllerNome, "Nome"),
          TextBox(controllerDosagem, "Dosagem"),
          TextBox(controllerHora, "Horario"),
          TextBox(
            controllerData,
            "Quantidade de Dias",
          ),
          TextBox(
            controllerObservacao,
            "Observação",
          ),
          ElevatedButton(
            onPressed: () {
              String nome = controllerNome.text;
              String dosagem = controllerDosagem.text;
              String hora = controllerHora.text;
              String data = controllerData.text;
              String observacao = controllerObservacao.text;

              if (nome.isNotEmpty &&
                  dosagem.isNotEmpty &&
                  hora.isNotEmpty &&
                  data.isNotEmpty &&
                  observacao.isNotEmpty) {
                Navigator.pop(
                    context,
                    new Remedio(
                        nome: nome,
                        dosagem: dosagem,
                        hora: hora,
                        data: data,
                        observacao: observacao));
              }
            },
            style: ElevatedButton.styleFrom(primary: Colors.grey),
            child: const Text("Salvar Remedio",
                style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
