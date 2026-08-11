import 'package:oldcityguideapp/core/common/domain/dto/destinations_dto.dart';

abstract class DestinationRepository {
  Future<List<DestinationsDto>> getDestinations();
}
