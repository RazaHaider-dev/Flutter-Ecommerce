import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map product;
  final Color bgColor;
  const ProductCard({super.key, required this.product, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    final String title = product['title'];
    final String price = product['price'].toString();
    final String imageUrl = product['imageUrl'];
    return Container(
      margin: const EdgeInsets.all(
        // top: 18,
        10
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      padding: const EdgeInsets.all(
        14,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            "\$ $price",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 14,
          ),
          // ignore: prefer_const_constructors
          Center(
            child: Image(
              height: 180,
              image: AssetImage(
                imageUrl,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
