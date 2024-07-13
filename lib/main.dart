import 'package:flutter/material.dart';
import 'package:t89/src/core/navigator/navbar_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavbarView(),
      // onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
