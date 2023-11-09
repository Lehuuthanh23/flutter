import 'package:flutter/material.dart';

class Bai01 extends StatefulWidget {
  const Bai01({super.key});

  @override
  State<Bai01> createState() => _Bai01State();
}

var count = 0;

class _Bai01State extends State<Bai01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bài 1',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Wrap(
            children: [
              const Text(
                'Giá trị: ',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '$count',
                style: const TextStyle(color: Colors.red, fontSize: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue),
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                child: const Text('Tăng'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.amber),
                onPressed: () {
                  setState(() {
                    count--;
                  });
                },
                child: const Text('Giảm'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
