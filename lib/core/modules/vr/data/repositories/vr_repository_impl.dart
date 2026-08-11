import 'package:oldcityguideapp/core/api_constanta.dart';
import 'package:oldcityguideapp/core/helper/api_manager.dart';
import 'package:oldcityguideapp/core/modules/vr/domain/dto/vr_dto.dart';
import 'package:oldcityguideapp/core/modules/vr/domain/repositories/vr_repository.dart';

class VrRepositoryImpl implements VrRepository {
  final ApiManager apiManager;
  const VrRepositoryImpl({required this.apiManager});

  @override
  Future<List<VrDto>> getData() async {
    final result = await apiManager.getData(ApiConstanta.vr());
    final data = result as List<dynamic>;
    return data.map((item) {
      final parsedItem = item as Map<String, dynamic>;
      final destinationId = int.tryParse(
              parsedItem['tourist_destination']['destination_id'].toString()) ??
          0;
      return VrDto(
          name: parsedItem['title'],
          destinationId: destinationId,
          imageUrl: ApiConstanta.baseUrl.replaceAll("/api", "/") +
              parsedItem['image_url']);
    }).toList();
  }
}
