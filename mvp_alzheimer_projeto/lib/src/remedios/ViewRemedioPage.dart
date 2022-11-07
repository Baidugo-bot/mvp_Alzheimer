import 'package:projeto_estudo/src/remedios/RegisterRemedio.dart';
import 'package:projeto_estudo/src/remedios/ModifyRemedio.dart';
import 'package:projeto_estudo/src/remedios/masage_responce.dart';

import 'package:flutter/material.dart';

class ViewRemedio extends StatefulWidget {
  final String _title;
  ViewRemedio(this._title);
  @override
  State<StatefulWidget> createState() => _ViewRemedio();
}

class _ViewRemedio extends State<ViewRemedio> {
  List<Remedio> remedio = [
    Remedio(nome: 'Paracetamol', dosagem: '2 pilulas', hora: '12:00'),
    Remedio(nome: 'Dipirona', dosagem: '1 pilula', hora: '20:00'),
    Remedio(nome: 'Ibuprofeno', dosagem: '1 pilula', hora: '08:30'),
    Remedio(nome: 'Ácido acetilsalicílico', dosagem: '15ml', hora: '15:20')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: ListView.builder(
        itemCount: remedio.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ModifyRemedio(remedio[index])))
                  .then((newRemedio) {
                if (newRemedio != null) {
                  setState(() {
                    remedio.removeAt(index);

                    remedio.insert(index, newRemedio);

                    messageResponse(
                        context, newRemedio.nome + " foi modificado...!");
                  });
                }
              });
            },
            onLongPress: () {
              removeClient(context, remedio[index]);
            },
            title: Text(remedio[index].nome + " " + remedio[index].dosagem),
            subtitle: Text(remedio[index].hora),
            leading: CircleAvatar(
              child: Text(remedio[index].nome.substring(0, 1)),
            ),
            trailing: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RegisterRemedio()))
              .then((newRemedio) {
            if (newRemedio != null) {
              setState(() {
                remedio.add(newRemedio);
                messageResponse(context, newRemedio.nome + " Foi Armazenado!");
              });
            }
          });
        },
        tooltip: "Add Remedio",
        child: Icon(Icons.add),
      ),
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
                      this.remedio.remove(remedio);
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