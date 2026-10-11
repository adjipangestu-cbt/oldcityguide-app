import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/domain/dto/food_culinary_dto.dart';

/// Peta interaktif semua 18 titik kuliner.
/// Ketuk marker → popup info singkat.
/// Ketuk "Lihat selengkapnya" → halaman detail tempat.
class CulinaryMapView extends StatefulWidget {
  final List<FoodCulinaryDto> items;

  const CulinaryMapView({super.key, required this.items});

  @override
  State<CulinaryMapView> createState() => _CulinaryMapViewState();
}

class _CulinaryMapViewState extends State<CulinaryMapView> {
  final MapController _mapController = MapController();
  FoodCulinaryDto? _selectedItem;

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  List<LatLng> get _allPoints => widget.items
      .where((i) => i.latitude != 0.0 && i.longitude != 0.0)
      .map((i) => LatLng(i.latitude, i.longitude))
      .toList();

  @override
  Widget build(BuildContext context) {
    final points = _allPoints;

    // Hitung batas kamera agar semua marker terlihat
    MapOptions mapOptions;
    if (points.isNotEmpty) {
      mapOptions = MapOptions(
        initialCameraFit: CameraFit.coordinates(
          coordinates: points,
          padding: const EdgeInsets.all(60),
        ),
        onTap: (_, __) => setState(() => _selectedItem = null),
      );
    } else {
      mapOptions = MapOptions(
        initialCenter: const LatLng(-7.9839, 112.6215),
        initialZoom: 12,
        onTap: (_, __) => setState(() => _selectedItem = null),
      );
    }

    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: mapOptions,
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.septaalfauzan.oldcityguideapp',
            ),
            MarkerLayer(
              markers: widget.items
                  .where((i) => i.latitude != 0.0 && i.longitude != 0.0)
                  .map((item) {
                return Marker(
                  point: LatLng(item.latitude, item.longitude),
                  width: 44,
                  height: 44,
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedItem = item),
                    child: Icon(
                      Icons.location_on,
                      color: item.culture.color,
                      size: 38,
                      shadows: const [
                        Shadow(
                          color: Colors.black38,
                          blurRadius: 4,
                          offset: Offset(1, 2),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  onTap: () => debugPrint('openstreetmap.org/copyright'),
                ),
              ],
            ),
          ],
        ),

        // Zoom controls
        Positioned(
          right: 12,
          top: 12,
          child: Column(
            children: [
              _ZoomButton(
                icon: Icons.add,
                onTap: () => _mapController.move(
                  _mapController.camera.center,
                  _mapController.camera.zoom + 1,
                ),
              ),
              const SizedBox(height: 8),
              _ZoomButton(
                icon: Icons.remove,
                onTap: () => _mapController.move(
                  _mapController.camera.center,
                  _mapController.camera.zoom - 1,
                ),
              ),
            ],
          ),
        ),

        // Legenda warna kategori
        Positioned(
          left: 12,
          bottom: 32,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.92),
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: CulinaryCulture.values.map((c) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.location_on, color: c.color, size: 16),
                      const SizedBox(width: 6),
                      Text(c.label,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500)),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),

        // Popup info saat marker ditekan
        if (_selectedItem != null)
          Positioned(
            bottom: 24,
            left: 16,
            right: 16,
            child: _PopupCard(
              item: _selectedItem!,
              onClose: () => setState(() => _selectedItem = null),
              onDetail: () {
                context.pushNamed(
                  '/culinary/detail',
                  queryParameters: {'id': _selectedItem!.id.toString()},
                );
              },
            ),
          ),
      ],
    );
  }
}

class _ZoomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ZoomButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }
}

class _PopupCard extends StatelessWidget {
  final FoodCulinaryDto item;
  final VoidCallback onClose;
  final VoidCallback onDetail;

  const _PopupCard({
    required this.item,
    required this.onClose,
    required this.onDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Foto + tombol tutup
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: item.imageUrls.isNotEmpty
                    ? Image.asset(
                        item.imageUrls.first,
                        width: double.infinity,
                        height: 120,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          height: 120,
                          color: Colors.grey[300],
                          child: const Icon(Icons.fastfood,
                              size: 40, color: Colors.grey),
                        ),
                      )
                    : Container(
                        height: 120,
                        color: Colors.grey[300],
                        child: const Icon(Icons.fastfood,
                            size: 40, color: Colors.grey),
                      ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: onClose,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(Icons.close,
                        size: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),

          // Info
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: item.culture.lightColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        item.culture.label,
                        style: TextStyle(
                            fontSize: 11,
                            color: item.culture.color,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                if (item.yearEstablished.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text('Berdiri sejak ${item.yearEstablished}',
                      style: const TextStyle(
                          fontSize: 11, color: Colors.grey)),
                ],
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        size: 12, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        item.address,
                        style: const TextStyle(
                            fontSize: 11, color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onDetail,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF33658A),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Lihat selengkapnya',
                        style: TextStyle(fontSize: 13)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
