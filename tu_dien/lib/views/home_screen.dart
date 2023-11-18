import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:tu_dien/views/dicBox.dart';
import 'package:tu_dien/models/dictionary.dart';

import '../models/db_reader.dart';
import 'package:flutter/material.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  //List<Dictionary> _item = [];
  // int count = 0;
  // Future<void> readJson() async {
  //   String s = await rootBundle.loadString("data/dictionary.json");
  //   Map<String, dynamic> data = jsonDecode(s);
  //   List<String> keys = data.keys.toList();
  //   for (String key in keys) {
  //     setState(() {
  //       _item.add(Dictionary(key, data[key], false));
  //     });

  //     if (count == 19) {
  //       break;
  //     }
  //     count++;
  //   }
  //   print("Số từ ${_item.length}");
  // }
  TextEditingController search = TextEditingController();
  List<Dictionary> _dictionary =
      List.filled(0, Dictionary("", "", false), growable: true);
  void readJson() async {
    Dictionary.loadData().then((value) {
      setState(() {
        _dictionary = Dictionary.dictionary;
      });
    });
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
        title: TextField(
          controller: search,
          onChanged: (value) {
            setState(() {
              if (value.isEmpty)
                readJson();
              else
                _dictionary = Dictionary.searchDic(_dictionary, value);
            });
          },
          decoration:
              const InputDecoration(labelText: 'Nhập từ khóa bạn muốn tìm....'),
        ),
        backgroundColor: Colors.blue,
      ),
      body: DicBox(item: _dictionary),
    );
  }
}
