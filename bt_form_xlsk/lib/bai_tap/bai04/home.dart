import 'package:bt_form_xlsk/bai_tap/bai04/detail.dart';
import 'package:flutter/material.dart';

class Bai04 extends StatefulWidget {
  const Bai04({super.key});

  @override
  State<Bai04> createState() => _Bai04State();
}

class _Bai04State extends State<Bai04> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Demo Home Page Bai4',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.blue),
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName('/bai04'));
          Navigator.pushNamed(context, '/bai04/detail');
        },
        child: const Text('View detail'),
      ),
    );
  }
}
