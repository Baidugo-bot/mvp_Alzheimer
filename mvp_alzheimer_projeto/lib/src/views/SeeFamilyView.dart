import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../AppController.dart';
import '../components/CustomButton.dart';
import '../models/FamilyModel.dart';

class SeeFamilyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, Family>;

    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: CustomAppBar.instance.actionDefault(
        context,
        "/family",
        Text(
          "Familiares",
          style: TextStyle(color: Colors.black),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/editFamily',
                    arguments: {"family": args["family"] as Family});
              },
              splashColor: Colors.grey.withAlpha(70),
              child: Icon(Icons.edit),
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 1,
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: AppController.instance.mainColor),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                  ),
                  Container(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(121, 188, 218, 1),
                    ),
                    width: 500,
                    height: 60,
                    child: Center(
                      child: Text(
                        args["family"]!.getDescription().toString(),
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(121, 188, 218, 1),
                    ),
                    width: 500,
                    height: 60,
                    child: Center(
                      child: Text(
                        args["family"]!.getTitle().toUpperCase(),
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(121, 188, 218, 1),
                      border: Border.all(),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(121, 188, 218, 1),
                    ),
                    width: 500,
                    height: 60,
                    child: Center(
                      child: Text(
                        args["family"]!.getConvertedDate().toString().substring(0, 10),
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(121, 188, 218, 1),
                    ),
                    width: 500,
                    height: 60,
                    child: Center(
                      child: Text(
                        args["family"]!.getTelephone().toString(),
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
