
import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/controller/ProfileController.dart';
import 'package:image_picker/image_picker.dart';

class AppController extends ChangeNotifier{
  static AppController instance = AppController();
  List<Widget> memories = <Widget>[];
  DateTime now = DateTime.now().toUtc();
  int counter = 0;
  String lastImgURL = "none";
  Color mainColor = Color.fromRGBO(121,188,218, 1) ;
  void addMemory() {
      memories.add(
        Text("")
      );
      counter++;
      notifyListeners();
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