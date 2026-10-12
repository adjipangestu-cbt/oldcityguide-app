import 'package:flutter/material.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/data/culinary_mock_data.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/domain/dto/food_culinary_dto.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/presentation/viewmodels/widgets/culinary_image_carousel.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/map.dart';
import 'package:oldcityguideapp/core/ui/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class CulinaryDetailScreen extends StatelessWidget {
  final int id;

  const CulinaryDetailScreen({super.key, required this.id});

  FoodCulinaryDto? _findData() {
    try {
      return culinaryMockData.firstWhere((d) => d.id == id);
    } catch (_) {
      return null;
    }
  }

  Future<void> _openMaps(FoodCulinaryDto data) async {
    final Uri url;
    if (data.mapsUrl.isNotEmpty) {
      url = Uri.parse(data.mapsUrl);
    } else if (data.latitude != 0.0 && data.longitude != 0.0) {
      url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${data.latitude},${data.longitude}',
      );
    } else {
      url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(data.name)}',
      );
    }
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch maps');
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = _findData();

    if (data == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Tidak Ditemukan'),
          backgroundColor: AppColors.bluePrimary,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
        ),
        body: const Center(
          child: Text('Data kuliner tidak ditemukan.'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // App bar tipis di atas carousel
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.bluePrimary,
            foregroundColor: Colors.white,
            title: Text(
              data.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.pop(),
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Carousel foto
                CulinaryImageCarousel(imageUrls: data.imageUrls, height: 280),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nama
                      Text(
                        data.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Chip kategori kultur
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: data.culture.lightColor,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color:
                                      data.culture.color.withOpacity(0.4)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(data.culture.icon,
                                    size: 14, color: data.culture.color),
                                const SizedBox(width: 5),
                                Text(
                                  'Kuliner ${data.culture.label}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: data.culture.color,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (data.yearEstablished.isNotEmpty) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.history,
                                      size: 14, color: Colors.grey),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Sejak ${data.yearEstablished}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 14),

                      // Alamat
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_on,
                              color: Colors.grey, size: 18),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              data.address,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),

                      // Tombol Buka di Google Maps
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () => _openMaps(data),
                          icon: const Icon(Icons.map_outlined),
                          label: const Text('Buka di Google Maps'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.bluePrimary,
                            side: BorderSide(color: AppColors.bluePrimary),
                            padding:
                                const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Deskripsi lengkap
                      const Text(
                        'Deskripsi',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        data.desc,
                        style: const TextStyle(fontSize: 14, height: 1.6),
                        textAlign: TextAlign.justify,
                      ),

                      // Peta lokasi
                      if (data.latitude != 0.0 &&
                          data.longitude != 0.0) ...[
                        const SizedBox(height: 28),
                        const Text(
                          'Peta Lokasi',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        MapWidget(
                          latitude: data.latitude,
                          longitude: data.longitude,
                          markerTitle: data.name,
                          showPopup: true,
                          showOpenMapsButton: false,
                        ),
                      ],
                      const SizedBox(height: 48),
                    ],
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
