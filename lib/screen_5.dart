import 'package:flutter/material.dart';
import './main.dart';

class FifthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fifth Screen"),
      ),
      body: Center(
        child:
            TheBackButton(),
      ),
    );
  }
}