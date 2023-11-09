import 'package:bt_form_xlsk/bai_tap/bai04/detail.dart';
import 'package:bt_form_xlsk/bai_tap/bai04/home.dart';
import 'package:bt_form_xlsk/bai_tap/bai06/account.dart';
import 'package:bt_form_xlsk/bai_tap/bai06/bai06.dart';
import 'package:bt_form_xlsk/bai_tap/bai06/setting.dart';
import 'package:bt_form_xlsk/bai_tap/bai07/bai7.dart';
import 'package:bt_form_xlsk/bai_tap/bai1.dart';
import 'package:bt_form_xlsk/bai_tap/bai2.dart';
import 'package:bt_form_xlsk/bai_tap/bai3.dart';
import 'package:bt_form_xlsk/bai_tap/bai5/detail.dart';
import 'package:bt_form_xlsk/bai_tap/bai5/home.dart';
import 'package:bt_form_xlsk/form_dangky.dart';
import 'package:bt_form_xlsk/form_dangnhap.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/bai07',
      routes: {
        '/bai01': (context) => const Bai01(),
        '/bai02': (context) => const Bai02(),
        '/bai03': (context) => const Bai03(),
        '/bai04': (context) => const Bai04(),
        '/bai04/detail': (context) => const Bai04_Detail(),
        '/bai05': (context) => const Bai05(),
        '/bai06': (context) => const Bai06(),
        '/bai06/setting': (context) => const Setting(),
        '/bai06/account': (context) => const Account(),
        '/bai07': (context) => const Bai07(),
      },
    );
  }
}
