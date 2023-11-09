import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'ABC System',
            ),
          ),
          ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Cài đặt"),
              onTap: () {
                Navigator.pushNamed(context, '/bai06/setting');
              }),
          ListTile(
              leading: const Icon(Icons.account_circle_outlined),
              title: const Text("Tài khoản"),
              onTap: () {
                Navigator.pushNamed(context, '/bai06/account');
              }),
        ],
      ),
    );
  }
}
