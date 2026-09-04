import 'package:flutter/material.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/domain/dto/food_culinary_dto.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/map.dart';
import 'package:oldcityguideapp/core/ui/colors.dart';
import 'package:go_router/go_router.dart';

class CulinaryDetailScreen extends StatelessWidget {
  final FoodCulinaryDto data;

  const CulinaryDetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            backgroundColor: AppColors.bluePrimary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.pop(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: data.imageUrls.isNotEmpty
                  ? Hero(
                      tag: 'culinary_${data.id}_${data.imageUrls.first}',
                      child: PageView.builder(
                        itemCount: data.imageUrls.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            data.imageUrls[index],
                            fit: BoxFit.cover,
                            errorBuilder: (c,e,s) {
                              return Image.network(
                                "https://oldcityguideapp.my.id/" + data.imageUrls[index],
                                fit: BoxFit.cover,
                                errorBuilder: (c,e,s) => Container(color: Colors.grey[300]),
                              );
                            }
                          );
                        },
                      ),
                    )
                  : Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.fastfood, size: 50, color: Colors.grey),
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          data.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (data.rating > 0)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.amber.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 20),
                              const SizedBox(width: 4),
                              Text(
                                data.rating.toString(),
                                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  if (data.isLegendary)
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'KULINER LEGENDARIS',
                        style: TextStyle(color: Colors.red, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.grey, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          data.address,
                          style: const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  if (data.yearEstablished.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.history, color: Colors.grey, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            'Berdiri sejak ${data.yearEstablished}',
                            style: const TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  if (data.category.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.category, color: Colors.grey, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            data.category,
                            style: const TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 24),
                  const Text(
                    'Deskripsi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data.desc,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                    textAlign: TextAlign.justify,
                  ),
                  if (data.latitude != 0.0 && data.longitude != 0.0) ...[
                    const SizedBox(height: 24),
                    const Text(
                      'Peta Lokasi',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    MapWidget(
                      latitude: data.latitude,
                      longitude: data.longitude,
                      markerTitle: data.markerTitle.isNotEmpty ? data.markerTitle : data.name,
                      showPopup: true,
                      showOpenMapsButton: true,
                    ),
                  ],
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
