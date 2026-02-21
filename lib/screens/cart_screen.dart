import 'package:flutter/material.dart';
import 'package:shopatyourownpace_new/models/product_model.dart';

class CartScreen extends StatefulWidget {
  final List<ProductModel> cart;
  const CartScreen({super.key, required this.cart});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final items = widget.cart;
    final total = items.fold<double>(0, (sum, it) => sum + it.price);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: items.isEmpty ? _buildEmptyCart() : _buildCartList(items, total),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 170,
              child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/2038/2038854.png'),
            ),
            const SizedBox(height: 20),
            const Text("Your Cart is Empty",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text(
                "Looks like you haven't added anything yet.\nBrowse products and add to cart!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16)),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () => DefaultTabController.of(context).animateTo(0),
              child: const Text("Start Shopping"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartList(List<ProductModel> items, double total) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, i) {
              final it = items[i];
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: SizedBox(
                    width: 56,
                    child: Image.network(it.image, fit: BoxFit.contain),
                  ),
                  title: Text(it.name),
                  subtitle: Text("Rs ${it.price}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => setState(() => items.removeAt(i)),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total: Rs ${total.toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              ElevatedButton(
                onPressed: () {
                  setState(() => items.clear());
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Order placed (demo)")));
                },
                child: const Text("Checkout"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
