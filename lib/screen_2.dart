import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({
    Key key,
    this.title
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
        title: Text("Second Screen"),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: < Widget > [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              textToShow,
              style: TextStyle(fontWeight: FontWeight.bold),
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
