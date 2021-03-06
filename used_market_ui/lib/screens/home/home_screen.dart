// BottomNavigationBarItem의 '홈' 아이콘(Home)을 눌렀을 때 나타날 위젯

import 'package:carrot_market_ui/models/product.dart';
import 'package:carrot_market_ui/screens/home/components/product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text('영등포동'),
            SizedBox(width: 4.0),
            Icon(CupertinoIcons.chevron_down, size: 15),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.list_dash),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.bell),
            onPressed: () {},
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0.5),
          child: Divider(thickness: 0.5, height: 0.5, color: Colors.grey),
        ),
      ),
      body: ListView.separated(
        itemCount: productList.length,
        itemBuilder: (context, index) =>
            ProductItem(product: productList[index]),
        separatorBuilder: (context, index) => const Divider(
          height: 0,
          color: Colors.grey,
          indent: 16,
          endIndent: 16,
        ),
      ),
    );
  }
}
