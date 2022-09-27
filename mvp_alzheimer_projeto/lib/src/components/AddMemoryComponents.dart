



import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class ImagePickerContainer extends StatefulWidget {
  ImageProvider<Object> imageController;
  ImagePickerContainer({Key? key,required this.imageController }) : super(key: key);

  @override
  ImagePickerContainerState createState() => ImagePickerContainerState();
}

class ImagePickerContainerState extends State<ImagePickerContainer> {
  @override

  Future getImage() async {
    ImagePicker picker = new ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if(image!.path!=null){
        widget.imageController =   FileImage(File(image!.path));
      }
      
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async {await getImage();},
      child: Container(
          child: Image(
            image: widget.imageController,
            height: 250,
          ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  Color color = Colors.green;
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
