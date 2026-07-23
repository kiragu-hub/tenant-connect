import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tenantconnect/services/api_service.dart';
import 'package:tenantconnect/features/dashboard/presentation/widgets/category_card.dart';
import 'package:tenantconnect/features/dashboard/presentation/widgets/property_card.dart';
import 'package:tenantconnect/features/property/models/property_model.dart';
import 'package:tenantconnect/features/property/presentation/screens/property_details_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String fullname = "User";

  String selectedCategory = "All";

  List<PropertyModel> properties = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUser();
    loadProperties();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();

    if (!mounted) return;

    setState(() {
      fullname = prefs.getString("fullname") ?? "User";
    });
  }

  Future<void> loadProperties() async {
    try {
      final data = await ApiService.getProperties();

      if (!mounted) return;

      setState(() {
        properties =
            data.map<PropertyModel>((e) => PropertyModel.fromJson(e)).toList();
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });
    }
  }

  List<PropertyModel> get filteredProperties {
    if (selectedCategory == "All") {
      return properties;
    }

    return properties
        .where((property) => property.propertyType == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: loadProperties,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                color: const Color(0xff1E2A2F),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello $fullname 👋",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Find your next home",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Search by location...",
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Categories",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = "All";
                              });
                            },
                            child: const CategoryCard(
                              icon: Icons.home,
                              title: "All",
                            ),
                          ),
                          const SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = "Apartment";
                              });
                            },
                            child: const CategoryCard(
                              icon: Icons.apartment,
                              title: "Apartments",
                            ),
                          ),
                          const SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = "House";
                              });
                            },
                            child: const CategoryCard(
                              icon: Icons.house,
                              title: "Houses",
                            ),
                          ),
                          const SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = "Office";
                              });
                            },
                            child: const CategoryCard(
                              icon: Icons.business,
                              title: "Offices",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Featured Properties",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    if (isLoading)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(40),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    else if (filteredProperties.isEmpty)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(30),
                          child: Text(
                            "No properties found.",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    else
                      ...filteredProperties.map(
                        (property) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: PropertyCard(
                            image: property.image,
                            title: property.title,
                            location: property.location,
                            price: property.price,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PropertyDetailsScreen(
                                    property: property,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}