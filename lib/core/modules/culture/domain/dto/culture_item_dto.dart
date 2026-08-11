class CultureItemDto {
  final String name;
  final String desc;
  final int destinationId;
  final List<String> imageurls;

  CultureItemDto({
    required this.name,
    required this.destinationId,
    required this.desc,
    required this.imageurls,
  });
}
