class DigitalMapDto {
  final int id;
  final String name;
  final String description;
  final int destinationId;

  const DigitalMapDto(
      {required this.id,
      required this.destinationId,
      required this.name,
      required this.description});
}
