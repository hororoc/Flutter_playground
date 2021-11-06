import 'package:carrot_market_ui/models/product.dart';
import 'package:carrot_market_ui/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    // 가로 방향 최대로 늘어남
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.title, style: textTheme().bodyText1),
          const SizedBox(height: 4.0),
          Text('${product.address} ∙ ${product.publishedAt}'),
          const SizedBox(height: 4.0),
          Text(
            '${currencyFormat(product.price)}원',
            style: textTheme().headline2,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: product.commentsCount > 0,
                child: _buildIcons(
                  product.commentsCount,
                  CupertinoIcons.chat_bubble_2,
                ),
              ),
              const SizedBox(width: 8),
              Visibility(
                visible: product.heartCount > 0,
                child: _buildIcons(
                  product.heartCount,
                  CupertinoIcons.heart,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String currencyFormat(String price) {
    final formatter = NumberFormat('#,###');
    return formatter.format(int.parse(price));
  }
}

Widget _buildIcons(int count, IconData iconData) {
  return Row(
    children: [
      Icon(iconData, size: 14.0),
      const SizedBox(width: 4),
      Text('$count'),
    ],
  );
}