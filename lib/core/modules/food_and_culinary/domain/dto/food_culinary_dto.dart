class FoodCulinaryDto {
  final int id;
  final String name;
  final List<String> imageUrls;
  final List<String> ytUrls;
  final String desc;
  final int destinationId;
  final String address;
  // New fields for mock data
  final double latitude;
  final double longitude;
  final String markerTitle;
  final double rating;
  final String yearEstablished;
  final String category;
  final bool isLegendary;
  final String city; // "Lasem" | "Malang"

  FoodCulinaryDto({
    this.id = 0,
    required this.destinationId,
    required this.name,
    required this.imageUrls,
    required this.ytUrls,
    required this.desc,
    required this.address,
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.markerTitle = '',
    this.rating = 0.0,
    this.yearEstablished = '',
    this.category = '',
    this.isLegendary = false,
    this.city = 'Lasem',
  });
}
