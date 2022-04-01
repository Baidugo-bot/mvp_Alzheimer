import 'package:flutter/material.dart';

class SeeMemoryView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text("Ver memoria"),
        actions: [
          InkWell(
              onTap: (){
                Navigator.of(context).pushNamed('/editMemory');
              },
              splashColor: Colors.blue,
              child: Icon(Icons.edit)

          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.black26,
                child: Column(
                  children: [
                    Container(height: 30,),
                    Image(image: AssetImage('assets/images/pelezin.jpg'),),
                    Text("Titulo teste", style: TextStyle(fontSize: 40, color: Colors.black)),
                  ],
                ),
              ),


              Container(
                color: Colors.black,
                child: Text(" Na Lei nº 14.316, de 29 de março de 2022, publicada no Diário Oficial da União de 30 de março de 2022, Seção 1, página 1, nas assinaturas,leia-se:Jair Messias Bolsonaro, Anderson Gustavo Torres, João Inácio Ribeiro Roma Neto e Damares Regina Alves..",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
