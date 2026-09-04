import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:oldcityguideapp/core/api_constanta.dart';
import 'package:oldcityguideapp/core/helper/api_manager.dart';
import 'package:oldcityguideapp/core/modules/culture/domain/dto/culture_item_dto.dart';
import 'package:oldcityguideapp/core/modules/culture/domain/repositories/culture_repository.dart';

class CultureRepositoryImpl implements CultureRepository {
  final ApiManager apiManager;
  const CultureRepositoryImpl({required this.apiManager});

  // Daftar file JSON per-subjudul Malang (destination_id = "2")
  static const List<String> _malangFileNames = [
    'Malang sebagai Ruang Persilangan Sejarah dan Budaya Global',
    'Malang Pada Masa Prasejarah',
    'Silang Budaya Malang pada Masa Kerajaan Hindu-Buddha',
    'Malang pada Abad XVI-XVIII',
    'Malang dalam Bayang-bayang Pemerintah Kolonial',
    'Pendidikan di Malang Abad XX',
    'Malang pada Masa Revolusi Fisik, 1945\u20131949',
    'Budaya Materi Malang',
    'Silang Budaya dalam Bahasa Bahasa Walikan',
  ];

  @override
  Future<List<CultureItemDto>> getData({String languageCode = 'id'}) async {
    final List<CultureItemDto> allItems = [];

    try {
      // ── 1. Load data Lasem dari culture_id.json / culture_en.json ──
      final String lasemFileName =
          languageCode == 'en' ? 'culture_en.json' : 'culture_id.json';
      final String lasemJson =
          await rootBundle.loadString('assets/data/$lasemFileName');
      final lasemData = json.decode(lasemJson) as List<dynamic>;

      for (final item in lasemData) {
        final parsed = item as Map<String, dynamic>;
        allItems.add(_parseItem(parsed, languageCode));
      }
    } catch (e) {
      print('Gagal memuat data Lasem: $e');
    }

    // ── 2. Load data Malang dari file per-subjudul ──
    final String suffix = languageCode == 'en' ? '_en.json' : '_id.json';

    for (final name in _malangFileNames) {
      try {
        final String filePath = 'assets/data/$name$suffix';
        final String jsonString = await rootBundle.loadString(filePath);
        final data = json.decode(jsonString) as List<dynamic>;

        for (final item in data) {
          final parsed = item as Map<String, dynamic>;
          allItems.add(_parseMalangItem(parsed));
        }
      } catch (e) {
        print('Gagal memuat file Malang [$name]: $e');
      }
    }

    return allItems;
  }

  /// Parse item dari file Lasem (menggunakan URL API)
  CultureItemDto _parseItem(Map<String, dynamic> item, String languageCode) {
    final imagesList = item['images'] as List<dynamic>? ?? [];
    final List<String> imageUrls = imagesList.map((img) {
      final imgMap = img as Map<String, dynamic>;
      return ApiConstanta.baseUrl.replaceAll('api', '') +
          (imgMap['image_url'] as String);
    }).toList();

    final int destinationId =
        int.tryParse(item['destination_id'].toString()) ?? 0;

    return CultureItemDto(
      destinationId: destinationId,
      name: item['title'] ?? '',
      desc: item['content'] ?? '',
      imageurls: imageUrls,
    );
  }

  /// Parse item dari file Malang (gambar bisa berupa local asset)
  CultureItemDto _parseMalangItem(Map<String, dynamic> item) {
    final imagesList = item['images'] as List<dynamic>? ?? [];
    final List<String> imageUrls = imagesList.map((img) {
      final imgMap = img as Map<String, dynamic>;
      final String imageUrl = imgMap['image_url'] as String;
      // Jika path dimulai dengan 'assets/' maka gunakan apa adanya (local asset)
      // Jika tidak, gabungkan dengan base URL API
      if (imageUrl.startsWith('assets/')) {
        return imageUrl;
      } else {
        return ApiConstanta.baseUrl.replaceAll('api', '') + imageUrl;
      }
    }).toList();

    final int destinationId =
        int.tryParse(item['destination_id'].toString()) ?? 0;

    return CultureItemDto(
      destinationId: destinationId,
      name: item['title'] ?? '',
      desc: item['content'] ?? '',
      imageurls: imageUrls,
    );
  }
}