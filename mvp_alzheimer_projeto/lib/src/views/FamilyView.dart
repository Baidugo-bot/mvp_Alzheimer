import 'package:flutter/material.dart';

class FamilyView extends StatelessWidget {
  String nome = "";
  int data = 0;
  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;
    return Tela();
  }
}

class Tela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
//botão volta menu principal
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Icon(
                Icons.keyboard_return,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 50.0,
              ),
            ),
            Text(
              " Familiares",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
//botão editar perfil
            // InkWell(
            //   onTap: () {
            //     Navigator.pushNamed(context, '/addFamily');
            //   },
            //   child: Icon(
            //     Icons.plus_one,
            //     color: Color.fromARGB(255, 255, 255, 255),
            //     size: 50.0,
            //   ),
            // ),
//botao pesuisar
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.search), onPressed: () {}),
                ]),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          TopBar(),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 50,
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white),
            height: MediaQuery.of(context).size.height - 99,
            child: Column(
              children: <Widget>[
                // Padding(
                //   padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     // children: <Widget>[
                //     //   Text(
                //     //     "favoritos",
                //     //     style: TextStyle(color: Colors.black),
                //     //   ),
                //     //   IconButton(
                //     //     icon: Icon(
                //     //       Icons.more_vert,
                //     //       color: Colors.black,
                //     //     ),
                //     //     onPressed: () {},
                //     //   ),
                //     // ],
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(left: 20, right: 20),
                //   child: Container(
                //     height: 60,
                //     child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: 10,
                //       itemBuilder: (BuildContext context, index) {
                //         return Container(
                //           child: CircleAvatar(
                //             radius: 35,
                //             backgroundColor: Colors.red,
                //             child: CircleAvatar(
                //               backgroundColor: Colors.white,
                //               radius: 28,
                //               backgroundImage: NetworkImage(
                //                   "https://loremflickr.com/320/32$index"),
                //             ),
                //           ),
                //         );
                //       },
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 150, right: 5, left: 5, bottom: 10),
          child: Container(
            height: MediaQuery.of(context).size.height - 240,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              "https://loremflickr.com/320/32$index"),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Nome",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Endereço da pessoa que esta nessa aba do perfel",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                  
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
