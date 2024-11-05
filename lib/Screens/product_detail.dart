import 'package:ecommerce/Providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProductDetail extends StatefulWidget {
  final Map product;
  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int selectedSize = -1;
  @override
  Widget build(BuildContext context) {
    final String title = widget.product['title'] as String;
    final String price = widget.product['price'].toString();
    final String imageUrl = widget.product['imageUrl'] as String;
    final List<int> sizes = widget.product['sizes'] as List<int>;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(
              flex: 1,
            ),
            Image(
              width: 400,
              image: AssetImage(
                imageUrl,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Container(
              color: const Color.fromRGBO(245, 247, 249, 1),
              padding: const EdgeInsets.all(
                20,
              ),
              child: Column(
                children: [
                  Text(
                    "\$ $price",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sizes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              selectedSize = index;
                              setState(() {});
                            },
                            child: Chip(
                              backgroundColor: selectedSize == index
                                  ? Theme.of(context).primaryColor
                                  : null,
                              padding: const EdgeInsets.all(
                                8,
                              ),
                              label: Text(sizes[index].toString()),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(
                        double.infinity,
                        46,
                      ),
                    ),
                    onPressed: () {
                      if (selectedSize == -1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Please Select a size",
                            ),
                          ),
                        );
                      } else {
                        Provider.of<CartProvider>(context, listen: false)
                            .addItem(widget.product);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Item Added To Cart",
                            ),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text(
                      "Add To Cart",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
