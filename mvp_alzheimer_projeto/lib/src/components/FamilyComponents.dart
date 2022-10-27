import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:date_field/date_field.dart';
import 'package:image_picker/image_picker.dart';
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
  Function(DateTime) onChangeFunction = (DateTime date) {};
  DateBorderedField({Key? key, required this.onChangeFunction})
      : super(key: key);

  @override
  DateBorderedFieldState createState() => DateBorderedFieldState();
}

class DateBorderedFieldState extends State<DateBorderedField> {
  @override
  Widget build(BuildContext context) {
    DateTime holderDate = DateTime.now();

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
        ),
        color: Colors.lightBlue,
        borderRadius: BorderRadius.only(
          
        ),
      ),
      height: 60,
      alignment: Alignment.bottomCenter,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          BorderedText(
            strokeColor: Colors.white,
            strokeWidth: 0,
            child: Text(
              "  Data:",
              style: TextStyle(fontSize: 20, color: Colors.black ,fontFamily: "Gidugu-Regular"),
            ),
          ),
          Container(
            width: 200,
            child: DateTimeFormField(
              onDateSelected: (DateTime date) {
                widget.onChangeFunction(date);
              },
              mode: DateTimeFieldPickerMode.date,
              initialDate: holderDate,
              dateTextStyle:
                  TextStyle(color: Colors.black, fontFamily: "Gidugu-Regular"),
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
    child:
    const Text(
      "FlutterBeads",
      style: TextStyle(fontSize: 34.0),
    );
  }
}
