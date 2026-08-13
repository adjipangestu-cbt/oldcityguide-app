import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:oldcityguideapp/core/api_constanta.dart';
import 'package:oldcityguideapp/core/helper/api_manager.dart';
import 'package:oldcityguideapp/core/modules/culture/domain/dto/culture_item_dto.dart';
import 'package:oldcityguideapp/core/modules/culture/domain/repositories/culture_repository.dart';

class CultureRepositoryImpl implements CultureRepository {
  final ApiManager apiManager;
  const CultureRepositoryImpl({required this.apiManager});

  @override
  // Tambahkan parameter languageCode di sini
  Future<List<CultureItemDto>> getData({String languageCode = 'id'}) async {
    try {
      // 1. Tentukan file JSON berdasarkan bahasa
      final String fileName = languageCode == 'en' ? 'culture_en.json' : 'culture_id.json';

      // 2. Baca file JSON lokal dari folder assets
      final String jsonString = await rootBundle.loadString('assets/data/$fileName');
      final data = json.decode(jsonString) as List<dynamic>;

      // 3. Ubah (Mapping) menjadi format CultureItemDto
      return data.map((item) {
        final parsedItem = item as Map<String, dynamic>;
        
        // Ambil data gambar (jika ada) dan gabungkan dengan Base URL
        final imagesList = parsedItem['images'] as List<dynamic>? ?? [];
        final List<String> imageUrls = imagesList
            .map((img) =>
                ApiConstanta.baseUrl.replaceAll("api", "") + (img as Map<String, dynamic>)['image_url'])
            .toList();
            
        // Ambil ID Destinasi
        final int destinationId = int.tryParse(parsedItem['destination_id'].toString()) ?? 0;

        return CultureItemDto(
            destinationId: destinationId,
            name: parsedItem['title'] ?? '',
            desc: parsedItem['content'] ?? '',
            imageurls: imageUrls);
      }).toList();
      
    } catch (e) {
      print("Gagal memuat data kebudayaan lokal: $e");
      return []; // Kembalikan list kosong jika terjadi error
    }
  }
}