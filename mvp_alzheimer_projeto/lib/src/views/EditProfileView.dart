import 'package:flutter/material.dart';

final TextEditingController _controladorNome = TextEditingController();
final TextEditingController _controladorDataNaci = TextEditingController();
final TextEditingController _controladorIdade = TextEditingController();

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Pagina "),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[],
        ),
      ),
    );
  }
}

class Produto {
  final String nome;
  final String dataNaci;
  final String idade;

  Produto(
    this.nome,
    this.dataNaci,
    this.idade,
  );
  String toString() {
    return 'Produto{nome: $nome, dataNaci: $dataNaci, idade: $idade}';
  }
}
