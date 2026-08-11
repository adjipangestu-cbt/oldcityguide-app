import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oldcityguideapp/core/helper/api_manager_impl.dart';
import 'package:oldcityguideapp/core/modules/video/data/repostories/videos_repository_impl.dart';
import 'package:oldcityguideapp/core/modules/video/domain/dto/yt_video_dto.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';

class VideoViewmodel extends ChangeNotifier {
  final _repository = VideosRepositoryImpl(apiManager: ApiManagerImpl());

  List<YtVideoDto> _originalList = [];

  ViewState<List<YtVideoDto>> _state = Loading();
  ViewState<List<YtVideoDto>> get state => _state;

  int _currentDestinationId = 0;
  String _currentKeyword = "";

  Future<void> fetch() async {
    _state = Loading();
    notifyListeners();
    try {
      final data = await _repository.getVideos();
      _originalList = data;
      _applyFilters();
    } on SocketException {
      _state = Error("Error, no Internet connection!");
      notifyListeners();
    } catch (e) {
      _state = Error("Unexpected Error: $e");
      notifyListeners();
    }
  }

  void filterByDestinationId(int destinationId) {
    _currentDestinationId = destinationId;
    _applyFilters();
  }

  void searchVideo(String videoName) {
    _currentKeyword = videoName;
    _applyFilters();
  }

  void _applyFilters() {
    List<YtVideoDto> filtered = List.from(_originalList);

    // Filter by destination
    if (_currentDestinationId != 0) {
      filtered = filtered
          .where((video) => video.destinationid == _currentDestinationId)
          .toList();
    }

    // Filter by keyword
    if (_currentKeyword.trim().isNotEmpty) {
      filtered = filtered
          .where((video) =>
              video.name.toLowerCase().contains(_currentKeyword.toLowerCase()))
          .toList();
    }

    _state = Success(filtered);
    notifyListeners();
  }
}
