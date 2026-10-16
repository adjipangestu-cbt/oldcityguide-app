import 'package:oldcityguideapp/core/common/domain/dto/gegraphy_dto.dart';

abstract class GeographyRepository {
  Future<List<GeographyDto>> getDestinations({String locale = 'id'});
  Future<List<GeographyDto>> getGeographyGroupByDestinations({String locale = 'id'});
}
