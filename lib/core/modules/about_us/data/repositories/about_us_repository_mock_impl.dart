import 'package:oldcityguideapp/core/modules/about_us/data/repositories/about_us_mock_data.dart';
import 'package:oldcityguideapp/core/modules/about_us/data/repositories/about_us_mock_data_en.dart';
import 'package:oldcityguideapp/core/modules/about_us/domain/dto/user_profile_dto.dart';
import 'package:oldcityguideapp/core/modules/about_us/domain/repositories/about_us_repository.dart';

class AboutUsMockRepositoryImpl implements AboutUsRepository {
  @override
  Future<List<UserProfileDto>> getTeamMembers({String locale = 'id'}) async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (locale == 'en') {
      return aboutUsMockDataEn;
    }
    return aboutUsMockData;
  }
}
