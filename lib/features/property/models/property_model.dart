class PropertyModel {
  final int id;
  final int landlordId;
  final String title;
  final String description;
  final String propertyType;
  final String location;
  final double price;
  final int bedrooms;
  final int bathrooms;
  final int diningRooms;
  final String amenities;
  final String image;
  final String status;

  PropertyModel({
    required this.id,
    required this.landlordId,
    required this.title,
    required this.description,
    required this.propertyType,
    required this.location,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.diningRooms,
    required this.amenities,
    required this.image,
    required this.status,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
  return PropertyModel(
    id: int.tryParse(json["id"].toString()) ?? 0,
    landlordId: int.tryParse(json["landlord_id"].toString()) ?? 0,
    title: json["title"]?.toString() ?? "",
    description: json["description"]?.toString() ?? "",
    propertyType: json["property_type"]?.toString() ?? "",
    location: json["location"]?.toString() ?? "",
    price: double.tryParse(json["price"].toString()) ?? 0.0,
    bedrooms: int.tryParse(json["bedrooms"].toString()) ?? 0,
    bathrooms: int.tryParse(json["bathrooms"].toString()) ?? 0,
    diningRooms: int.tryParse(json["dining_rooms"].toString()) ?? 0,
    amenities: json["amenities"]?.toString() ?? "",
    image: json["image"]?.toString() ?? "",
    status: json["status"]?.toString() ?? "",
  );
}
}