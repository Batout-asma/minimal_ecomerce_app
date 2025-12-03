import 'package:flutter/material.dart';
import 'package:minimal_ecomerce_app/models/product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: "Denim Tears Hoodie",
      price: 329.99,
      description: "Black Printed 'Cotton Wreath' Hoodie",
      imagePath: "assets/hoodie.png",
    ),
    Product(
      name: "Dolce & Gabbana Beanie",
      price: 199.99,
      description: "Black Logo-Tag Cashmere-Wool Beanie",
      imagePath: "assets/beanie.png",
    ),
    Product(
      name: "Ray-Ban Glasses",
      price: 159.99,
      description: "RB3757 Kai Bio-Based Gold Frame, Grey Lenses",
      imagePath: "assets/glasses.png",
    ),
    Product(
      name: "Adidas Shoes",
      price: 139.99,
      description: "Adidas Adistar Xlg 2.0 Core Black / Silver Metallic",
      imagePath: "assets/shoes.png",
    ),
  ];
  final List<Product> _cart = [];

  List<Product> get shop => _shop;
  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
