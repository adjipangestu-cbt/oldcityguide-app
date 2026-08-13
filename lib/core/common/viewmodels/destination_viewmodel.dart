import 'package:flutter/material.dart';
import 'package:oldcityguideapp/core/common/domain/dto/destinations_dto.dart';
import 'package:oldcityguideapp/core/common/domain/repositories/destination_repository.dart';

class DestinationViewmodel extends ChangeNotifier {
  final DestinationRepository repository;
  List<DestinationsDto> _destinations = [];
  List<DestinationsDto> get destinations => _destinations;
  DestinationViewmodel({required this.repository});

  // 1. Tambahkan parameter languageCode (default: 'id')
  Future<void> getDestinations({String languageCode = 'id'}) async {
    _destinations = [];
    notifyListeners();
    try {
      // 2. Teruskan parameter languageCode ke repository
      final result = await repository.getDestinations(languageCode: languageCode);
      
      // 3. Ambil opsi "Semua destinasi" sesuai dengan bahasa yang dipilih
      _destinations = [
        DestinationUtils.getDefaultSelectAll(languageCode),
        ...result
      ];
      notifyListeners();
    } catch (e) {
      print(e);
      _destinations = [];
      notifyListeners();
    }
  }
}

class DestinationUtils {
  // 4. Ubah variabel statis menjadi sebuah fungsi agar bisa mendeteksi bahasa
  static DestinationsDto getDefaultSelectAll(String languageCode) {
    return DestinationsDto(
      id: 0,
      name: languageCode == 'en' ? "All destinations" : "Semua destinasi",
      description: "",
      location: "",
      mapEmbedUrl: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      images: [],
    );
  }
}