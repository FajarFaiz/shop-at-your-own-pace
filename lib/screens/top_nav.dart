import 'package:flutter/material.dart';
import 'package:shopatyourownpace_new/screens/home_screen.dart';
import 'package:shopatyourownpace_new/screens/cart_screen.dart';
import 'package:shopatyourownpace_new/screens/profile_screen.dart';
import 'package:shopatyourownpace_new/models/product_model.dart';

class TopNav extends StatefulWidget {
  const TopNav({super.key});

  @override
  State<TopNav> createState() => _TopNavState();
}

class _TopNavState extends State<TopNav> {
  int index = 0;
  List<ProductModel> cart = []; // shared cart across tabs

  @override
  Widget build(BuildContext context) {
    // Screens now receive the shared cart
    final screens = [
      HomeScreen(
        cart: cart,
        addToCartCallback: (product, {bool goToCart = false}) {
          setState(() {
            cart.add(product);
          });

          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Added to Cart")));

          if (goToCart) {
            setState(() => index = 1); // switch to Cart tab
          }
        },
      ),
      CartScreen(cart: cart),
      const ProfileScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: const Text(
          "ShopAtYourOwnPace",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        // ---- TOP NAV BAR USING ICON BUTTONS ----
        actions: [
          IconButton(
            icon: Icon(
              Icons.home_outlined,
              color: index == 0 ? Colors.blue : Colors.black87,
            ),
            onPressed: () => setState(() => index = 0),
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: index == 1 ? Colors.blue : Colors.black87,
            ),
            onPressed: () => setState(() => index = 1),
          ),
          IconButton(
            icon: Icon(
              Icons.person_outline,
              color: index == 2 ? Colors.blue : Colors.black87,
            ),
            onPressed: () => setState(() => index = 2),
          ),
        ],
      ),

      body: IndexedStack(
        index: index,
        children: screens,
      ),
    );
  }
}
