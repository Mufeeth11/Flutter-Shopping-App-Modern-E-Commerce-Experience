import 'package:flutter/material.dart';

class Prod extends StatelessWidget {
  final productName;
  final productPrice;
  final imageLocation;
  const Prod(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.imageLocation});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          Text(
            ('\$ $productPrice'),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Center(
            child: Image.asset(
              imageLocation,
              height: 300,
            ),
          )
        ],
      ),
    );
  }
}
