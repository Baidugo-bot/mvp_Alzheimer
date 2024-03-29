import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
class MemoryModel{
  static MemoryModel instance = MemoryModel();

  List<Memory> memories = <Memory>[];

}

class Memory {
   Memory(  {Key? key, this.idBanco,required this.title, required this.date,required this.description,required this.identifier,required this.image,this.imgLink}) ;
   String title ;
   DateTime date;
   String description;
   int identifier;
   ImageProvider<Object> image;
   String? imgLink = "";
   int? idBanco;

  String getTitle(){
    return title;
  }

  String getDescription(){
    return description;
  }

  DateTime getDate(){
    return date;
  }

  String getConvertedDate(){
    return DateFormat('dd/MM/yyyy').format(date);
  }

  int getIdentifier(){
    return identifier;
  }

  void setIdentifier(int id){
    this.identifier = id;
  }

   ImageProvider<Object> getImage(){
     return image;
   }

  void changeMemory(Memory newMemory){
    this.title = newMemory.getTitle();
    this.date = newMemory.getDate();
    this.description = newMemory.getDescription();
    this.image = newMemory.getImage();
    this.imgLink = newMemory.imgLink;
  }




  // Image image = Image();


}