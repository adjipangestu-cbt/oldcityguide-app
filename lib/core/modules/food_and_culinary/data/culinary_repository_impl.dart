import 'package:html/parser.dart';
import 'package:oldcityguideapp/core/api_constanta.dart';
import 'package:oldcityguideapp/core/helper/api_manager.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/domain/dto/food_culinary_dto.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/domain/repositories/culinary_repository.dart';

class CulinaryRepositoryImpl implements CulinaryRepository {
  final ApiManager apiManager;
  const CulinaryRepositoryImpl({required this.apiManager});

  @override
  Future<List<FoodCulinaryDto>> getData() async {
    final result = await apiManager.getData(ApiConstanta.culinaries());
    final data = result as List<dynamic>;
    return data.map((item) {
      final parsedItem = item as Map<String, dynamic>;
      final List<String> imageUrls = (parsedItem['images'] as List)
          .map((img) =>
              ApiConstanta.baseUrl.replaceAll("api", "") + img['image_url'])
          .toList();
      final destinationId = int.tryParse(parsedItem['destination_id']) ?? 0;
      return FoodCulinaryDto(
          destinationId: destinationId,
          address: parsedItem['address'],
          desc: parsedItem['description'],
          ytUrls: [],
          name: parsedItem['name'],
          imageUrls: imageUrls);
    }).toList();
  }
}
