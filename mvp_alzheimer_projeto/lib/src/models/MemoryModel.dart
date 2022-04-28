import 'dart:ui';
import 'package:flutter/material.dart';
class MemoryModel{
  static MemoryModel instance = MemoryModel();

  List<Memory> memories = <Memory>[];

}

class Memory {
   Memory(  {Key? key, required this.title, required this.date,required this.description,required this.identifier}) ;
   String title ;
   DateTime date;
   String description;
   int identifier;

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

  void changeMemory(Memory newMemory){
    this.title = newMemory.getDescription();
    this.date = newMemory.getDate();
    this.description = newMemory.getDescription();
  }


  // Image image = Image();


}