import 'package:flutter/material.dart';
import 'package:minimal_ecomerce_app/models/product.dart';
import 'package:minimal_ecomerce_app/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Add this item to your cart?"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<Shop>().removeFromCart(product);
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final item = cart[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text("\$${item.price.toStringAsFixed(2)}"),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => removeFromCart(context, item),
                  ),
                );
              },
              itemCount: cart.length,
            ),
          ),
        ],
      ),
    );
  }
}
