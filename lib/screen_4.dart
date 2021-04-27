import 'package:flutter/material.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({
    Key ? key
  }): super(key: key);

  @override
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State < FourthScreen > {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Screen"),
      ),
      body: Center(
        child: Column(
          children: < Widget > [
            DropdownButton < String > (
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Color.fromRGBO(95, 147, 194, 1)),
                  underline: Container(
                    height: 2,
                    color: Color.fromRGBO(95, 147, 194, 1),
                  ),
                  onChanged: (String ? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });

                  },
                  items: < String > ['One', 'Two', 'Free', 'Four']
                  .map < DropdownMenuItem < String >> ((String value) {
                    return DropdownMenuItem < String > (
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
            ),
              Text(
                '$dropdownValue',
                style: Theme.of(context).textTheme.headline4,
              ),
          ]
        ),
      ),
    );
  }
}