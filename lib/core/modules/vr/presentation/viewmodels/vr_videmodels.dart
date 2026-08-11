import 'package:flutter/widgets.dart';
import 'package:oldcityguideapp/core/helper/api_manager_impl.dart';
import 'package:oldcityguideapp/core/modules/vr/data/repositories/vr_repository_impl.dart';
import 'package:oldcityguideapp/core/modules/vr/domain/dto/vr_dto.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';

class VrViewmodel extends ChangeNotifier {
  ViewState<List<VrDto>> _state = Loading();
  ViewState<List<VrDto>> get state => _state;
  final _repository = VrRepositoryImpl(apiManager: ApiManagerImpl());

  List<VrDto> _initialData = [];

  Future<void> fetch() async {
    try {
      _state = Loading();
      notifyListeners();

      await Future.delayed(Duration(milliseconds: 200));
      final data = await _repository.getData();
      _state = Success(data);
      _initialData = data;
      notifyListeners();
    } catch (e) {
      _state = Error("Unexpected error!");
      notifyListeners();
    }
  }

  void filterByDestinationId(int destinationId) {
    final List<VrDto> currentData = List.from(_initialData);

    if (destinationId == 0) {
      _state = Success(_initialData);
      notifyListeners();
      return;
    }

    final filtered = currentData
        .where((item) => item.destinationId == destinationId)
        .toList();
    _state = Success(filtered);
    notifyListeners();
  }
}
