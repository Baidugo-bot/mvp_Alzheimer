import 'dart:ui';
import 'package:flutter/material.dart';
class MemoryModel{
  static MemoryModel instance = MemoryModel();

  List<Memory> memories = <Memory>[];
}

class Memory {
  const Memory({Key? key, required this.title, required this.date,required this.description}) ;
  final String title ;
  final DateTime date;
  final String description;

  String getTitle(){
    return title;
  }

  String getDescription(){
    return description;
  }

  DateTime getDate(){
    return date;
  }


  // Image image = Image();


}