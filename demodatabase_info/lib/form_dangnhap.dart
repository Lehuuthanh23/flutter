import 'dart:ffi';

import 'package:demodatabase_info/models/info_reader.dart';
import 'package:demodatabase_info/models/member.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  FormLogin({super.key});
  InfoReader info = new InfoReader();
  @override
  State<FormLogin> createState() => _FormLoginState();
}

String msg = '';
final form_key = GlobalKey<FormState>();
var username = TextEditingController();
var password = TextEditingController();

class _FormLoginState extends State<FormLogin> {
  Future<void> _checkLogin() async {
    if (password.text != '' && password.text == username.text) {
      msg = 'Đăng nhập thành công';
      widget.info.saveInfo(Member(username.text, password.text)).then((value) {
        setState(() {});
      });
    } else {
      msg = 'Đăng nhập thất bại';
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    widget.info.getInfo().then((value) {
      Member mem = value;
      msg = mem.us;
      if (mem.us != '') {
        username.text = mem.us;
        password.text = mem.token;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ĐĂNG NHẬP",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Image.asset(
            'img/buom2.jpg',
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height / 2.8,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber),
                color: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "ĐĂNG NHẬP",
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: username,
                      decoration: const InputDecoration(
                        label: Text(
                          "Nhập username",
                          style: TextStyle(color: Colors.amber),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.amber, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: password,
                      decoration: const InputDecoration(
                        label: Text(
                          "Nhập mật khẩu",
                          style: TextStyle(color: Colors.amber),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.amber, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _checkLogin();
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.amber)),
                      child: const Text(
                        'Đăng nhập',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Text(
                      msg,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
