import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:projeto_estudo/src/components/ProfileComponents.dart';
import 'package:projeto_estudo/src/controller/SessionController.dart';
import 'package:projeto_estudo/src/remedios/ViewRemedioPage.dart';
import 'package:projeto_estudo/src/remedios/text_box.dart';
import 'package:flutter/material.dart';
import '../../AppController.dart';
import '../components/AddMemoryComponents.dart';
import '../components/CustomButton.dart';
import 'package:cron/cron.dart';

class RegisterRemedio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterRemedio();
}

class _RegisterRemedio extends State<RegisterRemedio> {
  late TextEditingController controllerNome;
  late TextEditingController controllerDosagem;
  late TextEditingController controllerObservacao;
  bool isReady = true;
  TimeOfDay controllerHora =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  bool confirmTime = false;

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextBox(controllerNome, "Nome"),
              TextBox(controllerDosagem, "Dosagem"),
              Text("${controllerHora.hour}:${controllerHora.minute}"),
              ElevatedButton(
                onPressed: () {
                  confirmTime = true;
                  showTimePicker(context: context, initialTime: controllerHora)
                      .then((value) {
                    setState(() {
                      TimeOfDay verify = value!;
                      print("${verify.hour}:${verify.minute}");
                      controllerHora = verify;
                    });
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                ),
                child: Text("Horario Remédio",
                    style: TextStyle(color: Colors.black)),
              ),
              TextBox(controllerObservacao, "Observação"),
              CustomButton(
                response: () {

                  String nome = controllerNome.text;
                  String dosagem = controllerDosagem.text;
                  String observacao = controllerObservacao.text;
                  Remedio usedRemedio ;
                  if (nome.isNotEmpty &&
                      dosagem.isNotEmpty &&
                      observacao.isNotEmpty &&
                      confirmTime) {
                    Remedio tempRem = Remedio(
                      nome: nome,
                      dosagem: dosagem,
                      hora: controllerHora,
                      observacao: observacao,
                      id: AppController.instance.rmdCriados,
                    );
                    print("REgistrando rem ${isReady}");
                    // AppController.instance.setAlarm(controllerHora, nome,
                    //     observacao, AppController.instance.rmdCriados!);
                    //SessionController.instance.registerRemedy(tempRem).then((value) => SessionController.instance.getRemedios().then((value) => SessionController.instance.getRemedios().then((value) => Navigator.of(context).pushNamed('/remedioPage'))));
                    SessionController.instance.registerRemedy(tempRem).then((value) => null);
                    //AppController.instance.remedio.add(tempRem);
                    Future.delayed(const Duration(seconds: 1), () {
                      AppController.instance.messageResponse(context, "Remedio registrado!");
                      SessionController.instance.getRemedios().then((value) =>  Navigator.of(context).pushNamed('/remedioPage', arguments: {}));
                      setState(() {
                      });
                    });
                    AppController.instance.rmdCriados++;


                  }
                },
                title: 'Salvar',
                color: Colors.green,
              ),
            ],
          ),
        ));
  }
}
