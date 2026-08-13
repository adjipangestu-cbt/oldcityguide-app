import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:oldcityguideapp/core/api_constanta.dart';
import 'package:oldcityguideapp/core/helper/api_manager.dart';
import 'package:oldcityguideapp/core/modules/history/domain/dto/history_item_dto.dart';
import 'package:oldcityguideapp/core/modules/history/domain/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final ApiManager apiManager;
  const HistoryRepositoryImpl({required this.apiManager});

  // Tambahkan parameter languageCode di sini (default 'id')
  @override
  Future<List<HistoryItemDto>> getData({String languageCode = 'id'}) async {
    try {
      // Tentukan file JSON berdasarkan parameter bahasa yang dikirim
      String jsonPath = 'assets/data/histories_id.json';
      if (languageCode == 'en') {
        jsonPath = 'assets/data/histories_en.json';
      }

      // Baca file JSON lokal
      final String jsonString = await rootBundle.loadString(jsonPath);
      final data = json.decode(jsonString) as List<dynamic>;

      return data.map((item) {
        final parsedItem = item as Map<String, dynamic>;
        
        final List<String> imageUrls = (parsedItem['images'] as List)
            .map((img) =>
                ApiConstanta.baseUrl.replaceAll("api", "") + img['image_url'])
            .toList();

        final destinationId = int.tryParse(parsedItem['destination_id'].toString()) ?? 0;
        
        return HistoryItemDto(
            destinationId: destinationId,
            name: parsedItem['title'],
            desc: parsedItem['content'],
            imageurls: imageUrls);
      }).toList();
      
    } catch (e) {
      print("Gagal memuat data sejarah lokal: $e");
      return [];
    }
  }
}