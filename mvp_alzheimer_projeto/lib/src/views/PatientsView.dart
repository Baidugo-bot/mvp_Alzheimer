import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/CustomButton.dart';
import 'package:projeto_estudo/src/components/EditMemoryComponents.dart';
import 'package:projeto_estudo/src/controller/SessionController.dart';
import 'package:projeto_estudo/src/models/MainProfileModel.dart';

import '../components/AddMemoryComponents.dart';
import '../models/MemoryModel.dart';

class PatientsView extends StatefulWidget {
  const PatientsView({Key? key}) : super(key: key);

  @override
  PatientsViewState createState() => PatientsViewState();
}

class PatientsViewState extends State<PatientsView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
     SessionController.instance.getPatients().then((value) => setState((){}));
    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: AppController.instance.mainColor,
        automaticallyImplyLeading: false,
        title: Center(child: Text("Pacientes")),
      ),
      body: ListView.builder(
          itemCount: AppController.instance.pacientes.length,
          itemBuilder: (BuildContext ctx, int number){
            Paciente actualPat = AppController.instance.pacientes[number];
        return Align(
          alignment: Alignment.center,
          child: Container(

            height: 100,
            margin: EdgeInsets.only(top: 22,bottom: 22),
            child: DefaultButton(
              circularBounds: true,
              color: Color.fromRGBO(228, 241, 247, 1),
              title: actualPat.nome,
              response: () {
                SessionController.instance.pacienteID = AppController.instance.pacientes[number].id;
                Navigator.of(context).pushNamed('/');
                },
              enableBounds: true,
              bounds: {340.0:50.0},),
          ),
        );
      }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () { Navigator.of(context).pushNamed('/registerPatient'); },

      ),
    );
  }
}
