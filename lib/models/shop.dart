import 'package:minimal_ecomerce_app/models/product.dart';

class Shop {
  final List<Product> _shop = [
    Product(
      name: "Product 1",
      price: 99.99,
      description: "Item description..",
      // imagePath: imagePath,
    ),
    Product(
      name: "Product 2",
      price: 149.99,
      description: "Item description..",
      // imagePath: imagePath,
    ),
    Product(
      name: "Product 3",
      price: 199.99,
      description: "Item description..",
      // imagePath: imagePath,
    ),
    Product(
      name: "Product 4",
      price: 249.99,
      description: "Item description..",
      // imagePath: imagePath,
    ),
  ];
  List<Product> _cart = [];

  List<Product> get shop => _shop;
  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
  }
}
