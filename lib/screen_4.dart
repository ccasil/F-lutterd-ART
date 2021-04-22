import 'package:flutter/material.dart';
import './main.dart';

class FourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Screen"),
      ),
      body: Center(
        child: 
            TheBackButton(),
      ),
    );
  }
}