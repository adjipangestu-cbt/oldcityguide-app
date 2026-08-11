import 'package:latlong2/latlong.dart';

class HistoryItemDto {
  final String name;
  final String desc;
  final List<String> imageurls;
  final LatLng? location;
  final int destinationId;

  HistoryItemDto(
      {required this.name,
      required this.destinationId,
      required this.desc,
      required this.imageurls,
      this.location});
}
