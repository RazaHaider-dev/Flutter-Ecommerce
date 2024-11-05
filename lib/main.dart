import 'package:ecommerce/Providers/cart_provider.dart';
import 'package:ecommerce/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            primary: const Color.fromRGBO(254, 206, 1, 1),
            seedColor: const Color.fromARGB(255, 57, 54, 38),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            bodySmall: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: const HomePage(),
        // home: const ProductDetail(),
        // home: const CartPage(),
      ),
    ),
  );
}
