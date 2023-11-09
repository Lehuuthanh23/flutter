import 'package:bt_form_xlsk/bai_tap/bai06/drawer.dart';
import 'package:flutter/material.dart';

class Bai06 extends StatefulWidget {
  const Bai06({super.key});

  @override
  State<Bai06> createState() => _Bai06State();
}

class _Bai06State extends State<Bai06> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Demo Home Page Bai6',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: const MyDrawer(),
    );
  }
}
