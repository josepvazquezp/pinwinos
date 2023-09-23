import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final int i;
  ItemCard({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 100,
            child: Image.asset(
              "assets/images/cards/c$i.png",
            ),
          ),
        ],
      ),
    );
  }
}
