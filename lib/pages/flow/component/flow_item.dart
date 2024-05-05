import 'package:flutter/cupertino.dart';

class FlowItem extends StatelessWidget {
  const FlowItem({super.key, required this.title, required this.date, required this.price});

  final String title;
  final String date;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title),
                  Text(date),
                ],
              ),
              Text(price.toStringAsFixed(5))
            ],
          ),
        )
      ],
    );
  }
}
