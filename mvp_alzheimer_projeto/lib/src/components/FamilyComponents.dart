import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:date_field/date_field.dart';
import 'package:projeto_estudo/src/controller/FamilyController.dart';

// class ImagePickerContainer extends StatefulWidget {
//   ImageProvider<Object> imageController;
//   ImagePickerContainer({Key? key, required this.imageController})
//       : super(key: key);

//   @override
//   ImagePickerContainerState createState() => ImagePickerContainerState();
// }

// class ImagePickerContainerState extends State<ImagePickerContainer> {
//   @override
//   Future getImage() async {
//     ImagePicker picker = new ImagePicker();
//     var image = await picker.pickImage(source: ImageSource.gallery);
//     FamilyController.instance.imagemTemporaria = FileImage(File(image!.path));
//     setState(() {
//       widget.imageController = FileImage(File(image!.path));
//     });
//   }

//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         await getImage();
//       },
//       child: Container(
//         child: Image(
//           image: widget.imageController,
//           height: 250,
//         ),
//       ),
//     );
//   }
// }

class DateBorderedField extends StatefulWidget {
  Function(DateTime) onChangeFunction = (DateTime date){};
  DateTime lastDate = DateTime.now();
  DateTime initialValue = DateTime.now();
  DateBorderedField({Key? key, required this.onChangeFunction, required this.lastDate,required this.initialValue}) : super(key: key);

  @override
  DateBorderedFieldState createState() => DateBorderedFieldState();
}

class DateBorderedFieldState extends State<DateBorderedField> {
  @override
  Widget build(BuildContext context) {
    DateTime holderDate = DateTime.now();

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2, color: Colors.black),
        ),
      ),
      child: Row(
        children: [
          BorderedText(
            strokeColor: Colors.black26,
            strokeWidth: 2,
            child: Text("Data:",style: TextStyle(fontSize: 20,fontFamily: "Gidugu-Regular"),),
          ),
          Container(

            width: 200,
            child: DateTimeFormField(

              onDateSelected: (DateTime date){
                widget.onChangeFunction(date);
              },
              lastDate: DateTime.now(),
              initialValue: widget.initialValue,
              mode: DateTimeFieldPickerMode.date,
              dateTextStyle: TextStyle(color: Colors.black,fontFamily: "Gidugu-Regular"),
              decoration: InputDecoration(
                  border: InputBorder.none
              ),
            ),
          ),
        ],
      ),
    );
  }
}
