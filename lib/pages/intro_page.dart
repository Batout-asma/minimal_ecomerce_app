import 'package:flutter/material.dart';
import 'package:minimal_ecomerce_app/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            SizedBox(height: 25),
            Text(
              "Minimal Shop",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              "Premium Quality Products",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            SizedBox(height: 25),
            MyButton(
              child: Icon(Icons.arrow_forward),
              onTap: () => Navigator.pushNamed(context, '/shop_page'),
            ),
          ],
        ),
      ),
    );
  }
}
