import 'package:flutter/material.dart';

class Bai03 extends StatefulWidget {
  const Bai03({super.key});

  @override
  State<Bai03> createState() => _Bai03State();
}

var val1;
TextEditingController txt_val1 = TextEditingController();
var val2;
TextEditingController txt_val2 = TextEditingController();
double result = 0;

class _Bai03State extends State<Bai03> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bài 3',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(children: [
        TextField(
          controller: txt_val1,
        ),
        TextField(
          controller: txt_val2,
        ),
        Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue),
              onPressed: () {
                setState(() {
                  result =
                      double.parse(txt_val1.text) + double.parse(txt_val2.text);
                });
              },
              child: const Text('+'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue),
              onPressed: () {
                setState(() {
                  result =
                      double.parse(txt_val1.text) - double.parse(txt_val2.text);
                });
              },
              child: const Text('-'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue),
              onPressed: () {
                setState(() {
                  result =
                      double.parse(txt_val1.text) * double.parse(txt_val2.text);
                });
              },
              child: const Text('*'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue),
              onPressed: () {
                setState(() {
                  result =
                      double.parse(txt_val1.text) / double.parse(txt_val2.text);
                });
              },
              child: const Text('/'),
            ),
          ],
        ),
        Text('$result')
      ]),
    );
  }
}
