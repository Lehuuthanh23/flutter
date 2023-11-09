import 'package:flutter/material.dart';

class Bai04_Detail extends StatelessWidget {
  const Bai04_Detail({super.key});

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
      body: const Text('Detail Screen Bai4'),
    );
  }
}
