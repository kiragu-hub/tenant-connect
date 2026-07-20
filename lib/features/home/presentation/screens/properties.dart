import 'package:flutter/material.dart';

class PropertiesScreen extends StatelessWidget {
  const PropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Properties'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text('Sunny Apartment'),
              subtitle: Text('2 Bedroom • Available'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.apartment),
              title: Text('Green Villa'),
              subtitle: Text('3 Bedroom • Rented'),
            ),
          ),
        ],
      ),
    );
  }
}