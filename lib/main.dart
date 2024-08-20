import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cartprovider.dart';
import 'package:shopping_app/global_variable.dart';
import 'package:shopping_app/home_page.dart';
// import 'package:shopping_app/home_page.dart';
import 'package:shopping_app/productDetailPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cartprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            bodySmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Lato',
          // colorScheme: ColorScheme.fromSeed(
          //   seedColor: const Color.fromRGBO(254, 206, 1, 1),
          //   primary: const Color.fromRGBO(254, 206, 1, 1),
          // ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        home: const Shopping(),
      ),
    );
  }
}
