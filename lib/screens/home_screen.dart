import 'package:flutter/material.dart';
import 'package:shopatyourownpace_new/models/product_model.dart';
import 'package:shopatyourownpace_new/widgets/product_tile.dart';

class HomeScreen extends StatelessWidget {
  final List<ProductModel> cart;
  final Function(ProductModel, {bool goToCart}) addToCartCallback;

  const HomeScreen({
    super.key,
    required this.cart,
    required this.addToCartCallback,
  });

  @override
  Widget build(BuildContext context) {
    final products = demoProducts();

    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.68,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductTile(
            product: product,
            onAddToCart: (p) => addToCartCallback(p),
            onBuyNow: (p) => addToCartCallback(p, goToCart: true),
          );
        },
      ),
    );
  }

  List<ProductModel> demoProducts() => [
        ProductModel(
          name: "Smart Watch",
          image: "assets/images/smart_watch.jpg",
          price: 4999,
          description: "Track fitness & notifications.",
        ),
        ProductModel(
          name: "Laptop",
          image: "assets/images/laptop.jpg",
          price: 55000,
          description: "Powerful laptop for work.",
        ),
        ProductModel(
          name: "Mobile Phone",
          image: "assets/images/phone.jpg",
          price: 45000,
          description: "Sleek design.",
        ),
        ProductModel(
          name: "Headphones",
          image: "assets/images/headphones.jpg",
          price: 1999,
          description: "Crisp sound.",
        ),
        ProductModel(
          name: "Nike Shoes",
          image: "assets/images/nike_shoes.jpg",
          price: 3500,
          description: "Comfortable running shoes.",
        ),
        ProductModel(
          name: "T-Shirt",
          image: "assets/images/t-shirt.jpg",
          price: 899,
          description: "Cotton comfortable tee.",
        ),
      ];
}
