import 'package:flutter/material.dart';

class defaultTabController extends StatelessWidget {
  const defaultTabController({super.key});

  static const List<Tab> myTabs = <Tab>[
    Tab(
      icon: Icon(
        Icons.home,
        color: Colors.white,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.video_collection_sharp,
        color: Colors.white,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.card_giftcard_outlined,
        color: Colors.white,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.feed_outlined,
        color: Colors.white,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.notifications_active,
        color: Colors.white,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const TabBar(
            tabs: myTabs,
          ),
          backgroundColor: Colors.blue,
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text(
                'Home',
              ),
            ),
            Center(
              child: Text(
                'Story',
              ),
            ),
            Center(
              child: Text(
                'qori2',
              ),
            ),
            Center(
              child: Text(
                'New Feeds',
              ),
            ),
            Center(
              child: Text(
                'Thông báo',
              ),
            )
          ],
        ),
      ),
    );
  }
}
