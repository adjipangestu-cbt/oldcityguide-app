import 'package:flutter/widgets.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/data/culinary_repository_mock_impl.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/domain/dto/food_culinary_dto.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';

enum CulinaryViewMode { list, map }

class FoodCulinaryViewmodel extends ChangeNotifier {
  ViewState<List<FoodCulinaryDto>> _state = Loading();
  ViewState<List<FoodCulinaryDto>> get state => _state;
  List<FoodCulinaryDto> _data = [];
  final _repository = CulinaryRepositoryMockImpl();

  String _keyword = '';
  CulinaryCulture _selectedCulture = CulinaryCulture.arab;
  CulinaryViewMode _viewMode = CulinaryViewMode.list;

  CulinaryCulture get selectedCulture => _selectedCulture;
  CulinaryViewMode get viewMode => _viewMode;

  /// Semua data (untuk peta)
  List<FoodCulinaryDto> get allData => _data;

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

  void search(String name) {
    _keyword = name;
    _applyFilters();
  }

  void selectCulture(CulinaryCulture culture) {
    _selectedCulture = culture;
    _keyword = '';
    _applyFilters();
  }

  void setViewMode(CulinaryViewMode mode) {
    _viewMode = mode;
    notifyListeners();
  }

  void _applyFilters() {
    List<FoodCulinaryDto> filtered = _data
        .where((item) => item.culture == _selectedCulture)
        .toList();

    if (_keyword.trim().isNotEmpty) {
      filtered = filtered
          .where((item) =>
              item.name.toLowerCase().contains(_keyword.toLowerCase()))
          .toList();
    }

    _state = Success(filtered);
    notifyListeners();
  }
}
