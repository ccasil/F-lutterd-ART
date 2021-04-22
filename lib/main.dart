import 'package:flutter/material.dart';
import './screen_1.dart';
import './screen_2.dart';
import './screen_3.dart';
import './screen_4.dart';
import './screen_5.dart';

import 'src/catalog.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(

    ChangeNotifierProvider < Catalog > (
      create: (context) => Catalog(),
      child: MaterialApp(
        title: 'Named Routes Demo',
        // Start the app with the "/" named route. In this case, the app starts
        // on the FirstScreen widget.
        initialRoute: '/',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(95, 147, 194, 1),
          iconTheme: IconThemeData(
            color: Color.fromRGBO(95, 147, 194, 1),
          ),
        ),
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => FirstScreen(title: 'Floating Button Click', ),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/second': (context) => SecondScreen(title: '', ),
          '/third': (context) => ThirdScreen(),
          '/fourth': (context) => FourthScreen(),
          '/fifth': (context) => FifthScreen(),
        },
      ),
    ),
  );
}

class TheRouteButton extends StatelessWidget {
  final String textlabel;
  final String route;
  // final Function function; // add this
  const TheRouteButton(this.textlabel, this.route); // change this

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(50),
        color: Color.fromRGBO(95, 147, 194, 1),
        child: MaterialButton(
          minWidth: 250,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            Navigator.pushNamed(context, this.route);
          }, // add this here
          child: Text(textlabel,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)
            .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

class TheBackButton extends StatelessWidget {
  const TheBackButton(); // change this

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(50),
        color: Color.fromRGBO(95, 147, 194, 1),
        child: MaterialButton(
          minWidth: 250,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            Navigator.pop(context);
          }, // add this here
          child: Text('Go Back',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)
            .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(title: 'Flutter Demo Home Page')
    );
    // return ChangeNotifierProvider<Catalog>(
    //   create: (context) => Catalog(),
    //   child: MaterialApp(
    //     title: 'Infinite List Sample',
    //     home: FirstScreen(title: '',),
    //   ),
    // );
  }
}