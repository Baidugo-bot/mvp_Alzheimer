import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/controller/LocalizationController.dart';

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

    print(LocalizationController.instance.myCode);

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
            (LocalizationController.instance.isTargetCodeGenerated)?Column(
                children: [
                  Text("Codigo ja carregado: "+LocalizationController.instance.targetCode.toString()),
                  Text("Ler novo codigo?"),
                  ElevatedButton(
                    child: Text("Registrar codigo"),
                    onPressed: (){
                      setState(() {
                        LocalizationController.instance.tryFindTargetCode();
                      });
                    },
                  ),
                ],
            )
                :
            Column(
              children: [
                Text("Codigo alvo nao registrado!",style: TextStyle(color: Colors.red),),
                ElevatedButton(
                  child: Text("Registrar codigo"),
                  onPressed: (){
                    setState(() {
                      LocalizationController.instance.tryFindTargetCode();
                      setState(() {

                      });
                    });
                  },
                ),
              ],
            ),

            (LocalizationController.instance.isCodeGenerated)?QrImage(data: LocalizationController.instance.myCode,size: 200,semanticsLabel: "teste",):Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Token pessoal nao registrado",style: TextStyle(color: Colors.red),),
                ElevatedButton(
                  child: Text("Registrar Token"),
                  onPressed: (){
                    LocalizationController.instance.generateCode();
                    setState(() {

                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }



}
