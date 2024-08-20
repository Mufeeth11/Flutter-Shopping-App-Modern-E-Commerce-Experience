import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/global_variable.dart';
import 'package:shopping_app/product.dart';
import 'package:shopping_app/productDetailPage.dart';
// import 'package:flutter/widgets.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late String tap;
  final List<String> company = const [
    'All',
    'Adidas',
    'Puma',
    'Nike',
    'Asians',
    'Walkaroo',
    'Vkc Pride'
  ];
  var original = products;
  @override
  void initState() {
    super.initState();
    tap = company[0];
  }

  @override
  Widget build(BuildContext context) {
    const borderOf = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );
    return SafeArea(
      child: Column(
        children: [
          //Heading

          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Shoes\nCollections',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: borderOf,
                    enabledBorder: borderOf,
                    focusedBorder: borderOf,
                  ),
                ),
              )
            ],
          ),
          // Chip

          SizedBox(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: company.length,
                itemBuilder: (context, index) {
                  final String filter = company[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          tap = filter;
                          if (tap != 'All') {
                            for (int i = 0; i < products.length; i++) {
                              if (products[i]['Company'] == tap) {
                                List<Map<String, Object>> temp = [];
                                temp.add(products[i]);
                                original = temp;
                                print(original);
                              }
                            }
                          } else {
                            original = products;
                          }
                        });
                      },
                      child: Chip(
                        backgroundColor: tap == filter
                            ? const Color.fromRGBO(102, 84, 94, 100)
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        label: Text(filter),
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        // color: const WidgetStatePropertyAll(
                        //   tap == fliter: red ? Colors.white,
                        // ),
                        side: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: original.length,
              itemBuilder: (context, index) {
                final tempT = original[index];
                final productName = tempT['title'];
                final productPrice = tempT['prices'];
                final imageLoc = tempT['Images'];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailPage(dul: tempT);
                        },
                      ),
                    );
                  },
                  child: Prod(
                    productName: productName,
                    productPrice: productPrice,
                    imageLocation: imageLoc,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
