import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/views/AddMemoryView.dart';
import 'package:projeto_estudo/src/views/EditProfileView.dart';

class ProfileView extends StatelessWidget {
  final String title;
  const ProfileView({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     theme: ThemeData.dark();
    automaticamenteImplyLeading:
    false;
    int counter = 0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    // TODO: implement createState
    return HomePageStates();
  }
}

class HomePageStates extends State<HomePage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Perfil"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => EditProfile()));
            },
            child: Icon(
              Icons.edit,
              color: Colors.red,
              size: 30.0,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
              child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/pelezin.jpg'),
            radius: 100,
          )),
          Text(
            "Pele",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Nascimento: 05/10/2001",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Idade: 35 anos",
            style: TextStyle(fontSize: 20),
          ),
          Container(
            height: 80,
          ),
        ],
      ),
      backgroundColor: Colors.lightBlue[100],
    );
  }
}
