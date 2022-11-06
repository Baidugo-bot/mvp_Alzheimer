import 'package:projeto_estudo/src/remedios/ViewRemedioPage.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/remedios/text_box.dart';

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

  @override
  void initState() {
    Remedio c = widget._remedio;
    controllerNome = new TextEditingController(text: c.nome);
    controllerDosagem = new TextEditingController(text: c.dosagem);
    controllerHora = new TextEditingController(text: c.hora);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificar Remedio"),
      ),
      body: ListView(
        children: [
          TextBox(controllerNome, "Nome"),
          TextBox(controllerDosagem, "Dosagem"),
          TextBox(controllerHora, "Horario"),
          ElevatedButton(
              onPressed: () {
                String nome = controllerNome.text;
                String dosagem = controllerDosagem.text;
                String hora = controllerHora.text;

                if (nome.isNotEmpty && dosagem.isNotEmpty && hora.isNotEmpty) {
                  Navigator.pop(context,
                      new Remedio(nome: nome, dosagem: dosagem, hora: hora));
                }
              },
              child: Text("Salvar Remedio")),
        ],
      ),
    );
  }
}
