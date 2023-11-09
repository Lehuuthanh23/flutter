import 'package:flutter/material.dart';

class Bai05_Detail extends StatelessWidget {
  const Bai05_Detail({super.key, required this.id});
  final id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Text('Detail Screen-$id'),
    );
  }
}
