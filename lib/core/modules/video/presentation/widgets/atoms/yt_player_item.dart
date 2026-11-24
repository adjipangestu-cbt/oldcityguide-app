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

  /// Mengekstrak 11 karakter YouTube Video ID dari berbagai format URL/Shorts
  static String _cleanVideoId(String raw) {
    final trimmed = raw.trim();
    // Sudah berupa ID langsung (11 karakter)
    if (RegExp(r'^[0-9A-Za-z_-]{11}$').hasMatch(trimmed)) {
      return trimmed;
    }
    // Coba pakai bawaan library
    final fromLib = YoutubePlayerController.convertUrlToId(trimmed);
    if (fromLib != null && fromLib.isNotEmpty) return fromLib;
    // Fallback regex untuk shorts, embed, watch, youtu.be
    final regex = RegExp(
      r'(?:youtube\.com\/(?:watch\?v=|shorts\/|embed\/)|youtu\.be\/)([0-9A-Za-z_-]{11})',
    );
    final match = regex.firstMatch(trimmed);
    return match?.group(1) ?? trimmed;
  }

  @override
  void initState() {
    super.initState();
    final cleanId = _cleanVideoId(widget.urlId);

    controller = YoutubePlayerController.fromVideoId(
      videoId: cleanId,
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: YoutubePlayer(
              controller: controller,
              aspectRatio: 16 / 9,
              backgroundColor: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
