import 'package:coffe_18030552/colors.dart';
import 'package:coffe_18030552/drink.dart';
import 'package:coffe_18030552/drinkCard.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          buildToolbar(),
          buildLogo(size),
          buildPager(size),
        ],
      )),
    );
  }


  Widget buildToolbar() {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Row(
      children: <Widget>[
        const SizedBox(
          width: 20,
        ),
        Image.asset(
          'images/location.png',
          width: 30,
          height: 30,
        ),
        const Spacer(),
        Image.asset(
          'images/drawer.png',
          width: 30,
          height: 30,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    ),
  );
}

Widget buildLogo(Size size) {
  return Positioned(
    top: 10,
    right: size.width / 2 - 25,
    child: Image.asset(
      'images/logo.png',
      width: 50,
      height: 50,
    ),
  );
}

Widget buildPager(Size size) {
  return Container(
    margin: const EdgeInsets.only(top: 70),
    height: size.height-50,
    child: PageView.builder(itemCount:getDrinks().length,itemBuilder:(context,index)=>Drinkcard(getDrinks()[index])),
  );
}

List<Drink> getDrinks() {
  List<Drink> list = [];
  list.add(Drink(
      'Serie',
      '1R',
      'images/blur_image.png',
      'images/leave.png',
      'images/leavein.png',
      'images/ciervo.png',
      'images/series1.png',
      'Transmisión hidrostática, doble tracción y dirección \nasistida',
      nBrownLight,
      nBrown));
      return list;
}
}


