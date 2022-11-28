
import 'package:flutter/material.dart';
import 'dart:io';


// class ImagePickerContainer extends StatefulWidget {
//   String imageLink;
//   VoidCallback  response = (){};
//   ImagePickerContainer({Key? key,required this.imageLink, required this.response, imageController }) : super(key: key);
//
//   @override
//   ImagePickerContainerState createState() => ImagePickerContainerState();
// }
//
// class ImagePickerContainerState extends State<ImagePickerContainer> {
//   @override
//
//    Future<String> getImage() async {
//     ImagePicker picker = new ImagePicker();
//     var image = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//
//     });
//     if(image!.path!=null){
//       return image.path;
//     }
//     return "none";
//   }
//
//   Widget build(BuildContext context) {
//
//         return GestureDetector(
//           onTap: widget.response,
//           child: Container(
//             child: Image(
//               image:
//               (widget.imageLink!="assets/images/imagemEscolha.png")?FileImage(File(widget.imageLink)):Image.asset("assets/images/imagemEscolha.png").image,
//               height: 250,
//             ),
//           ),
//         );
//   }
// }

class CustomButton extends StatefulWidget {
  Color color = Colors.lightBlue;
  VoidCallback  response = (){};
  String title="";
  CustomButton({Key? key, required this.color, required this.response,required this.title}) : super(key: key);

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        height: 50,
        child: ElevatedButton(
          style: TextButton.styleFrom(
          backgroundColor: widget.color,

          ),
          onPressed: widget.response,
          child: Text(widget.title),
        )
    );
  }
}
