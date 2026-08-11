import 'package:latlong2/latlong.dart';
import 'package:oldcityguideapp/core/api_constanta.dart';
import 'package:oldcityguideapp/core/helper/api_manager.dart';
import 'package:oldcityguideapp/core/modules/digital_map/domain/dto/digital_map_dto.dart';
import 'package:oldcityguideapp/core/modules/digital_map/domain/dto/digital_map_routes_dto.dart';
import 'package:oldcityguideapp/core/modules/digital_map/domain/dto/point_destination_dto.dart';
import 'package:oldcityguideapp/core/modules/digital_map/domain/repositories/digital_map_repository.dart';

class DigitalMapRepositoryImpl implements DigitalMapRepository {
  final ApiManager apiManager;
  const DigitalMapRepositoryImpl({required this.apiManager});

  @override
  Future<List<DigitalMapDto>> getAllDigitalMaps() async {
    final result = await apiManager.getData(ApiConstanta.tourRutesMaps());
    final data = result as List<dynamic>;
    return data.map((item) {
      final parsedItem = item as Map<String, dynamic>;
      final destinationId = int.tryParse(parsedItem['destination_id']) ?? 0;
      return DigitalMapDto(
          destinationId: destinationId,
          id: parsedItem['id'],
          name: parsedItem['name'],
          description: parsedItem['description']);
    }).toList();
  }

  @override
  Future<DigitalMapRoutesDto> getDetailPointRoutes(int id) async {
    final result = await apiManager.getData(ApiConstanta.tourRutesMaps(id: id));
    final data = result as Map<String, dynamic>;
    final routes =
        ((data['geojson']?['coordinates'] ?? []) as List<dynamic>).map(
      (route) {
        return LatLng(route[1], route[0]);
      },
    ).toList();
    final points = ((data['points'] ?? []) as List<dynamic>).map(
      (point) {
        final pointParsed = point as Map<String, dynamic>;
        return PointDestinationDto(
          order: int.tryParse(pointParsed['order']) ?? 0,
          name: pointParsed['tourist_destination']['name'],
          description: pointParsed['tourist_destination']['description'],
          location: LatLng(
              double.tryParse(pointParsed['tourist_destination']['latitude']
                      .toString()) ??
                  0,
              double.tryParse(pointParsed['tourist_destination']['longitude']
                      .toString()) ??
                  0),
        );
      },
    ).toList();
    final destinationId = int.tryParse(data['destination_id']) ?? 0;
    return DigitalMapRoutesDto(
      id: id,
      name: data['name'],
      destinationId: destinationId,
      description: data['description'],
      routesPath: routes,
      points: points,
    );
  }
}
