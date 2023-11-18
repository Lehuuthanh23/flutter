import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

class InfoReader {
  Future<String> getDictionary() async {
    String s = "";
    try {
      s = await rootBundle.loadString("data/dictionary.json");
      return s;
    } catch (e) {
      return e.toString();
    }
  }
}
