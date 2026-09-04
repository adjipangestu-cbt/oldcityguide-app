import 'package:flutter/widgets.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/data/culinary_repository_mock_impl.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/domain/dto/food_culinary_dto.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';

class FoodCulinaryViewmodel extends ChangeNotifier {
  ViewState<List<FoodCulinaryDto>> _state = Loading();
  ViewState<List<FoodCulinaryDto>> get state => _state;
  List<FoodCulinaryDto> _data = [];
  final _repository = CulinaryRepositoryMockImpl();

  String _keyword = "";
  String _selectedCity = 'Semua';

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

  void filterByCity(String city) {
    _selectedCity = city;
    _applyFilters();
  }

  void filterByDestination(int destinationId) {
    // legacy support if needed
  }

  void _applyFilters() {
    List<FoodCulinaryDto> filteredData = List.from(_data);

    if (_selectedCity != 'Semua') {
      filteredData = filteredData
          .where((item) => item.city == _selectedCity)
          .toList();
    }

    if (_keyword.trim().isNotEmpty) {
      filteredData = filteredData
          .where((item) =>
              item.name.toLowerCase().contains(_keyword.toLowerCase()))
          .toList();
    }

    _state = Success(filteredData);
    notifyListeners();
  }
}

  String get selectedCity => _selectedCity;
