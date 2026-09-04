import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/map.dart';
import 'package:oldcityguideapp/core/modules/geography/presentation/viewmodels/geography_viewmodel.dart';
import 'package:oldcityguideapp/core/ui/colors.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';
import 'package:oldcityguideapp/core/common/domain/dto/gegraphy_dto.dart';
import 'package:oldcityguideapp/l10n/app_localizations.dart';

class GeographyScreen extends StatefulWidget {
  const GeographyScreen({super.key});

  @override
  State<GeographyScreen> createState() => _GeographyScreenState();
}

class _GeographyScreenState extends State<GeographyScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final vm = context.read<GeographyViewmodel>();
      vm.changeCity(vm.selectedCity);
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<GeographyViewmodel>();
    final state = vm.state;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(AppLocalizations.of(context)!.geographyAppbarTitle),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Segmented Button for City Selection
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(
                      value: 'Lasem',
                      label: Text('Lasem'),
                    ),
                    ButtonSegment(
                      value: 'Malang',
                      label: Text('Malang'),
                    ),
                  ],
                  selected: {vm.selectedCity},
                  onSelectionChanged: (Set<String> newSelection) {
                    vm.changeCity(newSelection.first);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return AppColors.bluePrimary;
                        }
                        return Colors.white;
                      },
                    ),
                    foregroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return Colors.white;
                        }
                        return AppColors.bluePrimary;
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: switch (state) {
                Loading<GeographyDto>() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                Error<GeographyDto>(message: final err) => Center(
                    child: Text(err),
                  ),
                Success<GeographyDto>(data: final data) => SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (data.imageAsset.isNotEmpty)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              data.imageAsset,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                              errorBuilder: (ctx, err, stack) => Container(
                                width: double.infinity,
                                height: 200,
                                color: Colors.grey[300],
                                child: const Icon(Icons.broken_image, color: Colors.grey),
                              ),
                            ),
                          ),
                        const SizedBox(height: 16),
                        Text(
                          data.title.isNotEmpty ? data.title : data.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          data.desc,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Peta Lokasi',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        MapWidget(
                          latitude: data.latLng.latitude,
                          longitude: data.latLng.longitude,
                          markerTitle: data.markerTitle,
                          showPopup: true,
                          showOpenMapsButton: true,
                        ),
                      ],
                    ),
                  ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
