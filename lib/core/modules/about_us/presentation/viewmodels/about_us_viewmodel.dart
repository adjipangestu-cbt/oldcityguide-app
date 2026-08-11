import 'package:flutter/material.dart';
import 'package:oldcityguideapp/core/helper/api_manager_impl.dart';
import 'package:oldcityguideapp/core/modules/about_us/data/repositories/about_us_repository_impl.dart';
import 'package:oldcityguideapp/core/modules/about_us/domain/dto/user_profile_dto.dart';
import 'package:oldcityguideapp/core/modules/about_us/domain/repositories/about_us_repository.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';

class AboutUsViewmodel extends ChangeNotifier {
  ViewState<List<UserProfileDto>> _users = Loading();
  ViewState<List<UserProfileDto>> get users => _users;
  final AboutUsRepository _repository =
      AboutUsRepositoryImpl(apiManager: ApiManagerImpl());

  Future<void> fetch() async {
    try {
      _users = Loading();
      notifyListeners();
      final data = await _repository.getTeamMembers();
      _users = Success(data);
      notifyListeners();
    } catch (e) {
      _users = Error("Unexpected error!");
      notifyListeners();
    }
  }
}
