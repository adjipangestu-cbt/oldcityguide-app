import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:oldcityguideapp/core/ui/button.dart';
import 'package:url_launcher/url_launcher.dart';

class MapWidget extends StatefulWidget {
  final double latitude;
  final double longitude;
  final bool useMarker;
  // New optional parameters (backward compatible)
  final String? markerTitle;
  final String? markerSubtitle;
  final bool showPopup;
  final bool showOpenMapsButton;

  const MapWidget({
    super.key,
    required this.latitude,
    required this.longitude,
    this.useMarker = true,
    this.markerTitle,
    this.markerSubtitle,
    this.showPopup = false,
    this.showOpenMapsButton = false,
  });

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final MapController _mapController = MapController();
  bool _popupVisible = false;

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant MapWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.latitude != widget.latitude ||
        oldWidget.longitude != widget.longitude) {
      _popupVisible = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _mapController.move(
            LatLng(widget.latitude, widget.longitude),
            16.0,
          );
        }
      });
    }
  }

  void _openInMaps() async {
    final url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${widget.latitude},${widget.longitude}',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch maps');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          height: 192,
          child: Stack(
            children: [
              FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: LatLng(widget.latitude, widget.longitude),
                  initialZoom: 16.0,
                  onTap: (_, __) {
                    if (_popupVisible) {
                      setState(() => _popupVisible = false);
                    }
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.septaalfauzan.oldcityguideapp',
                  ),
                  RichAttributionWidget(
                    attributions: [
                      TextSourceAttribution(
                        'OpenStreetMap contributors',
                        onTap: () => debugPrint('openstreetmap.org/copyright'),
                      ),
                    ],
                  ),
                  if (widget.useMarker)
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(widget.latitude, widget.longitude),
                          width: 80,
                          height: 80,
                          child: GestureDetector(
                            onTap: widget.showPopup
                                ? () => setState(
                                    () => _popupVisible = !_popupVisible)
                                : null,
                            child: const FaIcon(
                              FontAwesomeIcons.locationPin,
                              color: Colors.red,
                              size: 36,
                            ),
                          ),
                        ),
                      ],
                    ),
                  // Popup info window
                  if (widget.showPopup && _popupVisible && widget.markerTitle != null)
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(widget.latitude, widget.longitude),
                          width: 220,
                          height: 100,
                          alignment: Alignment.topCenter,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        widget.markerTitle!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () =>
                                          setState(() => _popupVisible = false),
                                      child: const Icon(Icons.close,
                                          size: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                if (widget.markerSubtitle != null &&
                                    widget.markerSubtitle!.isNotEmpty)
                                  Text(
                                    widget.markerSubtitle!,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
                      style: AppButton.primaryButton.copyWith(
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.white),
                        iconColor:
                            const WidgetStatePropertyAll(Colors.black),
                      ),
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
                      style: AppButton.primaryButton.copyWith(
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.white),
                        iconColor:
                            const WidgetStatePropertyAll(Colors.black),
                      ),
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
          ),
        ),
        if (widget.showOpenMapsButton) ...[
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: AppButton.primaryButton,
              onPressed: _openInMaps,
              icon: const Icon(Icons.map_outlined),
              label: const Text('Open in Maps'),
            ),
          ),
        ],
      ],
    );
  }
}
