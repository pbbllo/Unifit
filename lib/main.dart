import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'utils/constants.dart';
import 'views/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CarouselSlider(
            items: [
              Image.asset('lib/assets/layers/Apresentação_1.jpg',fit: BoxFit.cover),
              Image.asset('lib/assets/layers/Apresentação_2.jpg',fit: BoxFit.cover),
              Image.asset('lib/assets/layers/Apresentação_3.jpg',fit: BoxFit.cover),
              Image.asset('lib/assets/layers/Apresentação_4.jpg',fit: BoxFit.cover),
              Image.asset('lib/assets/layers/Apresentação_5.jpg',fit: BoxFit.cover),
              Image.asset('lib/assets/layers/Login.jpg',fit: BoxFit.cover),
              Image.asset('lib/assets/layers/Cadastro.jpg',fit: BoxFit.cover),
              Image.asset('lib/assets/layers/Cadastro1.jpg',fit: BoxFit.cover),
              Image.asset('lib/assets/layers/Cadastro2.jpg',fit: BoxFit.cover),
              Image.asset('lib/assets/layers/Cadastro3.jpg',fit: BoxFit.cover),
              Image.asset('lib/assets/layers/Cadastro4.jpg',fit: BoxFit.cover),
              Image.asset('lib/assets/layers/Cadastro5.jpg',fit: BoxFit.cover),
              Image.asset('lib/assets/layers/Cadastro5-1.jpg',fit: BoxFit.cover),
              Image.asset('lib/assets/layers/Cadastro6.jpg',fit: BoxFit.cover),
              Image.asset('lib/assets/layers/Cadastro7.jpg',fit: BoxFit.cover),
            ],
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              enlargeCenterPage: false,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 1000),
              viewportFraction: 1.0,
              disableCenter: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ),
    );
  }
}
