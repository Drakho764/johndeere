import 'package:flutter/material.dart';
import 'package:johndeere/drink.dart';
import 'package:johndeere/drinkCard.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  late PageController pageController;
  double pageOffset =0;
  late AnimationController controller;
  late Animation animation;
  
  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeOutBack);
    pageController =PageController(viewportFraction: .8);
    pageController.addListener((){
      setState(() {
        pageOffset =pageController.page!;
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    pageController.dispose();
    super.dispose();
  }

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
          buildPageIndicator(),
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
        AnimatedBuilder(
          animation: animation,
          builder: (context, snapshot) {
            return Transform.translate(
              offset: Offset((1-animation.value)*-200, 0),
              child: Image.asset(
                'images/location.png',
                width: 30,
                height: 30,
              ),
            );
          }
        ),
        const Spacer(),
        AnimatedBuilder(
          animation: animation,
          builder: (context, snapshot) {
            return Transform.translate(
              offset: Offset((1-animation.value)*200, 0),
              child: Image.asset(
                'images/drawer.png',
                width: 30,
                height: 30,
              ),
            );
          }
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
    child:AnimatedBuilder(
      animation: animation,
      builder: (context, snapshot) {
        return Transform(
          transform: Matrix4.identity()
          ..translate(0.0,size.height/2*(1-animation.value))
          ..scale(1+(1-animation.value)),
          origin: Offset(25, 25),
          child: InkWell(
            onTap: ()=>controller.isCompleted?controller.reverse():controller.forward(),
            child: Image.asset(
              'images/logo.png',
              width: 50,
              height: 50,
            ),
          ),
        );
      }
    ),
  );
}

Widget buildPager(Size size) {
  return Container(
    margin: const EdgeInsets.only(top: 70),
    height: size.height-50,
    child: AnimatedBuilder(
      animation: animation,
      builder: (context, snapshot) {
        return Transform.translate(
          offset: Offset((1-animation.value)*400, 0),
          child: PageView.builder(controller: pageController,itemCount:getDrinks().length,itemBuilder:(context,index)=>
          Drinkcard(getDrinks()[index],pageOffset,index),
            ),
        );
      }
    ));
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
      'Transmisión hidrostática, doble tracción y dirección \nasistida con asiento de lujo.',
      Colors.black45,
      Colors.black));
      list.add(Drink(
      'Serie',
      '2R',
      'images/blur_image.png',
      'images/leave.png',
      'images/leavein.png',
      'images/ciervo.png',
      'images/series2R.png',
      '4WD, ejes reforzados, enganche de 3 puntos \nde Categoría 1',
      Colors.black45,
      Colors.black));
      return list;
}

  Widget buildPageIndicator() {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, snapshot) {
        return Positioned(
          bottom:10,left: 10,
          child:Opacity(
            opacity: controller.value,
            child: Row(
              children: List.generate(getDrinks().length, (index)=>buildContainer(index)),
            ),
          ) ,
        );
      }
    );
  }
  
  Widget buildContainer(int index) {
    double animate = pageOffset - index;
    double size =10;
    animate=animate.abs();
    Color color = Colors.grey;
    if (animate<=1 && animate>=0) {
      size = 10+10*(1-animate);
      color = ColorTween(begin: Colors.grey, end: const Color.fromARGB(255, 54, 124, 43)).transform((1-animate))!;
    }

    return Container(
      margin: EdgeInsets.all(4),
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20)
      ),

    );
  }


}


