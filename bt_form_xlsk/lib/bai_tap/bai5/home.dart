import 'package:bt_form_xlsk/bai_tap/bai5/detail.dart';
import 'package:flutter/material.dart';

class Bai05 extends StatefulWidget {
  const Bai05({super.key});

  @override
  State<Bai05> createState() => _Bai05State();
}

class _Bai05State extends State<Bai05> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Demo Home Page Bai5',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.blue),
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName('/bai05'));
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Bai05_Detail(id: 8),
            ),
          );
        },
        child: const Text('View detail'),
      ),
    );
  }
}
