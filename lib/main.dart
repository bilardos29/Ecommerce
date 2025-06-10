import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/feature/cart/cart_presenter.dart';
import 'package:ecommerce_app/feature/detail_product/detail_product_presenter.dart';
import 'package:ecommerce_app/feature/home/home_presenter.dart';

import 'feature/home/home_screen.dart';
import 'feature/login/login_presenter.dart';
import 'feature/search/search_presenter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => LoginPresenter(),
          ),
          ChangeNotifierProvider(
            create: (context) => HomePresenter(),
          ),
          ChangeNotifierProvider(
            create: (context) => DetailProductPresenter(),
          ),
          ChangeNotifierProvider(
            create: (context) => SearchPresenter(),
          ),
          ChangeNotifierProvider(
            create: (context) => CartPresenter(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
            ),
            home: const HomeScreen()));
  }
}