import 'dart:convert';

import 'package:data_from_focal_json/item_view.dart';
import 'package:data_from_focal_json/main.dart';
import 'package:data_from_focal_json/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CartView extends StatefulWidget {
  const CartView({super.key, required this.title});

  final String title;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List _items = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('data/cart.json');
    final data = await json.decode(response);
    setState(() {
      _items = data;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    int count = (_items.length / 2).ceil();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: _items.isNotEmpty
            ? ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: count,
                itemBuilder: (BuildContext context, int index) {
                  if (_items.length % 2 != 0 && index == count - 1) {
                    return Row(
                      children: [
                        Item(
                          pro: Product.fromJson(_items[index * 2]),
                          items: _items,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MyHomePage(title: "Trang chủ")));
                          },
                          child: const Text('Về trang chủ'),
                        )
                      ],
                    );
                  } else {
                    return Row(
                      children: [
                        Item(
                          pro: Product.fromJson(_items[index * 2]),
                          items: _items,
                        ),
                        Item(
                          pro: Product.fromJson(_items[index * 2 + 1]),
                          items: _items,
                        )
                      ],
                    );
                  }
                })
            : ElevatedButton(
                onPressed: () {
                  readJson();
                },
                child: const Text('Load giỏ hàng'),
              ));
  }
}
/*
Column(
          children: [
            _items.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: _items.length,
                        itemBuilder: ((context, index) {
                          return Card(
                            key: ValueKey(_items[index]["id"]),
                            margin: const EdgeInsets.all(10),
                            color: Colors.amber,
                            child: ListTile(
                              leading: Text(_items[index]["id"].toString()),
                              title: Text(_items[index]["name"]),
                              subtitle: Column(children: [
                                Text(_items[index]["price"].toString()),
                                Text(_items[index]["url_img"])
                              ]),
                            ),
                          );
                        })))
                : ElevatedButton(
                    onPressed: () {
                      readJson();
                    },
                    child: const Text('Load Product')),
          ],
        )
 */