import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/CustomButton.dart';
import 'package:projeto_estudo/src/components/EditMemoryComponents.dart';
import 'package:projeto_estudo/src/controller/ProfileController.dart';
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

    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
     appBar: CustomAppBar.instance.appSemVolta(context, "/login", Text("Pacientes",style: TextStyle(color: Colors.black),),
         IconButton(
           onPressed: () {
             Navigator.of(context).pushNamed('/login');
           },
           color: Colors.redAccent,
           icon: Icon(
             Icons.exit_to_app,
           ),
           iconSize: 30.0,
         )
      ),
      body: ListTileTheme(
        tileColor: Color.fromRGBO(184, 219, 232, 1.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
          side: BorderSide(
            width: 1
          )
        ),

        child: ListView.builder(
            itemCount: AppController.instance.pacientes.length,
            itemBuilder: (BuildContext ctx, int number){
              Paciente actualPat = AppController.instance.pacientes[number];
          return Container(
            margin: EdgeInsets.all(10),
            child: InkWell(
              child: ListTile(

                onTap: () {
                  SessionController.instance.pacienteID = AppController.instance.pacientes[number].id;
                  print(AppController.instance.pacientes[number].anotacoes);
                  ProfileController.instance.updateProfile(AppController.instance.pacientes[number]); //if not relogging, once relog not reset check it
                  Navigator.of(context).pushNamed('/');
                },
                onLongPress: (){
                  removeClient(context,actualPat );
                },

                title: Text(
                    actualPat.nome,
                  style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                    "Doença: "+actualPat.doenca,
                  style: TextStyle(color: Colors.black,fontSize: 18),
                ),
                trailing: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                ),
            ),
          );
        }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
        onPressed: () { Navigator.of(context).pushNamed('/registerPatient'); },

      ),
    );
  }


  removeClient(BuildContext context, Paciente pac) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Excluir Paciente"),
          content:
          Text("Tem certeza que quer excluir o paciente " + pac.nome + "?"),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  SessionController.instance.removePatient(pac.id).then((value) => {});
                  Future.delayed(const Duration(seconds: 2), () {
                    AppController.instance.messageResponse(context, "Paciente deletado!");
                    SessionController.instance.getPatients().then((value) =>  Navigator.of(context).pushNamed('/patients', arguments: {}));
                    setState(() {

                    });
                  });
                });
              },
              child: Text(
                "Excluir",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancelar",
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ));
  }
}
