import 'package:latlong2/latlong.dart';
import 'package:oldcityguideapp/core/api_constanta.dart';
import 'package:oldcityguideapp/core/common/domain/dto/gegraphy_dto.dart';
import 'package:oldcityguideapp/core/common/domain/dto/transportation_guide_dto.dart';
import 'package:oldcityguideapp/core/common/domain/repositories/geography_repository.dart';
import 'package:oldcityguideapp/core/helper/api_manager.dart';

class GeographyRepositoryImpl implements GeographyRepository {
  final ApiManager apiManager;
  const GeographyRepositoryImpl({required this.apiManager});

  @override
  Future<List<GeographyDto>> getDestinations() async {
    final result = await apiManager.getData(ApiConstanta.destinations());
    final data = result as List<dynamic>;
    return data.map((item) {
      return GeographyDto(
          id: item['id'],
          name: item['name'],
          desc: item['description'],
          latLng: _parseLatLngFromEmbedMap(item['map_embed_url']),
          transportationGuides: []);
    }).toList();
  }

  LatLng _parseLatLngFromEmbedMap(String embedMapUrl) {
    final regex = RegExp(r'!2d([\-0-9.]+)!3d([\-0-9.]+)');
    final regex2 = RegExp(r"q=(-?\d+\.\d+),(-?\d+\.\d+)");

    final match = regex.firstMatch(embedMapUrl);
    final match2 = regex2.firstMatch(embedMapUrl);

    if (match != null) {
      final longitude = double.parse(match.group(1)!);
      final latitude = double.parse(match.group(2)!);
      return LatLng(latitude, longitude);
    } else if (match2 != null) {
      final longitude = double.parse(match2.group(1)!);
      final latitude = double.parse(match2.group(2)!);
      return LatLng(latitude, longitude);
    } else {
      return LatLng(0.7893,
          113.9213); //use indonesia latitude longitude if it cant parse from embed map
    }
  }

  @override
  Future<List<GeographyDto>> getGeographyGroupByDestinations() async {
    final futureDestination = apiManager.getData(ApiConstanta.destinations());
    final futureTransportaions =
        apiManager.getData(ApiConstanta.transportationGuide());
    final futures =
        await Future.wait([futureDestination, futureTransportaions]);

    final dataDestinations = futures[0] as List<dynamic>;
    final dataTransportationGuides = futures[1] as List<dynamic>;
    final dataDestinationsParsed = dataDestinations.map((item) {
      return GeographyDto(
          id: item['id'],
          name: item['name'],
          desc: item['description'],
          latLng: _parseLatLngFromEmbedMap(item['map_embed_url']),
          transportationGuides: []);
    }).toList();
    final tranportationGuides = dataTransportationGuides.map((item) {
      final link = item['link'];
      final linkText = (link != null && link.isNotEmpty) ? "\n$link" : "";

      return TransportationGuideDto(
          destinationId: int.tryParse(item['destinations_id']) ?? 0,
          title: "From " + item['from_city'],
          guides: [
            "Via${item['via'] ?? ''} ${item['operator'] ?? ''}\n"
                "${item['description'] ?? ''}, Harga: ${item['price'] ?? ''} $linkText"
          ]);
    }).toList();
    return dataDestinationsParsed.map((item) {
      return GeographyDto(
          id: item.id,
          latLng: item.latLng,
          desc: item.desc,
          name: item.name,
          transportationGuides: tranportationGuides
              .where((guide) => guide.destinationId == item.id)
              .toList());
    }).toList();
  }
}
