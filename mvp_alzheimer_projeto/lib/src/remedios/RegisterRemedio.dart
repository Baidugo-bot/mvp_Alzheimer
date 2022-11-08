import 'package:projeto_estudo/src/remedios/ViewRemedioPage.dart';
import 'package:projeto_estudo/src/remedios/text_box.dart';
import 'package:flutter/material.dart';

import '../../AppController.dart';
import '../components/CustomButton.dart';

class RegisterRemedio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterRemedio();
}

class _RegisterRemedio extends State<RegisterRemedio> {
  late TextEditingController controllerNome;
  late TextEditingController controllerDosagem;
  late TextEditingController controllerHora;

  @override
  void initState() {
    controllerNome = new TextEditingController();
    controllerDosagem = new TextEditingController();
    controllerHora = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
        appBar: CustomAppBar.instance.getNamedDefault(context,"/",Text(" Remédio ")),
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

                  if (nome.isNotEmpty &&
                      dosagem.isNotEmpty &&
                      hora.isNotEmpty) {
                    Navigator.pop(context,
                        new Remedio(nome: nome, dosagem: dosagem, hora: hora));
                  }
                },
              style: ElevatedButton.styleFrom(primary: Colors.grey),
                child: const Text("Salvar Remedio",style: TextStyle(color: Colors.black)),),
          ],
        ));
  }
}
