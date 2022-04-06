import 'package:flutter/material.dart';

class EditMemoryView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Center(child: Text("Edit Memory")),
        actions: [
          InkWell(
              onTap: (){
                Navigator.of(context).pushNamed('/memories',arguments: {});
              },
              splashColor: Colors.blue,
              child: Icon(Icons.check)

          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            Container(height: 30,),
            Container(
              child: GestureDetector(
                onTap: (){
                  
                },
                child: Image(
                  image: AssetImage('assets/images/pelezin.jpg',),
                  height: 250,
                ),
              ),
            ),
            Container(height: 30,),
          Text(
              "Titulo"
            ),
            TextField(

            ),
            Text(
              "Descrição"
            ),
            TextField(

            ),
          ],

      ),
    );
  }
}
