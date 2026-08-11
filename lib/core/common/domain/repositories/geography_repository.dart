import 'package:oldcityguideapp/core/common/domain/dto/gegraphy_dto.dart';

abstract class GeographyRepository {
  Future<List<GeographyDto>> getDestinations();
  Future<List<GeographyDto>> getGeographyGroupByDestinations();
}
