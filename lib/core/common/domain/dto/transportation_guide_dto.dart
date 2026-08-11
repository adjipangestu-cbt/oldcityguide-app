class TransportationGuideDto {
  final int destinationId;
  final String title;
  final List<String> guides;

  TransportationGuideDto(
      {this.destinationId = 0, required this.title, required this.guides});
}
