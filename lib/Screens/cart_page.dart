import 'package:ecommerce/Providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> cartItems = Provider.of<CartProvider>(context).cartItem;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            Map currentItem = cartItems[index];
            return ListTile(
              title: Text(
                currentItem['title'],
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text(
                "\$   ${currentItem['price'].toString()},",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Alert"),
                      content: const Text(
                          "Do You Really Want To Delete This Item ?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "no",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .removeItem(currentItem);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "yes",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  size: 30,
                  color: Colors.red,
                ),
              ),
              leading: CircleAvatar(
                child: Image(
                  image: AssetImage(
                    currentItem['imageUrl'],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
