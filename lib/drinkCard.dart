import 'package:coffe_18030552/drink.dart';
import 'package:flutter/material.dart';

class Drinkcard extends StatelessWidget {
  Drink drink;
  Drinkcard(this.drink, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          buildTopText(),
        ],
      ),
    );
  }
  
  Widget buildTopText() {
    return Row(
      children: <Widget>[
        const SizedBox(width: 20,),
        Text(drink.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50,color: drink.lightColor),),
        Text(drink.conName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50,color: drink.darkColor),)
      ],
    );
  }
}