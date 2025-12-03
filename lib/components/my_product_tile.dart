import 'package:flutter/material.dart';
import 'package:minimal_ecomerce_app/models/product.dart';
import 'package:minimal_ecomerce_app/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  void addToCart(BuildContext context) {
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
              context.read<Shop>().addToCart(product);
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(25.0),
      width: 300,
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.all(25.0),
                  child: Image.asset(product.imagePath),
                ),
              ),
              SizedBox(height: 25.0),
              Text(
                product.name,
                style: TextStyle(
                  fontFamily: 'Roboto-Condensed',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                product.description,
                style: TextStyle(
                  fontFamily: 'Roboto-Condensed',
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: TextStyle(fontFamily: 'Roboto-Condensed'),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
