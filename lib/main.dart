import 'package:flutter/material.dart';
import './screen_1.dart';
import './screen_2.dart';
import './screen_3.dart';
import './screen_4.dart';
import './screen_5.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
        '/fourth': (context) => FourthScreen(),
        '/fifth': (context) => FifthScreen(),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(title: 'Flutter Demo Home Page')
    );
  }
}