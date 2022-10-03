
import 'package:flutter/material.dart';
class FamilyModel{
  static FamilyModel instance = FamilyModel();

  List<Family> family = <Family>[];

}

class Family {
   Family(  {Key? key, required this.title, required this.date, required this.Telephone}) ;
   String title ;
   DateTime date;
   int Telephone;
  //  String description;
  //  int identifier;
  //  ImageProvider<Object> image;

  String getTitle(){
    return title;
  }

  // String getDescription(){
  //   return description;
  // }

  DateTime getDate(){
    return date;
  }

  int getTelephone(){
    return Telephone;
  }

  // int getIdentifier(){
  //   return identifier;
  // }

  //  ImageProvider<Object> getImage(){
  //    return image;
  //  }

  void changeMemory(Family newFamily){
    this.title = newFamily.getTitle();
    this.date = newFamily.getDate();
    this.Telephone = newFamily.getTelephone();
    //this.description = newFamily.getDescription();
  }


  // Image image = Image();


}