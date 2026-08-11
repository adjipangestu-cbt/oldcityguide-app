import 'package:oldcityguideapp/core/api_constanta.dart';
import 'package:oldcityguideapp/core/helper/api_manager.dart';
import 'package:oldcityguideapp/core/modules/culture/domain/dto/culture_item_dto.dart';
import 'package:oldcityguideapp/core/modules/culture/domain/repositories/culture_repository.dart';

class CultureRepositoryImpl implements CultureRepository {
  final ApiManager apiManager;
  const CultureRepositoryImpl({required this.apiManager});

  @override
  Future<List<CultureItemDto>> getData() async {
    final result = await apiManager.getData(ApiConstanta.cultures());
    final data = result as List<dynamic>;
    return data.map((item) {
      final parsedItem = item as Map<String, dynamic>;
      final List<String> imageUrls = (parsedItem['images'] as List)
          .map((img) =>
              ApiConstanta.baseUrl.replaceAll("api", "") + img['image_url'])
          .toList();
      final int destinationId = int.tryParse(item['destination_id']) ?? 0;

      return CultureItemDto(
          destinationId: destinationId,
          name: parsedItem['title'],
          desc: parsedItem['content'],
          imageurls: imageUrls);
    }).toList();
  }
}
