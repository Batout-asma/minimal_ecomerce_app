import 'package:flutter/material.dart';
import 'package:minimal_ecomerce_app/components/my_drawer.dart';
import 'package:minimal_ecomerce_app/components/my_product_tile.dart';
import 'package:minimal_ecomerce_app/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/cart_page');
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shop",
                    style: TextStyle(
                      fontFamily: 'Roboto-Condensed',
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Pick from a selected list of premium products:",
                    style: TextStyle(
                      fontFamily: 'Roboto-Condensed',
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 600,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,

                padding: const EdgeInsets.all(15.0),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return MyProductTile(product: product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
