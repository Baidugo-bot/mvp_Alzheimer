import 'package:projeto_estudo/src/controller/SessionController.dart';
import 'package:projeto_estudo/src/remedios/RegisterRemedio.dart';
import 'package:projeto_estudo/src/remedios/ModifyRemedio.dart';
import 'package:projeto_estudo/src/remedios/masage_responce.dart';
import 'package:projeto_estudo/src/controller/PacienteController.dart';
import 'package:flutter/material.dart';
import '../../AppController.dart';
import '../components/CustomButton.dart';

class ViewRemedio extends StatefulWidget {
  final String _title;

  ViewRemedio(this._title);

  @override
  State<StatefulWidget> createState() => _ViewRemedio();
}

class _ViewRemedio extends State<ViewRemedio> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: CustomAppBar.instance.getNamedDefault(
          context,
          "/",
          Text(
            " Remédio ",
            style: TextStyle(color: Colors.black),
          )),
      body: ListView.builder(
        itemCount: AppController.instance.remedio.length,
        itemBuilder: (context, index) {

          return ListTile(
            onTap: () {
              AppController.instance.modificarRemedio = AppController.instance.remedio[index];
              Navigator.of(context).pushNamed('/editarRemedio',arguments: {"remedio": AppController.instance.remedio[index]});
            },
            onLongPress: () {
              removeClient(context, AppController.instance.remedio[index]);
            },
            title: Text(AppController.instance.remedio[index].nome +
                " " +
                AppController.instance.remedio[index].dosagem.toString()),
            subtitle: Text(AppController.instance.remedio[index].hora
                .toString()
                .substring(10, 15)),
            leading: CircleAvatar(
              child: Text(
                  AppController.instance.remedio[index].nome.substring(0, 1)),
            ),
            trailing: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RegisterRemedio()))
              .then((newRemedio) {
            if (newRemedio != null) {
              setState(() {
                print(newRemedio.hora.toString());
                messageResponse(context, newRemedio.nome + " Foi Armazenado!");
              });
            }
          });
        },
        tooltip: "Add Remedio",
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  removeClient(BuildContext context, Remedio remedio) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Excluir Remedio"),
              content:
                  Text("Tem certeza que quer excluir " + remedio.nome + "?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      SessionController.instance.removeRemedy(remedio.idBanco ??-1).then((value) => null);
                      Future.delayed(const Duration(seconds: 1), () {
                        SessionController.instance.getRemedios().then((value) => Navigator.of(context).pushNamed('/remedioPage'));
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

class Remedio {
  var nome;
  var dosagem;
  TimeOfDay? hora;
  var data;
  String? observacao;
  var id = 0;
  int? idBanco;

  Remedio({
    this.nome,
    this.dosagem,
    this.hora,
    this.data,
    this.observacao,
    this.id = 0,
    this.idBanco
  });
}
