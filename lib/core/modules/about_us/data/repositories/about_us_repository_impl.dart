import 'package:oldcityguideapp/core/api_constanta.dart';
import 'package:oldcityguideapp/core/helper/api_manager.dart';
import 'package:oldcityguideapp/core/modules/about_us/domain/dto/user_profile_dto.dart';
import 'package:oldcityguideapp/core/modules/about_us/domain/repositories/about_us_repository.dart';

class AboutUsRepositoryImpl implements AboutUsRepository {
  final ApiManager apiManager;
  const AboutUsRepositoryImpl({required this.apiManager});

  @override
  Future<List<UserProfileDto>> getTeamMembers() async {
    final result = await apiManager.getData(ApiConstanta.teamMembers());
    final data = result as List<dynamic>;
    return data.map((item) {
      final parsedItem = item as Map<String, dynamic>;
      final name = parsedItem['name'];
      final description = parsedItem['description'];
      final imageUrl = "${ApiConstanta.domain}/${parsedItem['photo_url']}";
      return UserProfileDto(
          name: name, description: description, imageUrl: imageUrl);
    }).toList();
  }
}
