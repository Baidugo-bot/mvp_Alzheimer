import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jiffy/jiffy.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';


class LocalizationConfigView extends StatefulWidget {
  const LocalizationConfigView({Key? key, }) : super(key: key);



  @override
  State<LocalizationConfigView> createState() => LocalizationConfigViewState();
}

class LocalizationConfigViewState extends State<LocalizationConfigView> {
  @override
  Widget build(BuildContext context) {



    String generateRandomString(int len) {
      var r = Random();
      return String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
    }


    if(AppController.instance.isCodeGenerated==false){
      AppController.instance.myCode;
    }
    return Scaffold(// map dos botoes
      backgroundColor: AppController.instance.mainColor,
      appBar: AppBar(
        backgroundColor: AppController.instance.mainColor,
        title: Center(child: Text("Local Configs ")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.camera_alt_outlined,
              size: 200 ,
            ),
            QrImage(
              data: ,
              version: QrVersions.auto,
              size: 200.0,
            ),
          ],
        ),
      ),

    );
  }



}
