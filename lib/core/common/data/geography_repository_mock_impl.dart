import 'package:oldcityguideapp/core/common/data/geography_mock_data.dart';
import 'package:oldcityguideapp/core/common/domain/dto/gegraphy_dto.dart';
import 'package:oldcityguideapp/core/common/domain/repositories/geography_repository.dart';

class GeographyMockRepositoryImpl implements GeographyRepository {
  @override
  Future<List<GeographyDto>> getDestinations() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return geographyMockData;
  }

  @override
  Future<List<GeographyDto>> getGeographyGroupByDestinations() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return geographyMockData;
  }
}
