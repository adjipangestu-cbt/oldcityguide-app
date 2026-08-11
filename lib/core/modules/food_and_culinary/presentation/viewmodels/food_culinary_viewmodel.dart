import 'package:flutter/widgets.dart';
import 'package:oldcityguideapp/core/helper/api_manager_impl.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/data/culinary_repository_impl.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/domain/dto/food_culinary_dto.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';

class FoodCulinaryViewmodel extends ChangeNotifier {
  ViewState<List<FoodCulinaryDto>> _state = Loading();
  ViewState<List<FoodCulinaryDto>> get state => _state;
  List<FoodCulinaryDto> _data = [];
  final _repository = CulinaryRepositoryImpl(apiManager: ApiManagerImpl());

  String _keyword = "";
  int _selectedDestinationId = 0;

  Future<void> fetchData() async {
    _state = Loading();
    notifyListeners();
    try {
      final result = await _repository.getData();
      _data = result;
      final data = result;
      _state = Success(data);
    } catch (e) {
      _state = Error(e.toString());
    } finally {
      notifyListeners();
    }
  }

  void search(String name) {
    _keyword = name;
    _applyFilters();
  }

  void filterByDestination(int destinationId) {
    _selectedDestinationId = destinationId;
    _applyFilters();
  }

  void _applyFilters() {
    List<FoodCulinaryDto> filteredData = List.from(_data);

    // Filter by category
    if (_selectedDestinationId != 0) {
      filteredData = filteredData
          .where((item) => item.destinationId == _selectedDestinationId)
          .toList();
    }

    // Filter by keyword
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
