import 'package:oldcityguideapp/core/modules/about_us/domain/dto/user_profile_dto.dart';

abstract class AboutUsRepository {
  Future<List<UserProfileDto>> getTeamMembers();
}
