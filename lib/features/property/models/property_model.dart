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
      id: int.parse(json["id"].toString()),
      landlordId: int.parse(json["landlord_id"].toString()),
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      propertyType: json["property_type"] ?? "",
      location: json["location"] ?? "",
      price: double.parse(json["price"].toString()),
      bedrooms: int.parse(json["bedrooms"].toString()),
      bathrooms: int.parse(json["bathrooms"].toString()),
      diningRooms: int.parse(json["dining_rooms"].toString()),
      amenities: json["amenities"] ?? "",
      image: json["image"] ?? "",
      status: json["status"] ?? "",
    );
  }
}