import 'package:flutter/material.dart';

class DualCardDisplay extends StatelessWidget {
  final List<String>? CardImages;
  const DualCardDisplay({super.key, required this.CardImages});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 130,
                width: 105,
                child: Image.asset(
                  '${CardImages![0]}',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 130,
                width: 105,
                child: Image.asset(
                  '${CardImages![1]}',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
