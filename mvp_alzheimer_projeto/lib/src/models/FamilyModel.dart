import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class FamilyModel {
  static FamilyModel instance = FamilyModel();

  List<Family> famili = <Family>[];
}

class Family {
  Family(
      {Key? key,
      required this.title,
      required this.date,
      required this.parentesco,
      required this.identifier,
      required this.image,
      required this.Telephone,
      this.imgLink});
  String title;
  DateTime date;
  String Telephone;
  String parentesco;
  int identifier;
  ImageProvider<Object> image;
  String? imgLink = "";

  String getTitle() {
    return title;
  }

  String getDescription() {
    return parentesco;
  }

  DateTime getDate() {
    return date;
  }
  String getConvertedDate(){
    return DateFormat('dd/MM/yyyy').format(date);
  }

  String getTelephone() {
    return Telephone;
  }

  int getIdentifier() {
    return identifier;
  }

  void setIdentifier(int id) {
    this.identifier = id;
  }

  ImageProvider<Object> getImage() {
    return image;
  }

  void changeFamily(Family newFamily) {
    this.title = newFamily.getTitle();
    this.date = newFamily.getDate();
    this.Telephone = newFamily.getTelephone();
    this.parentesco = newFamily.getDescription();
    this.image = newFamily.getImage();
    this.imgLink = newFamily.imgLink;
  }

  // Image image = Image();

}
