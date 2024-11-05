import 'package:ecommerce/Screens/cart_page.dart';
import 'package:ecommerce/Screens/product_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  List<Widget> screens = [const ProductList(), const CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: selectedPage == 0 ? const ProductList() : const CartPage(),
      // body: screens[selectedPage],
      body: IndexedStack(index: selectedPage, children: screens),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          iconSize: 34,
          unselectedFontSize: 0,
          selectedFontSize: 0,
          onTap: (value) {
            setState(() {
              selectedPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "",
            ),
          ]),
    );
  }
}
