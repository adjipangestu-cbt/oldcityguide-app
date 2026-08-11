import 'package:oldcityguideapp/core/modules/culture/domain/dto/culture_item_dto.dart';

abstract class CultureRepository {
  Future<List<CultureItemDto>> getData();
}
