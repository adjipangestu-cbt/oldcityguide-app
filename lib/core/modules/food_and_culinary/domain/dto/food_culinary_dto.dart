import 'package:flutter/material.dart';

/// Enum kategori kultur kuliner
enum CulinaryCulture {
  arab,
  jawa,
  eropa,
  cina;

  String get label {
    switch (this) {
      case CulinaryCulture.arab:
        return 'Arab';
      case CulinaryCulture.jawa:
        return 'Jawa';
      case CulinaryCulture.eropa:
        return 'Eropa';
      case CulinaryCulture.cina:
        return 'Cina';
    }
  }

  String get labelEn {
    switch (this) {
      case CulinaryCulture.arab:
        return 'Arabic';
      case CulinaryCulture.jawa:
        return 'Javanese';
      case CulinaryCulture.eropa:
        return 'European';
      case CulinaryCulture.cina:
        return 'Chinese';
    }
  }

  String localizedLabel(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'en' ? labelEn : label;
  }

  Color get color {
    switch (this) {
      case CulinaryCulture.arab:
        return const Color(0xFF2E7D32); // hijau tua
      case CulinaryCulture.jawa:
        return const Color(0xFF6D4C41); // coklat tanah
      case CulinaryCulture.eropa:
        return const Color(0xFF1565C0); // biru gelap
      case CulinaryCulture.cina:
        return const Color(0xFFC62828); // merah
    }
  }

  Color get lightColor {
    switch (this) {
      case CulinaryCulture.arab:
        return const Color(0xFFE8F5E9);
      case CulinaryCulture.jawa:
        return const Color(0xFFEFEBE9);
      case CulinaryCulture.eropa:
        return const Color(0xFFE3F2FD);
      case CulinaryCulture.cina:
        return const Color(0xFFFFEBEE);
    }
  }

  IconData get icon {
    switch (this) {
      case CulinaryCulture.arab:
        return Icons.mosque_outlined;
      case CulinaryCulture.jawa:
        return Icons.rice_bowl_outlined;
      case CulinaryCulture.eropa:
        return Icons.local_cafe_outlined;
      case CulinaryCulture.cina:
        return Icons.ramen_dining_outlined;
    }
  }
}

class FoodCulinaryDto {
  final int id;
  final String slug;
  final String name;
  final List<String> imageUrls;
  final String desc;
  final String address;
  final String mapsUrl;
  final String yearEstablished;
  final CulinaryCulture culture;
  final double latitude;
  final double longitude;

  // Backward-compat fields untuk CulinaryRepositoryImpl (tidak dipakai di UI baru)
  final int destinationId;
  final List<String> ytUrls;
  final double rating;
  final String category;
  final bool isLegendary;
  final String city;
  final String markerTitle;

  const FoodCulinaryDto({
    this.id = 0,
    this.slug = '',
    required this.name,
    required this.imageUrls,
    required this.desc,
    required this.address,
    this.mapsUrl = '',
    this.yearEstablished = '',
    this.culture = CulinaryCulture.jawa,
    this.latitude = 0.0,
    this.longitude = 0.0,
    // Backward-compat
    this.destinationId = 0,
    this.ytUrls = const [],
    this.rating = 0.0,
    this.category = '',
    this.isLegendary = false,
    this.city = '',
    this.markerTitle = '',
  });

  /// Paragraf pertama, dipotong maks 160 karakter — untuk kartu daftar
  String get shortDesc {
    final first = desc.split('\n\n').first.trim();
    if (first.length <= 160) return first;
    return '${first.substring(0, 160).trimRight()}…';
  }
}
