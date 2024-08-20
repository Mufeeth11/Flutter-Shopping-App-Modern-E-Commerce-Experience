import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cartprovider.dart';
import 'package:shopping_app/global_variable.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, Object> dul;
  const ProductDetailPage({
    super.key,
    required this.dul,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int? ontap;
  void onTapFunction() {
    if (ontap != null) {
      final size = widget.dul['Size'] as List<int>;
      Provider.of<Cartprovider>(context, listen: false).add(
        {
          'Images': widget.dul['Images'],
          'title': widget.dul['title'],
          'Size': size[ontap!],
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(microseconds: 1),
          content: Text('Product Added Successfully!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(microseconds: 1),
          content: Text('Please Selected Size'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<int> list = widget.dul['Size'] as List<int>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Details',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              widget.dul['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Image.asset(widget.dul['Images'] as String),
          ),
          const Spacer(flex: 2),
          Container(
            width: double.infinity,
            height: 250,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(36, 112, 173, 150),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text('${widget.dul['Des']}'),
                Text(
                  '\$ ${widget.dul['prices']}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: 80,
                        child: ListView.builder(
                          itemCount: list.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      ontap = index;
                                    },
                                  );
                                },
                                child: Chip(
                                  padding: const EdgeInsets.all(10),
                                  backgroundColor: ontap == index
                                      ? const Color.fromARGB(255, 207, 189, 200)
                                      : null,
                                  label: Text(
                                    '${list[index]}',
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    onTapFunction();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    minimumSize: const Size(double.infinity, 50),
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text(
                    'Add To Cart',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
