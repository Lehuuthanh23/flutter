import 'package:flutter/material.dart';

class Bai02 extends StatefulWidget {
  const Bai02({super.key});

  @override
  State<Bai02> createState() => _Bai02State();
}

var val;
TextEditingController txt_val = TextEditingController();

class _Bai02State extends State<Bai02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bài 2',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(children: [
        TextField(
          controller: txt_val,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.blue),
          onPressed: () {
            setState(() {
              val = txt_val.text;
            });
          },
          child: const Text('Cập nhật'),
        ),
        if (val != null) Text('$val')
      ]),
    );
  }
}
