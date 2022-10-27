import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/EditMemoryComponents.dart';
import 'package:projeto_estudo/src/controller/EditMemoryController.dart';

import '../components/FamilyComponents.dart';
import '../controller/EditFamilyController.dart';
import '../models/FamilyModel.dart';
class EditFamilyView extends StatefulWidget {
  const EditFamilyView({Key? key}) : super(key: key);

  @override
  EditFamilyViewState createState() => EditFamilyViewState();
}

class EditFamilyViewState extends State<EditFamilyView> {
  /*
  *  new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
  * */
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map<String,Family>;
    TextEditingController titleController = new TextEditingController();
    TextEditingController descController = new TextEditingController();
    DateTime dateController = DateTime.now() ;
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
                  IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                ]),
          ],
        ),


      ),
      
      body: Container(
        
        
        child: Column(
          children: [
            Container(
          height: 1,
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
          decoration:
              BoxDecoration(border: Border.all(), color: Colors.lightBlue),
        ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    width: 430,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2, color: Colors.grey),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      // child: Image(
                      //   //image: args["family"]!.getImage(),
                      //   height: 250,
                      // ),
                    ),
                  ),
                  Container(
                    height: 30,
                  ),
                  BorderedTextField(
                    title: 'Titulo:',
                    haveFrame: false,
                    myResult: titleController,

                  ),
                  // DateBorderedField(
                  //   onChangeFunction: (DateTime date){dateController = date;},
                  // ),
                  BorderedTextField(
                    title: "Anotacoes:",
                    haveFrame: true,
                    myResult: descController,
                  ),
                  Container(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // CustomButton(
                      //   title: "Salvar",
                      //   color: Colors.green,
                      //   response: (){
                      //     if(titleController.text=="" || descController.text==""){
                      //       print("Preencha");
                      //     }else{

                      //         EditFamilyController.instance.changeById(args["family"]!.getIdentifier(),
                      //             Family(
                      //                 title: titleController.text,
                      //                 date: dateController,
                      //                 description: descController.text,
                      //                 identifier: args["memory"]!.getIdentifier(),
                      //                 image: args["memory"]!.getImage(),
                      //             ));
                      //         Navigator.of(context).pushNamed('/memories', arguments: {});
                      //     }
                      //   },
                      // ),
                      Container(width: 10,),
                      // CustomButton(
                      //   title: "Apagar",
                      //   color: Colors.red,
                      //   response: (){
                      //     EditMemoryController.instance.excludeById(args["memory"]!.getIdentifier());
                      //     Navigator.of(context).pushNamed('/memories', arguments: {});
                      //   },
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
