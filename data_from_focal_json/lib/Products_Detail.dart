import 'dart:convert';
import 'dart:io';

import 'package:data_from_focal_json/cart_view.dart';
import 'package:data_from_focal_json/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({super.key, required this.id, required this.items});
  final int id;
  final List items;
  @override
  Widget build(BuildContext context) {
    Product pro = Product.fromJson(Product.GetId(items, id));
    final File file= File('D:/GITHUB/data_from_focal_json/data/cart.json');
    return Scaffold(
        appBar: AppBar(title: const Text("Detail")),
        body: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                pro.url,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Text(
                      pro.name,
                    ),
                  ),
                  Text(
                    pro.price.toString(),
                    style: const TextStyle(color: Colors.red),
                  )
                ],
              )
            ],
          ),
          ElevatedButton(
            onPressed: () {              
              file.writeAsStringSync(pro.toJson().toString());
            },
            child: const Text('Thêm vào giỏ hàng'),
          ),
          ElevatedButton(
            onPressed: () {              
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartView(title: "Giỏ hàng")));
            },
            child: const Text('Xem giỏ hàng'),
          )
        ]));
  }
  Future<void> readPlayerData (File file) async { 
    List<Product> product=[];
    String contents = await file.readAsString();
    var jsonResponse = jsonDecode(contents);
    
    for(var p in jsonResponse){
        
        Product pro = Product(p['id'],p['name'],p['price'],p['url_img']);
        product.add(pro);
    }
    
      
}
}
