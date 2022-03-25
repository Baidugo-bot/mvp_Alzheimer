import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: Text(
          "Estou na Profile view"

      ),
    );
  }
}
