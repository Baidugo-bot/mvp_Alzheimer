

import 'package:flutter/material.dart';
class FamilyModel{
  static FamilyModel instance = FamilyModel();

  List<Family> famili = <Family>[];

}

class Family {
   Family(  {Key? key, required this.title, required this.date,required this.description,required this.identifier,required this.image,this.imgLink}) ;
   String title ;
   DateTime date;
  // int Telephone;
   String description;
   int identifier;
   ImageProvider<Object> image;
   String? imgLink = "";

  String getTitle(){
    return title;
  }

  String getDescription(){
    return description;
  }

  DateTime getDate(){
    return date;
  }
  //   int getTelephone(){
  //   return Telephone;
  // }

  int getIdentifier(){
    return identifier;
  }

  void setIdentifier(int id){
    this.identifier = id;
  }

   ImageProvider<Object> getImage(){
     return image;
   }

  void changeFamily(Family newFamily){
    this.title = newFamily.getTitle();
    this.date = newFamily.getDate();
   // this.Telephone = newFamily.getTelephone();
    this.description = newFamily.getDescription();
    this.image = newFamily.getImage();
    this.imgLink = newFamily.imgLink;
  }




  // Image image = Image();


}
// import 'package:flutter/material.dart';
// class FamilyModel{
//   static FamilyModel instance = FamilyModel();

//   List<Family> family = <Family>[];

// }

// class Family {
//    Family(  {Key? key, required this.title, required this.date, required this.Telephone, description, identifier, image}) ;
//    String title ;
//    DateTime date;
//    int Telephone;
//   //  String description;
//   //  int identifier;
//   //  ImageProvider<Object> image;

//   String getTitle(){
//     return title;
//   }

//   // String getDescription(){
//   //   return description;
//   // }

//   DateTime getDate(){
//     return date;
//   }

//   int getTelephone(){
//     return Telephone;
//   }

//   // int getIdentifier(){
//   //   return identifier;
//   // }

//   //  ImageProvider<Object> getImage(){
//   //    return image;
//   //  }

//   void changeFamily(Family newFamily){
//     this.title = newFamily.getTitle();
//     this.date = newFamily.getDate();
//     this.Telephone = newFamily.getTelephone();
//     //this.description = newFamily.getDescription();
//   }


//   // Image image = Image();


// }