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
    final List<Map<String, Object>> allData = [];

    try {
      // ── 1. Load data Lasem dari destinations_id/en.json ──
      final String lasemFileName = languageCode == 'en' 
          ? 'destinations_en.json' 
          : 'destinations_id.json';

      final String lasemJson = await rootBundle.loadString('assets/data/$lasemFileName');
      final lasemResult = json.decode(lasemJson) as List<dynamic>;

      for (final item in lasemResult) {
        allData.add(_parseItem(item as Map<String, dynamic>));
      }
    } catch (e) {
      print('Gagal memuat data Lasem vacation: $e');
    }

    try {
      // ── 2. Load data Malang dari destinations_malang_id/en.json ──
      final String malangFileName = languageCode == 'en'
          ? 'destinations_malang_en.json'
          : 'destinations_malang_id.json';

      final String malangJson = await rootBundle.loadString('assets/data/$malangFileName');
      final malangResult = json.decode(malangJson) as List<dynamic>;

      for (final item in malangResult) {
        allData.add(_parseMalangItem(item as Map<String, dynamic>));
      }
    } catch (e) {
      print('Gagal memuat data Malang vacation: $e');
    }

    if (allData.isEmpty) {
      throw Exception('Gagal memuat data vacation');
    }

    return allData;
  }

  /// Parse item Lasem (gambar dari server API)
  Map<String, Object> _parseItem(Map<String, dynamic> map) {
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
  }

  /// Parse item Malang (gambar bisa lokal asset atau server)
  Map<String, Object> _parseMalangItem(Map<String, dynamic> map) {
    final imagesList = map['images'] as List<dynamic>? ?? [];
    final images = imagesList.map((img) {
      final imgMap = img as Map<String, dynamic>;
      final String imageUrl = imgMap['image_url'] as String? ?? '';
      if (imageUrl.startsWith('assets/')) {
        return imageUrl;
      } else {
        return ApiConstanta.baseUrl.replaceAll("api", "") + imageUrl;
      }
    }).toList();
        
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
  }
}