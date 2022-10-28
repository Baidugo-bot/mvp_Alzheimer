import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../AppController.dart';
import '../models/FamilyModel.dart';

class SeeFamilyView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map<String,Family>;
    
    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: AppBar(
        
        
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
//botão volta menu principal
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/family');
              },
              child: Icon(
                Icons.keyboard_return,
                color: Colors.white,
                size: 40.0,
              ),
            ),
            Text(
              " Familiares",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.edit,size: 40.0,), onPressed: () {
                     Navigator.of(context).pushNamed('/editFamily',
                                    arguments: {
                                      "family": FamilyModel.instance.famili[args["family"]!.identifier]
                                    });
                  }),
                ]),
          ],
        ),
      ),





      
      body: Container(
        
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
          height: 1,
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
          decoration:
              BoxDecoration(border: Border.all(), color: Colors.lightBlue),
        ),
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 15,),
                  //Image(image: args["family"]!.getImage(),height: 200,),
                  Container(height: 10,),
                  Container(
                    width: 500,
                    child: Center(
                        child: BorderedText(
                          strokeColor: Colors.black,
                          strokeWidth: 2,
                          child: Text(
                              args["family"]!.getTitle().toUpperCase(),
                              style: TextStyle(fontSize: 22, color: Colors.white,)
                          ),
                        )
                    ),
                  ),
                  Container(
                    width: 500,
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,color: Colors.black45,
                          ),
                        ),
                    ),
                    child: Center(
                        child: BorderedText(
                          strokeColor: Colors.black,
                          strokeWidth: 2,

                          child: Text(
                              Jiffy(AppController.instance.now).EEEE.toString()+" "+args["family"]!.getDate().toString().substring(0,10),
                              style: TextStyle(fontSize: 25, color: Colors.white)
                          ),
                        )
                    ),
                  ),

                  Container(height: 30,),
                  Container(
                    height: 200,
                    width: 350,
                    
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(228, 241, 247, 1),
                      borderRadius: BorderRadius.only(
                        topLeft:Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft:Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),


                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
