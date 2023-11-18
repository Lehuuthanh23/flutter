import 'package:data_from_focal_json/Products_Detail.dart';
import 'package:data_from_focal_json/product.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  Item({super.key, required this.pro, required this.items});
  final Product pro;
  final List items;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      width: MediaQuery.of(context).size.width / 2 - 15,
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailProduct(
                            id: pro.id,
                            items: items,
                          )));
            },
            child: Image.network(
              pro.url,
              fit: BoxFit.cover,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailProduct(
                              id: pro.id,
                              items: items,
                            )));
              },
              child: Text(pro.name)),
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailProduct(
                            id: pro.id,
                            items: items,
                          )));
            },
            child: Text(
              '${pro.price}',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red[400]),
            ),
          )
        ],
      ),
    );
  }
}
