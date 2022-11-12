import 'package:flutter/material.dart';

class DiasSemana {
  String name;
  bool isSelected;

  DiasSemana(this.name, this.isSelected);
}

List<DiasSemana> contacts = [
  DiasSemana('Seg', false),
  DiasSemana('Ter', false),
  DiasSemana('Qua', false),
  DiasSemana('Qui', false),
  DiasSemana('Sex', false),
  DiasSemana('Sab', false),
  DiasSemana('Dom', false),
];

Widget BordaSemana() {
  return SafeArea(
    child: Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => ContItem(
          contacts[index].name,
          contacts[index].isSelected,
          index,
        ),
      ),
    ),
  );
}

Widget ContItem(String nome, bool isSelected, int index) {
  return Container(
    width: 45.0,
    height: 45.0,
    decoration: BoxDecoration(
      color: isSelected ? Colors.blue : Colors.grey,
      borderRadius: BorderRadiusDirectional.circular(100.0),
    ),
    child: Padding(
      padding: EdgeInsets.all(1.0),
      child: Center(
        child: Text(
          nome,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
            fontFamily: 'italic',
          ),
        ),
      ),
    ),
  );
}
