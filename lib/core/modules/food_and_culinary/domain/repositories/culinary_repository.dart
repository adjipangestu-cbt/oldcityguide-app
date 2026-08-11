import 'package:oldcityguideapp/core/modules/food_and_culinary/domain/dto/food_culinary_dto.dart';

abstract class CulinaryRepository {
  Future<List<FoodCulinaryDto>> getData();
}
