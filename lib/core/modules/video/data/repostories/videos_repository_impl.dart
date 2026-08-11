import 'package:oldcityguideapp/core/api_constanta.dart';
import 'package:oldcityguideapp/core/helper/api_manager.dart';
import 'package:oldcityguideapp/core/modules/video/domain/dto/yt_video_dto.dart';
import 'package:oldcityguideapp/core/modules/video/domain/repositories/videos_repository.dart';

class VideosRepositoryImpl implements VideosRepository {
  final ApiManager apiManager;

  const VideosRepositoryImpl({required this.apiManager});
  @override
  Future<List<YtVideoDto>> getVideos() async {
    final result = await apiManager.getData(ApiConstanta.videos());
    final data = result as List<dynamic>;
    print(data);
    return data.map((i) {
      final item = i as Map<String, dynamic>;
      final destinationId =
          int.tryParse(item['tourist_destination']['destination_id']) ?? 0;
      return YtVideoDto(
          destinationid: destinationId,
          urlId: _getYtId(item['youtube_url'] ?? "-") ?? "-",
          name: item['title'] ?? "-");
    }).toList();
  }

  String? _getYtId(String url) {
    final regex = RegExp(r'(?:v=|\/)([0-9A-Za-z_-]{11})');
    final match = regex.firstMatch(url);
    final videoId = match?.group(1);
    return videoId;
  }
}
