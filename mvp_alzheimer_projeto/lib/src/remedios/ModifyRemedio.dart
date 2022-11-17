import 'package:projeto_estudo/src/remedios/ViewRemedioPage.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/remedios/text_box.dart';

import '../../AppController.dart';
import '../components/CustomButton.dart';
import '../controller/SessionController.dart';

class ModifyRemedio extends StatefulWidget {
  final Remedio _remedio;

  ModifyRemedio(this._remedio);

  @override
  State<StatefulWidget> createState() => _ModifyRemedio();
}

class _ModifyRemedio extends State<ModifyRemedio> {
   TextEditingController controllerNome = new TextEditingController();
   TextEditingController controllerDosagem = new TextEditingController();
   TextEditingController controllerObservacao = new TextEditingController();
  int? idRemedio = 0;
  TimeOfDay? controllerHora = AppController.instance.modificarRemedio.hora;
  bool confirmTime = true;
  @override

  @override
  Widget build(BuildContext context) {
    var args;
    if(ModalRoute.of(context)!.settings.arguments != null){
      args = ModalRoute.of(context)!.settings.arguments as Map<String,Remedio>;
      controllerNome.text= args["remedio"]?.nome;
      controllerDosagem.text=args["remedio"]?.dosagem.toString() ?? "";
      controllerObservacao.text=args["remedio"]?.observacao.toString()?? "";
      controllerHora = args["remedio"]?.hora;
    }

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
          Center(child: Text("${controllerHora?.hour}:${controllerHora?.minute}")),
          ElevatedButton(
            onPressed: () {
              showTimePicker(context: context, initialTime: controllerHora ?? TimeOfDay(hour: 1, minute: 1))
                  .then((value) {
                setState(() {
                  TimeOfDay verify = value!;
                  print("${verify.hour}:${verify.minute}");
                  args["remedio"].hora = TimeOfDay(hour: verify.hour, minute: verify.minute);
                  args["remedio"].dosagem = controllerDosagem.text;
                  args["remedio"].nome = controllerNome.text;
                  args["remedio"].observacao = controllerObservacao.text;
                  Navigator.of(context).pushNamed('/editarRemedio',arguments: {"remedio": args["remedio"] as Remedio});
                });
              });
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
            ),
            child: Text("Horario Remédio",
                style: TextStyle(color: Colors.black)),
          ),
          TextBox(
            controllerObservacao,
            "Observação",
          ),
          ElevatedButton(
            onPressed: () {
              String nome = controllerNome.text;
              String dosagem = controllerDosagem.text;
              String observacao = controllerObservacao.text;
              Remedio tempRem ;
              if (nome.isNotEmpty &&
                  dosagem.isNotEmpty &&
                  observacao.isNotEmpty &&
                  confirmTime) {
                AppController.instance.modifyAlarm(controllerHora!, nome,
                    observacao, idRemedio!);
                tempRem = new Remedio(
                    nome: nome,
                    dosagem: dosagem,
                    hora: controllerHora,
                    observacao: observacao,
                    idBanco: args["remedio"]?.idBanco
                );
                print(tempRem.observacao);
                SessionController.instance.editRemedy(
                    tempRem).then(
                        (value) => null
                );

                Future.delayed(const Duration(seconds: 1), () {
                  SessionController.instance.getRemedios().then((value) => Navigator.of(context).pushNamed('/remedioPage'));
                  setState(() {

                  });
                });
              }
            },
            style: ElevatedButton.styleFrom(primary: Colors.green),
            child: const Text("Salvar Remedio",
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
