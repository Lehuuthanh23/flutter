import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'db_reader.dart';

class Dictionary {
  String tu;
  String nghia;
  bool stt;
  Dictionary(this.tu, this.nghia, this.stt);
  Dictionary.fromJson(Map<String, dynamic> json)
      : tu = json.keys.first,
        nghia = json.values.first,
        stt = false;
  static List<Dictionary> dictionary =
      List.filled(0, Dictionary("", "", false), growable: true);
  static int count = 0;
  static Future<void> loadData() async {
    DicReader reader = DicReader();
    String data = await reader.getDictionary();
    Map<String, dynamic> lst = jsonDecode(data);
    List<String> keys = lst.keys.toList();
    for (String key in keys) {
      dictionary.add(Dictionary(key, lst[key], false));
      if (count == 19) {
        break;
      }
      count++;
    }
  }
}
