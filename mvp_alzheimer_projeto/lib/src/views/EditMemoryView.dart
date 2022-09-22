import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/EditMemoryComponents.dart';
import 'package:projeto_estudo/src/controller/EditMemoryController.dart';

import '../components/AddMemoryComponents.dart';
import '../models/MemoryModel.dart';
class EditMemoryView extends StatefulWidget {
  const EditMemoryView({Key? key}) : super(key: key);

  @override
  EditMemoryViewState createState() => EditMemoryViewState();
}

class EditMemoryViewState extends State<EditMemoryView> {
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
    var args = ModalRoute.of(context)!.settings.arguments as Map<String,Memory>;
    TextEditingController titleController = new TextEditingController();
    TextEditingController descController = new TextEditingController();
    DateTime dateController = DateTime.now() ;
    return Scaffold(

      backgroundColor: AppController.instance.mainColor,
      appBar: AppBar(
        backgroundColor: AppController.instance.mainColor,
        title: Center(child: Text("Edit Memory")),


      ),
      body: SingleChildScrollView(
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
                child: Image(
                  image: args["memory"]!.getImage(),
                  height: 250,
                ),
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
            DateBorderedField(
              onChangeFunction: (DateTime date){dateController = date;},
            ),
            BorderedTextField(
              title: "Anotacoes:",
              haveFrame: true,
              myResult: descController,
            ),
            Container(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  title: "Salvar",
                  color: Colors.green,
                  response: (){
                    if(titleController.text=="" || descController.text==""){
                      print("Preencha");
                    }else{

                        EditMemoryController.instance.changeById(args["memory"]!.getIdentifier(),
                            Memory(
                                title: titleController.text,
                                date: dateController,
                                description: descController.text,
                                identifier: args["memory"]!.getIdentifier(),
                                image: args["memory"]!.getImage(),
                            ));
                        Navigator.of(context).pushNamed('/memories', arguments: {});
                    }
                  },
                ),
                Container(width: 10,),
                CustomButton(
                  title: "Apagar",
                  color: Colors.red,
                  response: (){
                    EditMemoryController.instance.excludeById(args["memory"]!.getIdentifier());
                    Navigator.of(context).pushNamed('/memories', arguments: {});
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
