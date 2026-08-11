import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/error_handler.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/template_page.dart';
import 'package:oldcityguideapp/core/modules/digital_map/domain/dto/digital_map_routes_dto.dart';
import 'package:oldcityguideapp/core/modules/digital_map/domain/dto/point_destination_dto.dart';
import 'package:oldcityguideapp/core/modules/digital_map/presentations/viewmodels/digital_map_viewmodel.dart';
import 'package:oldcityguideapp/core/ui/button.dart';
import 'package:oldcityguideapp/core/ui/typoghrapy.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';
import 'package:provider/provider.dart';

class DigitalMapDetailScreen extends StatefulWidget {
  final int id;
  const DigitalMapDetailScreen({super.key, required this.id});

  @override
  State<DigitalMapDetailScreen> createState() => _DigitalMapDetailScreenState();
}

class _DigitalMapDetailScreenState extends State<DigitalMapDetailScreen> {
  final MapController _mapController = MapController();
  final PopupController _popupController = PopupController();

  late DigitalMapViewmodel viewmodel;
  int _currentIndex = -1;
  late List<Marker> _markers; // persistent marker list

  @override
  void initState() {
    _markers = [];
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      viewmodel = context.read<DigitalMapViewmodel>();
      await viewmodel.getDetail(widget.id);
      // ignore: use_build_context_synchronously
      final state = context.read<DigitalMapViewmodel>().detailPointsRouteState;
      switch (state) {
        case Success<DigitalMapRoutesDto>(data: final dto):
          _setMarkers(dto);
          if (dto.points.isNotEmpty) {
            _mapController.move(
              LatLng(dto.points.first.location.latitude,
                  dto.points.first.location.longitude),
              12.0,
            );
          }
        default:
          break;
      }
    });
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  /// Show popup for marker at specific index
  void _showMarkerAt(
    int index,
  ) {
    // _markers = _initialMarkers;
    if (_markers.isEmpty) return;

    // Wrap around index if out of range
    if (index < 0) {
      index = _markers.length - 1;
    } else if (index >= _markers.length) {
      index = 0;
    }

    setState(() {
      _currentIndex = index;
    });

    final selectedMarker = _markers[index];

    // Move map to marker
    _mapController.move(selectedMarker.point, _mapController.camera.zoom);
    // _markers = [selectedMarker];
    _popupController.showPopupsOnlyFor([selectedMarker]);
  }

  /// Build markers once and keep them
  void _setMarkers(DigitalMapRoutesDto dto) {
    final markers = dto.points.asMap().entries.map((entry) {
      return Marker(
        key: Key(entry.key.toString()),
        point: LatLng(
          entry.value.location.latitude,
          entry.value.location.longitude,
        ),
        width: 24,
        height: 24,
        child: const Icon(Icons.location_on, color: Colors.red, size: 40),
      );
    }).toList();
    _markers = markers;
  }

  @override
  void didUpdateWidget(covariant DigitalMapDetailScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.id != oldWidget.id) {
      _markers.clear();
      _currentIndex = -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DigitalMapViewmodel>().detailPointsRouteState;
    return TemplatePage(
      title: 'digital_map_title'.tr(),
      child: switch (state) {
        Loading<DigitalMapRoutesDto>() =>
          const Center(child: CircularProgressIndicator()),
        Error<DigitalMapRoutesDto>(message: final message) => ErrorHandler(
            message: message, onRetry: () => viewmodel.getDetail(widget.id)),
        Success<DigitalMapRoutesDto>(data: final dto) =>
          Builder(builder: (context) {
            return Stack(
              children: [
                FlutterMap(
                  key: ValueKey(dto.id), // or widget.id
                  mapController: _mapController,
                  options: MapOptions(
                    onTap: (_, __) => _popupController.hideAllPopups(),
                    initialCenter: LatLng(
                      dto.points.first.location.latitude,
                      dto.points.first.location.longitude,
                    ),
                    initialZoom: 12.0,
                    interactionOptions: const InteractionOptions(
                      flags: ~InteractiveFlag.rotate, // disable rotate
                    ),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.septaalfauzan.oldcityguideapp',
                    ),
                    if (dto.routesPath.isNotEmpty)
                      // Draw route line
                      PolylineLayer(
                        polylines: [
                          Polyline(
                            points: dto.routesPath,
                            color: Colors.blue,
                            strokeWidth: 4.0,
                          ),
                        ],
                      ),

                    // Markers with popup
                    PopupMarkerLayer(
                      options: PopupMarkerLayerOptions(
                        markers: _markers,
                        markerCenterAnimation: MarkerCenterAnimation(
                            duration: Duration(milliseconds: 200)),
                        popupDisplayOptions: PopupDisplayOptions(
                          builder: (context, marker) {
                            final index = _markers.indexOf(marker);
                            final selectedDto = dto.points[index];
                            return PopUpWidget(
                              dto: selectedDto,
                              onNext: () {
                                _showMarkerAt(_currentIndex - 1);
                              },
                              onPrev: () {
                                _showMarkerAt(_currentIndex + 1);
                              },
                              popupController: _popupController,
                            );
                          },
                        ),
                        popupController: _popupController,
                        onPopupEvent: (event, _) {
                          print(event);
                        },
                      ),
                    ),
                  ],
                ),
                // Zoom controls
                Positioned(
                  right: 10,
                  top: 10,
                  child: Column(
                    children: [
                      IconButton(
                        style: AppButton.primaryButton,
                        onPressed: () {
                          _mapController.move(
                            _mapController.camera.center,
                            _mapController.camera.zoom + 1,
                          );
                        },
                        icon: const Icon(Icons.add),
                      ),
                      const SizedBox(height: 8),
                      IconButton(
                        style: AppButton.primaryButton,
                        onPressed: () {
                          _mapController.move(
                            _mapController.camera.center,
                            _mapController.camera.zoom - 1,
                          );
                        },
                        icon: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
      },
    );
  }
}

class PopUpWidget extends StatelessWidget {
  final PointDestinationDto dto;
  final VoidCallback onNext;
  final VoidCallback onPrev;
  final PopupController popupController;
  const PopUpWidget(
      {super.key,
      required this.dto,
      required this.onNext,
      required this.onPrev,
      required this.popupController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 240,
      child: Card(
        elevation: 10,
        color: Colors.white,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () => popupController.hideAllPopups(),
                    icon: FaIcon(FontAwesomeIcons.xmark)),
              ),
              Text(
                "${dto.order}. ${dto.name}",
                style: AppTypoghrapy.subTitle,
              ),
              Expanded(
                child: Text(
                  dto.description,
                  style: AppTypoghrapy.regular,
                ),
              ),
              Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: AppButton.primaryButton,
                    onPressed: onPrev,
                    child: const FaIcon(FontAwesomeIcons.chevronLeft),
                  ),
                  ElevatedButton(
                    style: AppButton.primaryButton,
                    onPressed: onNext,
                    child: const FaIcon(FontAwesomeIcons.chevronRight),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
