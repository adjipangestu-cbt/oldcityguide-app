import 'package:oldcityguideapp/core/modules/food_and_culinary/data/culinary_mock_data.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/domain/dto/food_culinary_dto.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/domain/repositories/culinary_repository.dart';

class CulinaryRepositoryMockImpl implements CulinaryRepository {
  @override
  Future<List<FoodCulinaryDto>> getData() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return culinaryMockData;
  }
}
