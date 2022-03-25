import 'dart:ui';
import 'package:flutter/material.dart';
class MemoryModel{
  static MemoryModel instance = MemoryModel();

  List<Memory> memories = <Memory>[];
}

class Memory {
  const Memory({Key? key, required this.title, required this.date}) ;
  final String title ;
  final DateTime date;
  // Image image = Image();


}