import 'package:oldcityguideapp/core/modules/vr/domain/dto/vr_dto.dart';

abstract class VrRepository {
  Future<List<VrDto>> getData();
}
