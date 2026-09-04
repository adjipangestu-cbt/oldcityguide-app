import 'package:flutter/widgets.dart';
import 'package:oldcityguideapp/core/helper/api_manager_impl.dart';
import 'package:oldcityguideapp/core/modules/culture/data/repositories/culture_repository_impl.dart';
import 'package:oldcityguideapp/core/modules/culture/domain/dto/culture_item_dto.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';

class CultureViewmodel extends ChangeNotifier {
  final _repository = CultureRepositoryImpl(apiManager: ApiManagerImpl());

  ViewState<List<CultureItemDto>> _state = Loading();
  ViewState<List<CultureItemDto>> get state => _state;

  List<CultureItemDto> _data = [];

  int _currentDestinationId = 0;
  String _currentKeyword = "";

  // 1. Tambahkan parameter languageCode dengan bawaan 'id'
  Future<void> fetchData({String languageCode = 'id'}) async {
    _state = Loading();
    notifyListeners();
    try {
      // 2. Teruskan languageCode ke repository
      final result = await _repository.getData(languageCode: languageCode);
      _data = result;
      _applyFilters();
    } catch (e) {
      _state = Error(e.toString());
      notifyListeners();
    }
  }

  CultureItemDto? getItem(int index) {
    try {
      // Ambil dari list yang sudah difilter (sesuai state saat ini)
      final currentState = _state;
      if (currentState is Success<List<CultureItemDto>>) {
        return currentState.data.elementAt(index);
      }
      return _data.elementAt(index);
    } catch (_) {
      return null;
    }
  }

  void filterByDestination(int destinationId) {
    _currentDestinationId = destinationId;
    _applyFilters();
  }

  void search(String keyword) {
    _currentKeyword = keyword;
    _applyFilters();
  }

  void _applyFilters() {
    List<CultureItemDto> filtered = List.from(_data);

    // filter kategori (destination)
    if (_currentDestinationId != 0) {
      filtered = filtered
          .where((item) => item.destinationId == _currentDestinationId)
          .toList();
    }

    // filter keyword
    if (_currentKeyword.trim().isNotEmpty) {
      filtered = filtered
          .where((item) =>
              item.name.toLowerCase().contains(_currentKeyword.toLowerCase()))
          .toList();
    }

    _state = Success(filtered);
    notifyListeners();
  }
}