import 'package:ecommerce/Data/global_variables.dart';
import 'package:ecommerce/Screens/product_detail.dart';
import 'package:ecommerce/Widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  int selectedFilter = 0;

  List<String> filters = ["All", "Nike", "Puma", "Addidas", "Bata"];

  @override
  Widget build(BuildContext context) {
    // inherited widget
    // final size = MediaQuery.of(context).size;

    // inherited model
    final size = MediaQuery.sizeOf(context);
    const OutlineInputBorder myBorder = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(
          34,
        ),
      ),
      borderSide: BorderSide(
        color: Colors.white,
      ),
    );
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Shopping \n App",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      enabledBorder: myBorder,
                      focusedBorder: myBorder,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = index;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == index
                            ? Theme.of(context).primaryColor
                            : null,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            18,
                          ),
                          side: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        label: Text(filter),
                      ),
                    ),
                  );
                },
              ),
            ),
            size.width > 1080
                ? Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1.8),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final Map product = products[index];
                        return GestureDetector(
                          onTap: () {
                            // Navigator.of(context)
                            //     .pushReplacement(CupertinoPageRoute(
                            //   builder: (context) => const ProductDetail(),
                            // ));

                            // Navigator.of(context).push(
                            //   CupertinoPageRoute(
                            //     builder: (context) =>
                            //         ProductDetail(product: product),
                            //   ),
                            // );

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetail(product: product),
                              ),
                            );
                          },
                          child: ProductCard(
                            bgColor: index.isEven
                                ? const Color.fromRGBO(216, 240, 253, 1)
                                : const Color.fromRGBO(245, 247, 249, 1),
                            product: product,
                          ),
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final Map product = products[index];
                        return GestureDetector(
                          onTap: () {
                            // Navigator.of(context)
                            //     .pushReplacement(CupertinoPageRoute(
                            //   builder: (context) => const ProductDetail(),
                            // ));

                            // Navigator.of(context).push(
                            //   CupertinoPageRoute(
                            //     builder: (context) =>
                            //         ProductDetail(product: product),
                            //   ),
                            // );

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetail(product: product),
                              ),
                            );
                          },
                          child: ProductCard(
                            bgColor: index.isEven
                                ? const Color.fromRGBO(216, 240, 253, 1)
                                : const Color.fromRGBO(245, 247, 249, 1),
                            product: product,
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
