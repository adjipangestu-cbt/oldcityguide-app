import 'package:oldcityguideapp/core/common/domain/dto/destinations_dto.dart';

abstract class DestinationRepository {
  // Tambahkan parameter opsional languageCode
  Future<List<DestinationsDto>> getDestinations({String languageCode = 'id'});
}