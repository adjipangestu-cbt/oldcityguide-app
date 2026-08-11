import 'package:oldcityguideapp/core/api_constanta.dart';
import 'package:oldcityguideapp/core/helper/api_manager.dart';
import 'package:oldcityguideapp/core/modules/vacation/domain/repositories/vacation_repository.dart';

class VacationRepositoryImpl implements VacationRepository {
  final ApiManager apiManager;
  const VacationRepositoryImpl({required this.apiManager});

  @override
  Future<List<Map<String, Object>>> getVacationsList() async {
    final result = await apiManager.getData(ApiConstanta.vacations());
    final listData = result as List<dynamic>;
    return listData.map((item) {
      final map = item as Map<String, dynamic>;
      final images = (map['images'] as List<dynamic>)
          .map((img) =>
              ApiConstanta.baseUrl.replaceAll("api", "") +
              (img as Map<String, dynamic>)['image_url'])
          .toList();
      final int destinationid = map['destination']['id'] ?? 0;
      return {
        'name': map['name'] as String,
        'destination_id': destinationid,
        'images': images,
        'description': map['description'] as String,
        'latitude': double.tryParse(map['latitude'].toString()) ?? 0,
        'longitude': double.tryParse(map['longitude'].toString()) ?? 0,
      };
    }).toList();
  }
}
