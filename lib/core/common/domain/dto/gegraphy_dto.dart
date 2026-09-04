import 'package:latlong2/latlong.dart';
import 'package:oldcityguideapp/core/common/domain/dto/transportation_guide_dto.dart';

class GeographyDto {
  final int id;
  final String desc;
  final String name;
  final String title;
  final LatLng latLng;
  final String imageAsset;
  final String markerTitle;
  final List<TransportationGuideDto> transportationGuides;

  GeographyDto({
    required this.id,
    required this.latLng,
    required this.desc,
    required this.name,
    this.title = '',
    this.imageAsset = '',
    this.markerTitle = '',
    required this.transportationGuides,
  });
}
