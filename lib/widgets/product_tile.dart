import 'package:flutter/material.dart';
import 'package:shopatyourownpace_new/models/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  final Function(ProductModel) onAddToCart;
  final Function(ProductModel) onBuyNow;

  const ProductTile({
    super.key,
    required this.product,
    required this.onAddToCart,
    required this.onBuyNow,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // Updated to use local asset images
          Image.asset(product.image, height: 120, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Text("₹${product.price}"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text(product.description, textAlign: TextAlign.center),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => onAddToCart(product),
                child: const Text("Add to Cart"),
              ),
              ElevatedButton(
                onPressed: () => onBuyNow(product),
                child: const Text("Buy Now"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
