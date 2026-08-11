import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:oldcityguideapp/core/ui/button.dart';

class MapWidget extends StatefulWidget {
  final double latitude;
  final double longitude;
  final bool useMarker;
  const MapWidget(
      {super.key,
      required this.latitude,
      required this.longitude,
      this.useMarker = true});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final MapController _mapController = MapController();
  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      height: 192,
      child: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: LatLng(
                widget.latitude,
                widget.longitude,
              ), // Lasem coords from your URL
              initialZoom: 16.0,
            ),
            children: [
              TileLayer(
                // Bring your own tiles
                urlTemplate:
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSM tile server
                userAgentPackageName:
                    'com.septaalfauzan.oldcityguideapp', // Add your app identifier
                // And many more recommended properties!
              ),
              RichAttributionWidget(
                // Include a stylish prebuilt attribution widget that meets all requirments
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap contributors',
                    onTap: () => print(
                      Uri.parse(
                        'https://openstreetmap.org/copyright',
                      ),
                    ), // (external)
                  ),
                  // Also add images...
                ],
              ),
              if (widget.useMarker)
                MarkerLayer(
                  markers: [
                    Marker(
                        point: LatLng(
                          widget.latitude,
                          widget.longitude,
                        ),
                        width: 80,
                        height: 80,
                        child: FaIcon(
                          FontAwesomeIcons.locationPin,
                          color: Colors.lightBlue,
                        )),
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
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      iconColor: WidgetStatePropertyAll(Colors.black)),
                  onPressed: () {
                    _mapController.move(
                      _mapController.camera.center,
                      _mapController.camera.zoom + 1,
                    );
                  },
                  icon: Icon(Icons.add),
                ),
                SizedBox(height: 8),
                IconButton(
                  style: AppButton.primaryButton.copyWith(
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      iconColor: WidgetStatePropertyAll(Colors.black)),
                  onPressed: () {
                    _mapController.move(
                      _mapController.camera.center,
                      _mapController.camera.zoom - 1,
                    );
                  },
                  icon: Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
