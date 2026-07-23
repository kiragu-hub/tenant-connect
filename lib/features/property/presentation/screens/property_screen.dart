import 'package:flutter/material.dart';
import 'package:tenantconnect/features/property/models/property_model.dart';
import 'package:tenantconnect/features/property/presentation/screens/add_property_screen.dart';
import 'package:tenantconnect/services/api_service.dart';

class PropertyScreen extends StatefulWidget {
  const PropertyScreen({super.key});

  @override
  State<PropertyScreen> createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen> {
  List<PropertyModel> properties = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadProperties();
  }

 Future<void> loadProperties() async {
  try {
    final data = await ApiService.getProperties();

    if (!mounted) return;

    setState(() {
      properties =
          data.map<PropertyModel>((e) => PropertyModel.fromJson(e)).toList();
      loading = false;
    });
  } catch (e) {
    if (!mounted) return;

    setState(() {
      loading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Error loading properties: $e"),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Properties"),
        centerTitle: true,
      ),

      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : properties.isEmpty
              ? const Center(
                  child: Text(
                    "No properties available",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : RefreshIndicator(
                  onRefresh: loadProperties,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: properties.length,
                    itemBuilder: (context, index) {
                      final property = properties[index];

                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),

                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: property.image.isNotEmpty
                                ? Image.network(
                                    property.image,
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(
                                      Icons.home,
                                      size: 60,
                                    ),
                                  )
                                : const Icon(
                                    Icons.home,
                                    size: 60,
                                  ),
                          ),

                          title: Text(
                            property.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          subtitle: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(property.location),
                              const SizedBox(height: 5),
                              Text(
                                "KSh ${property.price.toStringAsFixed(0)}",
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          trailing: Chip(
                            backgroundColor:
                                property.status == "Available"
                                    ? Colors.green
                                    : Colors.red,
                            label: Text(
                              property.status,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),

                          onTap: () {
                            // Property details screen comes next
                          },
                        ),
                      );
                    },
                  ),
                ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),

        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddPropertyScreen(),
            ),
          );

          if (!mounted) return;

          if (result == true) {
            loadProperties();
          }
        },
      ),
    );
  }
}