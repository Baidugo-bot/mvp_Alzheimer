import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/models/MemoryModel.dart';
class AddMemoryController{

  void excludeById(int identifier){
    MemoryModel.instance.memories.removeAt(identifier);

  }
}