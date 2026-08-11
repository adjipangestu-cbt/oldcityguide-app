class FoodCulinaryDto {
  final String name;
  final List<String> imageUrls;
  final List<String> ytUrls;
  final String desc;
  final int destinationId;
  final String address;

  FoodCulinaryDto({
    required this.destinationId,
    required this.name,
    required this.imageUrls,
    required this.ytUrls,
    required this.desc,
    required this.address,
  });
}
