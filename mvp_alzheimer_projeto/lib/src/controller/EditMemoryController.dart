import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/models/MemoryModel.dart';
class EditMemoryController{
  static EditMemoryController instance = EditMemoryController();
  void excludeById(int identifier){
    MemoryModel.instance.memories.removeAt(identifier);

  }

  void changeById(int identifier, Memory newMemory){
    MemoryModel.instance.memories.map((e) => (){
      if(e.identifier==identifier){
        e.changeMemory(newMemory);
      }
    });
  }
}