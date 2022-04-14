import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key}) : super(key: key);

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
          onPressed: () {},
          child: Text("Apagar"),
        )
    );
  }
}
