import 'package:flutter/widgets.dart';
import 'package:oldcityguideapp/core/common/data/geography_repository_impl.dart';
import 'package:oldcityguideapp/core/common/domain/dto/gegraphy_dto.dart';
import 'package:oldcityguideapp/core/helper/api_manager_impl.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';

class GeographyViewmodel extends ChangeNotifier {
  ViewState<GeographyDto> _state = Loading();
  ViewState<GeographyDto> get state => _state;
  ViewState<List<GeographyDto>> _allDestinations = Loading();
  ViewState<List<GeographyDto>> get allDestinations => _allDestinations;

  final _repository = GeographyRepositoryImpl(apiManager: ApiManagerImpl());

  Future<void> fetchData(int id) async {
    _state = Loading();
    notifyListeners();
    try {
      final allDestination =
          await _repository.getGeographyGroupByDestinations();
      final data = allDestination.where((item) => item.id == id).first;
      _state = Success(data);
    } catch (e) {
      _state = Error(e.toString());
    } finally {
      notifyListeners();
    }
  }

  Future<void> fetchDestinations() async {
    _allDestinations = Loading();
    notifyListeners();
    try {
      final allDestination = await _repository.getDestinations();
      _allDestinations = Success(allDestination);
    } catch (e) {
      _allDestinations = Error(e.toString());
    } finally {
      notifyListeners();
    }
  }
}
