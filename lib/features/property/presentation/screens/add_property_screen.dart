import 'package:flutter/material.dart';
import 'package:tenantconnect/services/api_service.dart';
import 'package:tenantconnect/services/session_service.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final priceController = TextEditingController();
  final bedroomsController = TextEditingController();
  final bathroomsController = TextEditingController();
  final diningController = TextEditingController();
  final amenitiesController = TextEditingController();
  final imageController = TextEditingController();

  String propertyType = "Apartment";

  bool loading = false;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    priceController.dispose();
    bedroomsController.dispose();
    bathroomsController.dispose();
    diningController.dispose();
    amenitiesController.dispose();
    imageController.dispose();
    super.dispose();
  }

 Future<void> saveProperty() async {
  if (!_formKey.currentState!.validate()) return;

  setState(() {
    loading = true;
  });

  final user = await SessionService.getUser();

  if (!mounted) return;

  final int? landlordId = user["id"];

  if (landlordId == null) {
    setState(() {
      loading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please login again"),
      ),
    );
    return;
  }

  final result = await ApiService.addProperty(
    landlordId: landlordId,
    title: titleController.text,
    description: descriptionController.text,
    propertyType: propertyType,
    location: locationController.text,
    price: double.parse(priceController.text),
    bedrooms: int.parse(bedroomsController.text),
    bathrooms: int.parse(bathroomsController.text),
    diningRooms: int.parse(diningController.text),
    amenities: amenitiesController.text,
    image: imageController.text,
    status: "Available",
  );

  if (!mounted) return;

  setState(() {
    loading = false;
  });

  if (result["success"] == true) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Property added successfully"),
      ),
    );

    Navigator.pop(context, true);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(result["message"]),
      ),
    );
  }
}

  Widget buildField(
      String label,
      TextEditingController controller, {
      TextInputType keyboard = TextInputType.text,
      int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboard,
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Required";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Add Property"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(

          key: _formKey,

          child: Column(

            children: [

              buildField("Property Title", titleController),

              buildField(
                "Description",
                descriptionController,
                maxLines: 4,
              ),

              DropdownButtonFormField<String>(
              initialValue: propertyType,
                decoration: const InputDecoration(
                  labelText: "Property Type",
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Apartment",
                    child: Text("Apartment"),
                  ),
                  DropdownMenuItem(
                    value: "House",
                    child: Text("House"),
                  ),
                  DropdownMenuItem(
                    value: "Bedsitter",
                    child: Text("Bedsitter"),
                  ),
                  DropdownMenuItem(
                    value: "Office",
                    child: Text("Office"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    propertyType = value!;
                  });
                },
              ),

              const SizedBox(height: 15),

              buildField("Location", locationController),

              buildField(
                "Price",
                priceController,
                keyboard: TextInputType.number,
              ),

              buildField(
                "Bedrooms",
                bedroomsController,
                keyboard: TextInputType.number,
              ),

              buildField(
                "Bathrooms",
                bathroomsController,
                keyboard: TextInputType.number,
              ),

              buildField(
                "Dining Rooms",
                diningController,
                keyboard: TextInputType.number,
              ),

              buildField("Amenities", amenitiesController),

              buildField(
                "Image Filename",
                imageController,
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: loading ? null : saveProperty,
                  child: loading
                      ? const CircularProgressIndicator()
                      : const Text("SAVE PROPERTY"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}