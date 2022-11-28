import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:projeto_estudo/src/controller/ProfileController.dart';
import 'package:projeto_estudo/src/models/FamilyModel.dart';
import 'package:projeto_estudo/src/models/MainProfileModel.dart';
import 'package:projeto_estudo/src/views/AddFamily.dart';
import 'src/remedios/ViewRemedioPage.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();
  List<Widget> memories = <Widget>[];
  List<Widget> family = <Widget>[];
  late Usuario user;
  List<Remedio> remedio = [];
  List<Paciente> pacientes = [];
  int rmdCriados = 0;
  late Remedio modificarRemedio ;
  bool notifyPermitted = false;

  DateTime now = DateTime.now().toUtc();
  int counter = 0;
  String lastImgURL = "none";
  Color mainColor = const Color.fromRGBO(121, 188, 218, 1);

  Future<void> requestNotifyPermission() async{

    PermissionStatus result;
    result = await Permission.notification.request();
    print(result);
    if(result.isGranted){
      AppController.instance.notifyPermitted = true;
    }else if(result.isPermanentlyDenied && result.isDenied){
      AppController.instance.notifyPermitted = false;
    }else{

    }
  }

  messageResponse(BuildContext context, String nome) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Informativo",textAlign: TextAlign.center,),
          content: Text(nome,textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.orange),),
        ));
  }

  void addMemory() {
    memories.add(Text(""));
    counter++;
    notifyListeners();
  }

  void setAlarm(TimeOfDay time, String nome, String observacao, int id) {
    print("Running!");
    var cron = Cron();
    bool validacao = false;
    validacao = validarId(id);
    if(validacao==false){
      print("Negado!");
      return;
    }
    print("Setado!");
    if (validarId(id) && teste())
    {
      AwesomeNotifications().createNotification(
          schedule: NotificationCalendar(hour: time.hour,minute: time.minute),
          content: NotificationContent(
              id: id,
              channelKey: 'key1',
              title: '${nome}',
              body: '${observacao}'));
    }
  }

  void modifyAlarm(TimeOfDay time, String nome, String observacao, int id) {
    var cron = Cron();
    bool validacao = false;
    validacao = validarId(id);
    if(validacao==false){
      return;
    }
    cron.schedule(
        Schedule.parse('*/7 ${time.minute} ${time.hour} * * *'),
        () async => {
              if (validarId(id))
                {
                  AwesomeNotifications().createNotification(
                      content: NotificationContent(
                          id: id,
                          channelKey: 'key1',
                          title: '${nome}',
                          body: '${observacao}')),

                }
              else
                {cron.close().then((value) => print("Remedio Recusado."))}
            });
  }

  bool validarId(int id) {
    bool validate = false;


    for (var i = 0; i < AppController.instance.remedio.length; i++) {
      validate = (AppController.instance.remedio[i].id == id) ? true : false;

      if(validate==true){
        print("VALIDADO!");
        break;
      }

    }

    return validate;
  }

  // Future<String> getImage() async {
  //   ImagePicker picker = new ImagePicker();
  //   var image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image!.path != null) {
  //     return image.path;
  //   }
  //   return "none";
  // }


  bool teste(){
    print("ALARMANDO!");
    return true;
  }


}
