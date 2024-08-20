import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cartprovider.dart';
import 'package:shopping_app/global_variable.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cartprovider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              if (cart.isEmpty != true) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Delete Product',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: Text(
                        'Are Sure To Clear All',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Provider.of<Cartprovider>(context, listen: false)
                                .clearAll();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text('All Items Removed!'),
                              ),
                            );
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'N0',
                              style: TextStyle(color: Colors.blue),
                            ))
                      ],
                    );
                  },
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text(
                      'No Items In the Cart!',
                    ),
                  ),
                );
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Clear All',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cardItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cardItem['Images'] as String),
              radius: 30,
            ),
            title: Text(
              cardItem['title'] as String,
              style: TextStyle(
                fontSize: 23,
              ),
            ),
            subtitle: Text(
              'Size: ${cardItem['Size']}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "Delete Product",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: Text(
                        'Are You Sure To Remove The ${cardItem['title']}',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<Cartprovider>(context, listen: false)
                                .remove(cardItem);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Item Removed',
                                ),
                              ),
                            );
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    );
                  },
                );
                // Provider.of<Cartprovider>(context, listen: false)
                //     .remove(cardItem);
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(
                //     content: Text(
                //       'Item Removed',
                //     ),
                //   ),
                // );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
