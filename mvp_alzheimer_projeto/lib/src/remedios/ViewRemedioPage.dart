import 'package:projeto_estudo/src/remedios/RegisterRemedio.dart';
import 'package:projeto_estudo/src/remedios/ModifyRemedio.dart';
import 'package:projeto_estudo/src/remedios/masage_responce.dart';

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
      appBar: CustomAppBar.instance.getNamedDefault(context,"/",Text(" Remédio ",style: TextStyle(color: Colors.black),)),
      body: ListView.builder(
        itemCount: AppController.instance.remedio.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ModifyRemedio(AppController.instance.remedio[index])))
                  .then((newRemedio) {
                if (newRemedio != null) {
                  setState(() {
                    AppController.instance.remedio.removeAt(index);

                    AppController.instance.remedio.insert(index, newRemedio);

                    messageResponse(
                        context, newRemedio.nome + " foi modificado...!");
                  });
                }
              });
            },
            onLongPress: () {
              removeClient(context, AppController.instance.remedio[index]);
            },
            title: Text(AppController.instance.remedio[index].nome + " " + AppController.instance.remedio[index].dosagem),
            subtitle: Text(AppController.instance.remedio[index].hora),
            leading: CircleAvatar(
              child: Text(AppController.instance.remedio[index].nome.substring(0, 1)),
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
                AppController.instance.remedio.add(newRemedio);
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
                      AppController.instance.remedio.remove(remedio);
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Eliminar",
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
  var hora;

  Remedio({this.nome, this.dosagem, this.hora});
}
