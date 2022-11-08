import 'package:flutter/material.dart';

import '../models/PofileModel.dart';

class ProfileController extends ChangeNotifier {
  static ProfileController instance = ProfileController();

  String nome = "";
  DateTime dataNasc = DateTime.now();
  ImageProvider<Object> image = AssetImage('assets/images/pelezin.jpg');
  ImageProvider<Object> imagemTemporaria =
      AssetImage('assets/images/pelezin.jpg');

  final now = DateTime.now();
//  void excludeById(int identifier){
//     ProfileModel.instance.profile.removeAt(identifier);
//     int memCount = 0;
//     ProfileModel.instance.profile.forEach((element) {
//       element.setIdentifier(memCount);
//       memCount++;
//     });
//   }

  void changeById(int identifier, Profile newProfile){
    ProfileModel.instance.perfil.forEach((e) {
      print(newProfile.getImage().toString()+" - "+newProfile.imgLink.toString());
      if(e.identifier==identifier){
        e.changeProfile(newProfile);
      }
    });
  }
}
