import 'package:flutter/material.dart';
import 'package:minimal_ecomerce_app/components/my_drawer.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Page"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MyDrawer(),
    );
  }
}
