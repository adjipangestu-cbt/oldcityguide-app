import 'package:latlong2/latlong.dart';

class PointDestinationDto {
  final int order;
  final String name;
  final String description;
  final LatLng location;

  const PointDestinationDto({
    required this.order,
    required this.name,
    required this.description,
    required this.location,
  });
}
