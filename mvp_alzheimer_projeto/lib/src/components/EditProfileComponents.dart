
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
      widget.imageController =   FileImage(File(image!.path));
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: getImage,
      child: Container(
          child: Image(
            image: widget.imageController,
            height: 250,
          ),
      ),
    );
  }
}