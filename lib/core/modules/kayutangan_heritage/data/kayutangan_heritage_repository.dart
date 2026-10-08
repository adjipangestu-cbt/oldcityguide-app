import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:oldcityguideapp/core/modules/kayutangan_heritage/domain/dto/kayutangan_heritage_dto.dart';

class KayutanganHeritageRepository {
  Future<List<KayutanganHeritageDto>> getData({String languageCode = 'id'}) async {
    final String fileName = languageCode == 'en'
        ? 'kayutangan_heritage_en.json'
        : 'kayutangan_heritage_id.json';

    try {
      final String jsonString =
          await rootBundle.loadString('assets/data/$fileName');
      final List<dynamic> jsonList = json.decode(jsonString) as List<dynamic>;
      return jsonList
          .map((item) =>
              KayutanganHeritageDto.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Gagal memuat data Kayutangan Heritage: $e');
      throw Exception('Gagal memuat data Kayutangan Heritage');
    }
  }
}
