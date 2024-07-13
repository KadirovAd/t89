import 'package:flutter/material.dart';
import 'package:t89/src/presentation/screen/product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductScreen(),
      // onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
