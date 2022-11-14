import 'package:projeto_estudo/src/components/ProfileComponents.dart';
import 'package:projeto_estudo/src/remedios/ViewRemedioPage.dart';
import 'package:projeto_estudo/src/remedios/text_box.dart';
import 'package:projeto_estudo/src/remedios/circle_dat.dart';
import 'package:flutter/material.dart';
import '../../AppController.dart';
import '../components/AddMemoryComponents.dart';
import '../components/CustomButton.dart';

class RegisterRemedio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterRemedio();
}

class _RegisterRemedio extends State<RegisterRemedio> {
  late TextEditingController controllerNome;
  late TextEditingController controllerDosagem;
  late TextEditingController controllerObservacao;
  TimeOfDay controllerHora = TimeOfDay(hour: 0, minute: 00);

  @override
  void initState() {
    controllerNome = TextEditingController();
    controllerDosagem = TextEditingController();
    controllerObservacao = TextEditingController();
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
            ElevatedButton(onPressed: (){
              showTimePicker(context: context, initialTime: controllerHora).then((value) {
              setState(() {
                controllerHora = value!;
              });
              });
            },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,),
              child:   Text("Horario Remédio",
                style: TextStyle(color: Colors.black)),),
            TextBox(controllerObservacao, "Observação"),
            CustomButton(
              response: (){
                String nome = controllerNome.text;
                String dosagem = controllerDosagem.text;
                String observacao = controllerObservacao.text;

                if (nome.isNotEmpty &&
                    dosagem.isNotEmpty &&
                    observacao.isNotEmpty) {
                  Navigator.pop(
                      context,
                      Remedio(
                          nome: nome,
                          dosagem: dosagem,
                          hora: controllerHora,
                          observacao: observacao));
                }
              }, title: 'Salvar', color: Colors.green,
            ),
          ],
        ));
  }
}
