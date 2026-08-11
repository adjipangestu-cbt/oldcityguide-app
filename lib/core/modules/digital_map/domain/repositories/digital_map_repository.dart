import 'package:oldcityguideapp/core/modules/digital_map/domain/dto/digital_map_dto.dart';
import 'package:oldcityguideapp/core/modules/digital_map/domain/dto/digital_map_routes_dto.dart';

abstract class DigitalMapRepository {
  Future<List<DigitalMapDto>> getAllDigitalMaps();
  Future<DigitalMapRoutesDto> getDetailPointRoutes(int id);
}
