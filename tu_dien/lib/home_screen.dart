import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:tu_dien/dicBox.dart';
import 'package:tu_dien/dictionary.dart';

import 'db_reader.dart';
import 'package:flutter/material.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  List<Dictionary> _item = [];
  int count = 0;
  Future<void> readJson() async {
    String s = await rootBundle.loadString("data/dictionary.json");
    Map<String, dynamic> data = jsonDecode(s);
    List<String> keys = data.keys.toList();
    for (String key in keys) {
      setState(() {
        _item.add(Dictionary(key, data[key], false));
      });

      if (count == 19) {
        break;
      }
      count++;
    }
    print("Số từ ${_item.length}");
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(labelText: 'Nhập từ khóa...'),
        ),
        backgroundColor: Colors.blue,
      ),
      body: DicBox(item: _item),
    );
  }
}
