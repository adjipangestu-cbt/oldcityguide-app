import 'dart:async';
import 'dart:io';

import 'package:oldcityguideapp/core/api_constanta.dart';
import 'package:oldcityguideapp/core/helper/api_manager.dart';
import 'package:oldcityguideapp/core/modules/video/domain/dto/yt_video_dto.dart';
import 'package:oldcityguideapp/core/modules/video/domain/repositories/videos_repository.dart';

class VideosRepositoryImpl implements VideosRepository {
  final ApiManager apiManager;

  const VideosRepositoryImpl({required this.apiManager});

  /// Daftar 8 video lokal Kampung Heritage Kajoetangan / Malang (destinationid=6 sesuai API)
  static const List<YtVideoDto> _localYoutubeVideos = [
    YtVideoDto(destinationid: 6, urlId: 'Xz_TfHmj3Yk', name: 'Rumah Nyak Abas Akub'),
    YtVideoDto(destinationid: 6, urlId: '64jiFT_aJ3I', name: 'Rumah Jacoeb'),
    YtVideoDto(destinationid: 6, urlId: 'X2V0pA-6DHU', name: 'Rumah Nyi Aisyah'),
    YtVideoDto(destinationid: 6, urlId: 'sqhLoJro2cg', name: 'Rumah 1870'),
    YtVideoDto(destinationid: 6, urlId: 'wX81J6REVqQ', name: 'Rumah Jenki'),
    YtVideoDto(destinationid: 6, urlId: 'gsY1--17QEk', name: 'Rumah D Penghulu'),
    YtVideoDto(destinationid: 6, urlId: 'U2WKVmihjPU', name: 'Rumah Mbah Ndut'),
    YtVideoDto(destinationid: 6, urlId: 'I71IOyhJ9q8', name: 'Rumah Rindu'),
  ];

  @override
  Future<List<YtVideoDto>> getVideos() async {
    List<YtVideoDto> apiVideos = [];

    try {
      final result = await apiManager
          .getData(ApiConstanta.videos())
          .timeout(const Duration(seconds: 7));
      final data = result as List<dynamic>;
      apiVideos = data
          .map((i) {
            final item = i as Map<String, dynamic>;

            // Ambil destination_id dari berbagai sumber yang mungkin tersedia
            final destinationId = _extractDestinationId(item);

            // Ambil YouTube URL — bisa dari youtube_url atau null jika media_type=upload
            final youtubeUrl = item['youtube_url'] as String?;
            final mediaType = item['media_type'] as String? ?? '';

            // Hanya proses video yang memiliki youtube_url (media_type=youtube)
            // Video dengan media_type=upload tidak punya youtube_url, skip
            if (mediaType != 'youtube' || youtubeUrl == null || youtubeUrl.isEmpty) {
              return null;
            }

            return YtVideoDto(
              destinationid: destinationId,
              urlId: _extractYtId(youtubeUrl) ?? '-',
              name: item['title'] ?? '-',
            );
          })
          .where((v) => v != null)
          .cast<YtVideoDto>()
          .toList();
    } on SocketException {
      // Tidak ada koneksi internet — lanjut dengan video lokal saja
    } on TimeoutException {
      // Server terlalu lama merespons — lanjut dengan video lokal saja
    } catch (e) {
      // Error lain (server down, response invalid, dsb) — lanjut dengan video lokal
    }

    // Gabungkan API videos + local YouTube videos, hindari duplikasi berdasarkan urlId
    final existingIds = apiVideos.map((v) => v.urlId).toSet();
    final mergedVideos = [
      ...apiVideos,
      ..._localYoutubeVideos.where((v) => !existingIds.contains(v.urlId)),
    ];

    return mergedVideos;
  }

  /// Mengekstrak destination_id dari item API yang bisa datang dari
  /// tourist_destination.destination_id, history.destination_id, atau destination_id langsung
  int _extractDestinationId(Map<String, dynamic> item) {
    // Coba dari tourist_destination (video Lasem)
    final touristDest = item['tourist_destination'];
    if (touristDest != null && touristDest is Map<String, dynamic>) {
      final id = int.tryParse('${touristDest['destination_id']}');
      if (id != null) return id;
    }

    // Coba dari history (video Malang)
    final history = item['history'];
    if (history != null && history is Map<String, dynamic>) {
      final id = int.tryParse('${history['destination_id']}');
      if (id != null) return id;
    }

    // Fallback: destination_id langsung dari item
    final directId = int.tryParse('${item['destination_id']}');
    return directId ?? 0;
  }

  /// Mengekstrak 11 karakter YouTube Video ID dari berbagai format URL:
  /// - https://www.youtube.com/watch?v=ID
  /// - https://www.youtube.com/embed/ID
  /// - https://youtu.be/ID
  /// - https://youtube.com/shorts/ID
  /// - https://youtube.com/shorts/ID?si=...
  /// - ID langsung (11 karakter)
  static String? _extractYtId(String url) {
    // Jika sudah berupa ID langsung (11 karakter alfanumerik + _ -)
    if (RegExp(r'^[0-9A-Za-z_-]{11}$').hasMatch(url.trim())) {
      return url.trim();
    }
    final regex = RegExp(
      r'(?:youtube\.com\/(?:watch\?v=|shorts\/|embed\/)|youtu\.be\/)([0-9A-Za-z_-]{11})',
    );
    final match = regex.firstMatch(url);
    return match?.group(1);
  }
}
