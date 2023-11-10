import 'package:data_from_focal_json/product.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.pro});
  final Product pro;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      width: MediaQuery.of(context).size.width / 2 - 15,
      child: Column(
        children: [
          Image.network(
            pro.url,
            fit: BoxFit.cover,
          ),
          Text(pro.name),
          Text(
            '${pro.price}',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.red[400]),
          ),
        ],
      ),
    );
  }
}
