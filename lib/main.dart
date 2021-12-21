import 'package:flutter/material.dart';
import 'package:payment_gateway_integration/views/about.dart';
import 'package:payment_gateway_integration/views/homescreen.dart';
import 'package:payment_gateway_integration/views/thankyoupage.dart';
import 'views/donatemoney.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment Gateway Integration',
      home: HomeScreen(),
      routes: {
        '/home': (context) =>  HomeScreen(),
        '/about': (context) => AboutPage(),
        '/donate': (context) => Donate(),
        '/thankyou':(context) => ThankYouPage(),
      },
    );
  }
}

