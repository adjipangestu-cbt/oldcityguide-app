import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:oldcityguideapp/core/helper/api_manager_impl.dart';
import 'package:oldcityguideapp/core/modules/digital_map/data/repositories/digital_map_repository_impl.dart';
import 'package:oldcityguideapp/core/modules/digital_map/domain/dto/digital_map_dto.dart';
import 'package:oldcityguideapp/core/modules/digital_map/domain/dto/digital_map_routes_dto.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';

class DigitalMapViewmodel extends ChangeNotifier {
  ViewState<List<DigitalMapDto>> _allDigitalMapState = Loading();
  ViewState<DigitalMapRoutesDto> _detailPointsRouteState = Loading();
  ViewState<List<DigitalMapDto>> get allDigitalMapState => _allDigitalMapState;
  ViewState<DigitalMapRoutesDto> get detailPointsRouteState =>
      _detailPointsRouteState;
  List<DigitalMapDto> _initialData = [];

  final _repository = DigitalMapRepositoryImpl(apiManager: ApiManagerImpl());
  Future<void> getAllData() async {
    _allDigitalMapState = Loading();
    notifyListeners();
    try {
      final result = await _repository.getAllDigitalMaps();
      _allDigitalMapState = Success(result);
      _initialData = result;
      notifyListeners();
    } on SocketException {
      _allDigitalMapState = Error("Tidak ada koneksi internet. Periksa koneksi Anda dan coba lagi.");
      notifyListeners();
    } catch (e) {
      _allDigitalMapState = Error("Terjadi kesalahan. Periksa koneksi internet Anda dan coba lagi.");
      notifyListeners();
    }
  }

  void filterByDestination(int destinationId) {
    final List<DigitalMapDto> currentData = List.from(_initialData);

    if (destinationId == 0) {
      _allDigitalMapState = Success(currentData);
      notifyListeners();
      return;
    }

    final filteredData = currentData
        .where((item) => item.destinationId == destinationId)
        .toList();
    _allDigitalMapState = Success(filteredData);
    notifyListeners();
  }

  Future<void> getDetail(int id) async {
    _detailPointsRouteState = Loading();
    notifyListeners();
    try {
      final result = await _repository.getDetailPointRoutes(id);
      print(result.points.first.location);
      _detailPointsRouteState = Success(result);
      notifyListeners();
    } on SocketException {
      _detailPointsRouteState = Error("Tidak ada koneksi internet. Periksa koneksi Anda dan coba lagi.");
      notifyListeners();
    } catch (e) {
      _detailPointsRouteState = Error("Terjadi kesalahan. Periksa koneksi internet Anda dan coba lagi.");
      notifyListeners();
    }
  }
}
