import 'package:flutter/material.dart';
import 'package:minimal_ecomerce_app/components/my_button.dart';
import 'package:minimal_ecomerce_app/models/product.dart';
import 'package:minimal_ecomerce_app/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          "Add this item to your cart?",
          style: TextStyle(fontFamily: 'Roboto-Condensed'),
        ),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              "Cancel",
              style: TextStyle(fontFamily: 'Roboto-Condensed'),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<Shop>().removeFromCart(product);
            },
            child: Text(
              "Yes",
              style: TextStyle(fontFamily: 'Roboto-Condensed'),
            ),
          ),
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          "User wants to pay! Connect to payment gateway..",
          style: TextStyle(fontFamily: 'Roboto-Condensed'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(
          context,
        ).colorScheme.onSurface, // back arrow color
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cart text under the AppBar
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28.0,
              vertical: 16.0,
            ),
            child: Text(
              "Cart",
              style: TextStyle(
                fontFamily: 'Roboto-Condensed',
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),

          Expanded(
            child: cart.isEmpty
                ? Center(
                    child: Text(
                      "Cart is empty..",
                      style: TextStyle(
                        fontFamily: 'Roboto-Condensed',
                        fontSize: 18,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return ListTile(
                        title: Text(
                          item.name,
                          style: TextStyle(fontFamily: 'Roboto-Condensed'),
                        ),
                        subtitle: Text(
                          "\$${item.price.toStringAsFixed(2)}",
                          style: TextStyle(fontFamily: 'Roboto-Condensed'),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => removeFromCart(context, item),
                        ),
                      );
                    },
                  ),
          ),

          // Pay button
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: SizedBox(
              width: double.infinity,
              child: MyButton(
                onTap: () => payButtonPressed(context),
                child: Center(
                  child: Text(
                    "P A Y   N O W",
                    style: TextStyle(
                      fontFamily: 'Roboto-Condensed',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
