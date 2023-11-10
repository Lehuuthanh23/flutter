import 'dart:convert';
import 'dart:io';



import 'package:flutter/services.dart';

class InfoReader {
  Future<String> getInfo() async {
    String s = "";
    try {
      s = await rootBundle.loadString("data/products.json");
      return s;
    } catch (e) {
      return e.toString();
    }
  }
  Future<String> getCart() async {
    String s = "";
    try {
      s = await rootBundle.loadString("data/cart.json");
      return s;
    } catch (e) {
      return e.toString();
    }
  }
}
