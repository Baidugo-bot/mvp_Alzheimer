
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/controller/ProfileController.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_estudo/src/models/FamilyModel.dart';
import 'package:projeto_estudo/src/models/MainProfileModel.dart';
import 'package:projeto_estudo/src/views/AddFamily.dart';

import 'src/remedios/ViewRemedioPage.dart';

class AppController extends ChangeNotifier{

  static AppController instance = AppController();
  List<Widget> memories = <Widget>[];
  List<Widget> family = <Widget>[];
  late Usuario user;
  List<Remedio> remedio = [];
  List<Paciente> pacientes = [];
  int rmdCriados = 0;

  DateTime now = DateTime.now().toUtc();
  int counter = 0;
  String lastImgURL = "none";
  Color mainColor = const Color.fromRGBO(121,188,218, 1) ;
  void addMemory() {
      memories.add(
        Text("")
      );
      counter++;
      notifyListeners();
  }
  void setAlarm(TimeOfDay time, String nome,String observacao,int id){
    var cron = Cron();
    bool validacao= false;

    AppController.instance.remedio.forEach((element) {validacao = (element.id==id)?true:false;return;});
    print(validacao);
      cron.schedule(Schedule.parse('*/1 */${time.minute} */${time.hour} * * *'), () async => {
        if(validarId(id)){
          AwesomeNotifications().createNotification(
              content: NotificationContent(

                  id: id,
                  channelKey: 'key1',
                  title:'${nome}',
                  body: '${observacao}'
              )
          ),
        }else{
          cron.close()
        }
      });
  }
  
  bool validarId(int id){
    bool validate = false;
    AppController.instance.remedio.forEach((element) {validate = (element.id==id)?true:false;return;});
    return validate;
  }


  Future<String> getImage() async {
    ImagePicker picker = new ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    if(image!.path!=null){
      return image.path;
    }
    return "none";
  }



}
