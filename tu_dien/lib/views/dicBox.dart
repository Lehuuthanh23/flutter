import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tu_dien/models/dictionary.dart';

class DicBox extends StatefulWidget {
  DicBox({super.key, required this.item});
  List<Dictionary> item;

  @override
  State<DicBox> createState() => _DicBoxState();
}

class _DicBoxState extends State<DicBox> {
  void printItem() {
    print("Bên DicBox ${widget.item.length}");
  }

  @override
  void initState() {
    super.initState();
    printItem();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
            child: Column(children: widget.item.map((e) => Box(e)).toList())));
  }

  Padding Box(Dictionary dic) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(children: [
        MaterialButton(
          onPressed: () {
            setState(() {
              dic.stt = !dic.stt;
            });
          },
          height: 100,
          color: Colors.amber,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
              child: Text(
            dic.tu,
            style: const TextStyle(fontSize: 30),
          )),
        ),
        if (dic.stt)
          Container(
            height: 100,
            color: Colors.grey,
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Center(
                child: SingleChildScrollView(
              child: Column(children: [
                Text(
                  dic.nghia,
                  style: const TextStyle(fontSize: 20),
                ),
              ]),
            )),
          )
      ]),
    );
  }
}
