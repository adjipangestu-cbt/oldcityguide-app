import 'package:flutter/widgets.dart';
import 'package:oldcityguideapp/core/helper/api_manager_impl.dart';
import 'package:oldcityguideapp/core/modules/history/data/repositories/history_repository_impl.dart';
import 'package:oldcityguideapp/core/modules/history/domain/dto/history_item_dto.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';

class HistoryViewmodel extends ChangeNotifier {
  final _repository = HistoryRepositoryImpl(apiManager: ApiManagerImpl());

  ViewState<List<HistoryItemDto>> _state = Loading();
  ViewState<List<HistoryItemDto>> get state => _state;

  List<HistoryItemDto> _data = [];

  int _currentDestinationId = 0;
  String _currentKeyword = "";

  Future<void> fetchData() async {
    _state = Loading();
    notifyListeners();
    try {
      final result = await _repository.getData();
      _data = result;
      _applyFilters();
    } catch (e) {
      _state = Error(e.toString());
      notifyListeners();
    }
  }

  HistoryItemDto? getItem(int index) {
    try {
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
    List<HistoryItemDto> filtered = List.from(_data);

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
