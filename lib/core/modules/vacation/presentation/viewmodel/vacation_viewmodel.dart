import 'package:flutter/widgets.dart';
import 'package:oldcityguideapp/core/helper/api_manager_impl.dart';
import 'package:oldcityguideapp/core/modules/vacation/data/repositories/vacation_repository_impl.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';

class VacationViewmodel extends ChangeNotifier {
  ViewState<List<Map<String, Object>>> _state = Loading();
  ViewState<List<Map<String, Object>>> get state => _state;

  final _repository = VacationRepositoryImpl(apiManager: ApiManagerImpl());

  List<Map<String, Object>> _data = [];

  int _currentDestinationId = 0;
  String _currentKeyword = "";

  // 1. Tambahkan parameter languageCode dengan default 'id'
  Future<void> fetchData({String languageCode = 'id'}) async {
    _state = Loading();
    notifyListeners();
    try {
      
      final result = await _repository.getVacationsList(languageCode: languageCode);
      _data = result;
      _applyFilters();
    } catch (e) {
      _state = Error(e.toString());
      notifyListeners();
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
    List<Map<String, Object>> filteredData = List.from(_data);

    // Filter by destination
    if (_currentDestinationId != 0) {
      filteredData = filteredData
          .where((item) => item['destination_id'] == _currentDestinationId)
          .toList();
    }

    // Filter by keyword
    if (_currentKeyword.trim().isNotEmpty) {
      filteredData = filteredData
          .where((item) => item['name']
              .toString()
              .toLowerCase()
              .contains(_currentKeyword.toLowerCase()))
          .toList();
    }

    _state = Success(filteredData);
    notifyListeners();
  }
}