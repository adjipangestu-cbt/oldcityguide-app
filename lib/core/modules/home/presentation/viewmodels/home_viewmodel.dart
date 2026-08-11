import 'package:flutter/widgets.dart';
import 'package:oldcityguideapp/core/common/data/geography_repository_impl.dart';
import 'package:oldcityguideapp/core/common/domain/dto/gegraphy_dto.dart';
import 'package:oldcityguideapp/core/common/domain/repositories/geography_repository.dart';
import 'package:oldcityguideapp/core/helper/api_manager_impl.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';

class HomeViewmodel extends ChangeNotifier {
  ViewState<List<GeographyDto>> _geographyState = Loading();
  ViewState<List<GeographyDto>> get geographyState => _geographyState;
  final GeographyRepository _geographyRepository =
      GeographyRepositoryImpl(apiManager: ApiManagerImpl());

  Future<void> fetchData() async {
    _geographyState = Loading();
    notifyListeners();
    try {
      final data = await _geographyRepository.getDestinations();
      _geographyState = Success(data);
    } catch (e) {
      _geographyState = Error(e.toString());
    } finally {
      notifyListeners();
    }
  }
}
