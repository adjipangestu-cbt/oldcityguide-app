import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:oldcityguideapp/core/api_constanta.dart';
import 'package:oldcityguideapp/core/helper/api_manager.dart';
import 'package:oldcityguideapp/core/modules/vacation/domain/repositories/vacation_repository.dart';

class VacationRepositoryImpl implements VacationRepository {
  final ApiManager apiManager;
  const VacationRepositoryImpl({required this.apiManager});

  @override
  // Tambahkan parameter languageCode di sini
  Future<List<Map<String, Object>>> getVacationsList({String languageCode = 'id'}) async {
    try {
      // 1. Tentukan nama file. Kita pakai file destinations karena datanya sama
      final String fileName = languageCode == 'en' 
          ? 'destinations_en.json' 
          : 'destinations_id.json';

      // 2. Baca file JSON dari folder assets
      final String jsonString = await rootBundle.loadString('assets/data/$fileName');
      
      // 3. Decode JSON menjadi List<dynamic>
      final result = json.decode(jsonString) as List<dynamic>;

      // 4. Mapping data sesuai format Anda sebelumnya (URL gambar tetap dari server)
      return result.map((item) {
        final map = item as Map<String, dynamic>;
        
        final imagesList = map['images'] as List<dynamic>? ?? [];
        final images = imagesList
            .map((img) =>
                ApiConstanta.baseUrl.replaceAll("api", "") +
                (img as Map<String, dynamic>)['image_url'])
            .toList();
            
        final destinationMap = map['destination'] as Map<String, dynamic>?;
        final int destinationid = destinationMap != null ? (destinationMap['id'] ?? 0) : 0;
        
        return {
          'name': map['name']?.toString() ?? '',
          'destination_id': destinationid,
          'images': images,
          'description': map['description']?.toString() ?? '',
          'latitude': double.tryParse(map['latitude']?.toString() ?? '0') ?? 0.0,
          'longitude': double.tryParse(map['longitude']?.toString() ?? '0') ?? 0.0,
        };
      }).toList();
    } catch (e) {
      throw Exception('Gagal memuat data vacation lokal: $e');
    }
  }
}