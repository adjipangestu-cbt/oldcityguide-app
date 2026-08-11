import 'package:oldcityguideapp/core/api_constanta.dart';
import 'package:oldcityguideapp/core/helper/api_manager.dart';
import 'package:oldcityguideapp/core/modules/history/domain/dto/history_item_dto.dart';
import 'package:oldcityguideapp/core/modules/history/domain/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final ApiManager apiManager;
  const HistoryRepositoryImpl({required this.apiManager});

  @override
  Future<List<HistoryItemDto>> getData() async {
    final result = await apiManager.getData(ApiConstanta.histories());
    final data = result as List<dynamic>;
    return data.map((item) {
      final parsedItem = item as Map<String, dynamic>;
      final List<String> imageUrls = (parsedItem['images'] as List)
          .map((img) =>
              ApiConstanta.baseUrl.replaceAll("api", "") + img['image_url'])
          .toList();

      final destinationId = int.tryParse(parsedItem['destination_id']) ?? 0;
      return HistoryItemDto(
          destinationId: destinationId,
          name: parsedItem['title'],
          desc: parsedItem['content'],
          imageurls: imageUrls);
    }).toList();
  }
}
