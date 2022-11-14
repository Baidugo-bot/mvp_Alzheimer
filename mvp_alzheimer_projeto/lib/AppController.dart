
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
  void setAlarm(TimeOfDay time, String nome){
    final cron = Cron();
    cron.schedule(Schedule.parse('*/1 */${time.minute} */${time.hour} * * *'), () async => {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: remedio.length,
              channelKey: 'key1',
              title:'${nome}',
              body: 'Lembra que voce tem alzheimeeeer.'
          )
      ),
      print(remedio.length),
    });
  }


  Future<String> getImage() async {
    ImagePicker picker = new ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    if(image!.path!=null){
      //print(image.path);
      return image.path;
    }
    return "none";
  }



}
