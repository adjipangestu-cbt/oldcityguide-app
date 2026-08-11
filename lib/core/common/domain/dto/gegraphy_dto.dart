import 'package:latlong2/latlong.dart';
import 'package:oldcityguideapp/core/common/domain/dto/transportation_guide_dto.dart';

class GeographyDto {
  final int id;
  final String desc;
  final String name;
  final LatLng latLng;
  final List<TransportationGuideDto> transportationGuides;

  GeographyDto({
    required this.id,
    required this.latLng,
    required this.desc,
    required this.name,
    required this.transportationGuides,
  });
}
