import 'package:flutter/material.dart';
import 'package:oldcityguideapp/core/common/domain/dto/destinations_dto.dart';
import 'package:oldcityguideapp/core/common/domain/repositories/destination_repository.dart';

class DestinationViewmodel extends ChangeNotifier {
  final DestinationRepository repository;
  List<DestinationsDto> _destinations = [];
  List<DestinationsDto> get destinations => _destinations;
  DestinationViewmodel({required this.repository});

  Future<void> getDestinations() async {
    _destinations = [];
    notifyListeners();
    try {
      final result = await repository.getDestinations();
      _destinations = [
        DestinationUtils.defaultSelectAllDestinationDto,
        ...result
      ];
      notifyListeners();
    } catch (e) {
      print(e);
      _destinations = [];
      notifyListeners();
    }
  }
}

class DestinationUtils {
  static final DestinationsDto defaultSelectAllDestinationDto = DestinationsDto(
      id: 0,
      name: "Semua destinasi",
      description: "",
      location: "",
      mapEmbedUrl: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      images: []);
}
