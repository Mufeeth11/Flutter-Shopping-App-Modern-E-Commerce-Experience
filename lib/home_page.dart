import 'package:flutter/material.dart';
import 'package:shopping_app/Cart.dart';
import 'package:shopping_app/global_variable.dart';
import 'package:shopping_app/product.dart';
import 'package:shopping_app/productDetailPage.dart';
import 'package:shopping_app/product_List.dart';
// import 'package:flutter/widgets.dart';

class Shopping extends StatefulWidget {
  const Shopping({super.key});

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  int currentPage = 0;
  List<Widget> Pages = const [
    ProductList(),
    Cart(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: Pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
