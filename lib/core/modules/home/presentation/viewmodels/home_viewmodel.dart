import 'package:flutter/widgets.dart';
import 'package:oldcityguideapp/core/common/data/geography_mock_data.dart';
import 'package:oldcityguideapp/core/common/domain/dto/gegraphy_dto.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';

class HomeViewmodel extends ChangeNotifier {
  ViewState<List<GeographyDto>> _geographyState = Loading();
  ViewState<List<GeographyDto>> get geographyState => _geographyState;

  String _locale = 'id';

  void setLocale(String locale) {
    if (_locale != locale) {
      _locale = locale;
      fetchData();
    }
  }

  /// Set locale and always fetch (used on initial load)
  void setLocaleAndFetch(String locale) {
    _locale = locale;
    fetchData();
  }

  Future<void> fetchData() async {
    _geographyState = Loading();
    notifyListeners();
    try {
      // Always use mock data for consistent ids across home and detail screens
      final data = geographyMockDataByLocale[_locale] ?? geographyMockData;
      _geographyState = Success(data);
    } catch (e) {
      _geographyState = Error(e.toString());
    } finally {
      notifyListeners();
    }
  }
}
