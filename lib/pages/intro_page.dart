import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
            Transform.scale(
              scale: 3.5,
              child: Lottie.network(
                'https://lottie.host/a28e5df3-afcd-4ce6-83ae-b6edcd657138/URARCa9zZ9.json',
                width: 150,
                height: 150,
                repeat: true,
                animate: true,
              ),
            ),
            Text(
              "MINIMAL SHOP",
              style: TextStyle(
                fontFamily: 'Roboto-Condensed',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Made By Batoutiva",
              style: TextStyle(
                fontFamily: 'Roboto-Condensed',
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
