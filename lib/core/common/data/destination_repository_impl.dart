import 'package:oldcityguideapp/core/api_constanta.dart';
import 'package:oldcityguideapp/core/common/domain/dto/destinations_dto.dart';
import 'package:oldcityguideapp/core/common/domain/repositories/destination_repository.dart';
import 'package:oldcityguideapp/core/helper/api_manager_impl.dart';

class DestinationRepositoryImpl implements DestinationRepository {
  @override
  Future<List<DestinationsDto>> getDestinations() async {
    final List<dynamic> result =
        await ApiManagerImpl().getData(ApiConstanta.destinations());
    final destinations =
        result.map((item) => DestinationsDto.fromJson(item)).toList();
    return destinations;
  }
}
