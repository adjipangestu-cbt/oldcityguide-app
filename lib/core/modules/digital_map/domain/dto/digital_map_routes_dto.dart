import 'package:latlong2/latlong.dart';
import 'package:oldcityguideapp/core/modules/digital_map/domain/dto/digital_map_dto.dart';
import 'package:oldcityguideapp/core/modules/digital_map/domain/dto/point_destination_dto.dart';

class DigitalMapRoutesDto extends DigitalMapDto {
  final List<LatLng> routesPath;
  final List<PointDestinationDto> points;

  DigitalMapRoutesDto({
    required super.id,
    required super.name,
    required super.destinationId,
    required super.description,
    required this.routesPath,
    required this.points,
  });
}
