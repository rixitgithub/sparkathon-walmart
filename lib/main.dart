import 'package:flutter/material.dart';
import 'screens/inventory_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Inventory Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InventoryScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
