import 'package:flutter/material.dart';
import '../models/inventory.dart';
import 'shopping_screen.dart';

class InventoryScreen extends StatefulWidget {
  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  late List<Inventory> inventoryList;

  @override
  void initState() {
    super.initState();
    // Load dummy data
    inventoryList = Inventory.getDummyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Inventory Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  _buildButton(context, 'Start Shopping', Icons.shopping_cart),
                  _buildButton(context, 'Your Carts', Icons.shopping_basket),
                  _buildButton(context, 'Analytics', Icons.analytics),
                  _buildButton(context, 'Settings', Icons.settings),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, IconData icon) {
    return ElevatedButton(
      onPressed: () {
        if (text == 'Start Shopping') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShoppingScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$text button pressed')),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40.0),
          SizedBox(height: 8.0),
          Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }
}
