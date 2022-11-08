import 'package:flutter/material.dart';

class ProfileModel {
  static ProfileModel instance = ProfileModel();

  List<Profile> perfil = <Profile>[];
}

class Profile {
  Profile(
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

  void changeProfile(Profile newProfile) {
    this.title = newProfile.getTitle();
    this.date = newProfile.getDate();
    this.Telephone = newProfile.getTelephone();
    this.parentesco = newProfile.getDescription();
    this.image = newProfile.getImage();
    this.imgLink = newProfile.imgLink;
  }

  // Image image = Image();

}
