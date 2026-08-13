import 'package:oldcityguideapp/core/common/domain/dto/destinations_dto.dart';
import 'package:oldcityguideapp/core/common/domain/repositories/destination_repository.dart';

class DestinationRepositoryImpl implements DestinationRepository {
  @override
  Future<List<DestinationsDto>> getDestinations({String languageCode = 'id'}) async {
    // Kita buat daftar kota statis khusus untuk dropdown (Lasem & Malang)
    // ID 1 untuk Lasem, ID 2 untuk Malang.
    return [
      DestinationsDto(
        id: 1,
        name: "Lasem",
        description: languageCode == 'en' ? "Lasem Heritage City" : "Kota Pusaka Lasem",
        location: "Rembang, Jawa Tengah",
        mapEmbedUrl: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        images: [],
      ),
      DestinationsDto(
        id: 2,
        name: "Malang",
        description: languageCode == 'en' ? "Malang Heritage City" : "Kota Pusaka Malang",
        location: "Malang, Jawa Timur",
        mapEmbedUrl: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        images: [],
      ),
    ];
  }
}