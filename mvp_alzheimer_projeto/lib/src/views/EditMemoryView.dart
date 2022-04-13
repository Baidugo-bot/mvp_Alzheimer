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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              Container(height: 30,),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                width: 430,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 2,color: Colors.grey
                    ),
                  ),
                ),
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
              TextField(
                decoration: InputDecoration(
                  hintText: "Thats my hint:"
                ),
              ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Thats my hint:"
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Thats my hint:"
              ),
            ),
            ],

        ),
      ),
    );
  }
}
