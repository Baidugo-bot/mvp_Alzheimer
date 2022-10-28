
import 'package:flutter/material.dart';
class FamilyModel{
  static FamilyModel instance = FamilyModel();

  List<Family> familys = <Family>[];

}

class Family {
   Family(  {Key? key, required this.title, required this.date,required this.description,required this.identifier,required this.image}) ;
   String title ;
   DateTime date;
   String description;
   int identifier;
   ImageProvider<Object> image;

  String getTitle(){
    return title;
  }

  String getDescription(){
    return description;
  }

  DateTime getDate(){
    return date;
  }

  int getIdentifier(){
    return identifier;
  }

   ImageProvider<Object> getImage(){
     return image;
   }

  void changeFamily(Family newFamily){
    this.title = newFamily.getTitle();
    this.date = newFamily.getDate();
    this.description = newFamily.getDescription();
  }

  static void add(Text text) {}


  // Image image = Image();


}