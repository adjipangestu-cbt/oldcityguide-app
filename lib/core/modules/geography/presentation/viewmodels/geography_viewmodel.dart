import 'package:flutter/widgets.dart';
import 'package:oldcityguideapp/core/common/data/geography_repository_mock_impl.dart';
import 'package:oldcityguideapp/core/common/domain/dto/gegraphy_dto.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';

class GeographyViewmodel extends ChangeNotifier {
  ViewState<GeographyDto> _state = Loading();
  ViewState<GeographyDto> get state => _state;

  ViewState<List<GeographyDto>> _allDestinations = Loading();
  ViewState<List<GeographyDto>> get allDestinations => _allDestinations;

  String _selectedCity = 'Malang';
  String get selectedCity => _selectedCity;

  String _locale = 'id';

  final _repository = GeographyMockRepositoryImpl();

  @override
  void dispose() {
    super.dispose();
  }

  void setLocale(String locale) {
    if (_locale != locale) {
      _locale = locale;
      // Re-fetch current city with new locale
      changeCity(_selectedCity);
    }
  }

  /// Set locale without triggering a re-fetch (used during initial setup)
  void setLocaleWithoutFetch(String locale) {
    _locale = locale;
  }

  Future<void> fetchData(int id) async {
    _state = Loading();
    notifyListeners();
    try {
      final allDestination = await _repository.getGeographyGroupByDestinations(locale: _locale);
      final matches = allDestination.where((item) => item.id == id);
      if (matches.isNotEmpty) {
        _state = Success(matches.first);
      } else if (allDestination.isNotEmpty) {
        // Fallback: show first available
        _state = Success(allDestination.first);
      } else {
        _state = Error('Data tidak ditemukan');
      }
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
      final allDestination = await _repository.getDestinations(locale: _locale);
      _allDestinations = Success(allDestination);
    } catch (e) {
      _allDestinations = Error(e.toString());
    } finally {
      notifyListeners();
    }
  }

  void changeCity(String city) {
    _selectedCity = city;
    final id = city == 'Malang' ? 2 : 1;
    fetchData(id);
  }
}
