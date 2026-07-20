import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          "Welcome to Tenant Connect",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        TextField(
          decoration: InputDecoration(
            hintText: "Search for houses...",
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        const SizedBox(height: 25),

        const Text(
          "Featured Properties",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 15),

        Card(
          child: ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Sunrise Apartments"),
            subtitle: const Text("Athi River • KSh 15,000/month"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(Icons.home_work),
            title: const Text("Green Estate"),
            subtitle: const Text("Syokimau • KSh 22,000/month"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(Icons.apartment),
            title: const Text("City Heights"),
            subtitle: const Text("Nairobi • KSh 35,000/month"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ],
    );
  }
}