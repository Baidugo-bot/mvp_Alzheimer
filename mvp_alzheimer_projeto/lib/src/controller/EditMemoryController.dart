import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/models/MemoryModel.dart';
class EditMemoryController{
  static EditMemoryController instance = EditMemoryController();
  void excludeById(int identifier){
    MemoryModel.instance.memories.removeAt(identifier);
    int memCount = 0;
    MemoryModel.instance.memories.forEach((element) {
      element.setIdentifier(memCount);
      memCount++;
    });
  }

  void changeById(int identifier, Memory newMemory){
    MemoryModel.instance.memories.forEach((e) {
      print(newMemory.getImage().toString()+" - "+newMemory.imgLink.toString());
      if(e.identifier==identifier){
        e.changeMemory(newMemory);
      }
    });
  }
}