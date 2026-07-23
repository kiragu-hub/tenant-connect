class PropertyModel {
  final String image;
  final String title;
  final String location;
  final String price;
  final String description;
  final String propertyType;

  final int bedrooms;
  final int dining;
  final int bathrooms;
  final List<String> amenities;

  const PropertyModel({
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.description,
    required this.propertyType,
    required this.bedrooms,
    required this.dining,
    required this.bathrooms,
    required this.amenities,
  });
}