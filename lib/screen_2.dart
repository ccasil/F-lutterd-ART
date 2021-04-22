import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({
    Key ? key,
    required this.title
  }): super(key: key);

  final String title;

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State < SecondScreen > {
  String textToShow = 'I like Flutter!!!';
  bool count = true;

  void _updateText() {
    setState(() {
      if (count == true) {
        textToShow = "Flutter is aight.";
      } else {
        textToShow = "I like Flutter!!!";
      }
      count = !count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Boolean Toggle Screen"),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: < Widget > [
            BackButton(
              color: Colors.blue,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                '$count',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                textToShow,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _updateText();
        },
        tooltip: 'Increment',
        child: Icon(Icons.update),
      ),
    );
  }
}