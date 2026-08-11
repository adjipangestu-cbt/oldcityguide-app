import 'package:oldcityguideapp/core/modules/history/domain/dto/history_item_dto.dart';

abstract class HistoryRepository {
  Future<List<HistoryItemDto>> getData();
}
