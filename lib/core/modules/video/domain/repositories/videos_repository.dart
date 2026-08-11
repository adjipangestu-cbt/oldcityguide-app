import 'package:oldcityguideapp/core/modules/video/domain/dto/yt_video_dto.dart';

abstract class VideosRepository {
  Future<List<YtVideoDto>> getVideos();
}
