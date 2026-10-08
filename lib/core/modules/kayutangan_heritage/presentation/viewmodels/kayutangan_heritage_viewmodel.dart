import 'package:flutter/widgets.dart';
import 'package:oldcityguideapp/core/modules/kayutangan_heritage/data/kayutangan_heritage_repository.dart';
import 'package:oldcityguideapp/core/modules/kayutangan_heritage/domain/dto/kayutangan_heritage_dto.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';

class KayutanganHeritageViewmodel extends ChangeNotifier {
  ViewState<List<KayutanganHeritageDto>> _state = Loading();
  ViewState<List<KayutanganHeritageDto>> get state => _state;

  final _repository = KayutanganHeritageRepository();

  Future<void> fetchData({String languageCode = 'id'}) async {
    _state = Loading();
    notifyListeners();
    try {
      final result = await _repository.getData(languageCode: languageCode);
      _state = Success(result);
    } catch (e) {
      _state = Error(e.toString());
    }
    notifyListeners();
  }
}
