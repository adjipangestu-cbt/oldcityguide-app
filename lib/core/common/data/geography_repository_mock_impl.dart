import 'package:oldcityguideapp/core/common/data/geography_mock_data.dart';
import 'package:oldcityguideapp/core/common/domain/dto/gegraphy_dto.dart';
import 'package:oldcityguideapp/core/common/domain/repositories/geography_repository.dart';

class GeographyMockRepositoryImpl implements GeographyRepository {
  @override
  Future<List<GeographyDto>> getDestinations({String locale = 'id'}) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return geographyMockDataByLocale[locale] ?? geographyMockData;
  }

  @override
  Future<List<GeographyDto>> getGeographyGroupByDestinations({String locale = 'id'}) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return geographyMockDataByLocale[locale] ?? geographyMockData;
  }
}
