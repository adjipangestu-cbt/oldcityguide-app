import 'package:flutter/material.dart';
import 'package:oldcityguideapp/core/ui/typoghrapy.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YtPlayerItem extends StatefulWidget {
  final String title;
  final String urlId;
  const YtPlayerItem({super.key, required this.title, required this.urlId});

  @override
  State<YtPlayerItem> createState() => _YtPlayerItemState();
}

class _YtPlayerItemState extends State<YtPlayerItem> {
  late final YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    // Memastikan hanya ID video (11 karakter) yang diambil jika datanya berupa URL utuh
    final cleanVideoId = YoutubePlayerController.convertUrlToId(widget.urlId) ?? widget.urlId.trim();

    controller = YoutubePlayerController.fromVideoId(
      videoId: cleanVideoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        mute: false,
        showControls: true,
        showFullscreenButton: true,
        strictRelatedVideos: true,
        // Mengatasi Error 152-4 (blokir embed WebView Android dari YouTube)
        origin: 'https://www.youtube-nocookie.com',
      ),
    );
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        if (widget.title.trim() != "")
          Flexible(
            child:
                Text(widget.title, style: AppTypoghrapy.title, softWrap: true),
          ),
        Flexible(
          child: YoutubePlayer(
            controller: controller,
            aspectRatio: 16 / 9,
            backgroundColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}