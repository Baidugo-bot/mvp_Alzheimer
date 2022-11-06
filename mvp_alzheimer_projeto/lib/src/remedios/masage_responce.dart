import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

messageResponse(BuildContext context, String nome) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text("Mensagem Informativo...!"),
            content: Text(" O Remedio " + nome),
          ));
}
