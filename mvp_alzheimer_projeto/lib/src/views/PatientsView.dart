import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/CustomButton.dart';
import 'package:projeto_estudo/src/components/EditMemoryComponents.dart';

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

    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: AppController.instance.mainColor,
        automaticallyImplyLeading: false,
        title: Center(child: Text("Pacientes")),
      ),
      body: ListView.builder(
          itemCount: AppController.instance.memories.length,
          itemBuilder: (BuildContext ctx, int number){
        return Align(
          alignment: Alignment.center,
          child: Container(

            height: 100,
            margin: EdgeInsets.only(top: 22,bottom: 22),
            child: DefaultButton(
              circularBounds: true,
              color: Color.fromRGBO(228, 241, 247, 1),
              title: 'Paciente '+number.toString(),
              response: () { Navigator.of(context).pushNamed('/'); },
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
