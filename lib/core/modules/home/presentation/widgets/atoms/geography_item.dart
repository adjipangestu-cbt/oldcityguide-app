import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oldcityguideapp/core/common/domain/dto/gegraphy_dto.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/map.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:oldcityguideapp/core/ui/colors.dart';
import 'package:oldcityguideapp/core/ui/typoghrapy.dart';

class GeographyItem extends StatelessWidget {
  final GeographyDto geographyItem;
  const GeographyItem({super.key, required this.geographyItem});

  @override
  Widget build(BuildContext context) {
    final padding = const EdgeInsets.symmetric(horizontal: 20);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          geographyItem.name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ).pading(padding),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "${geographyItem.desc.substring(0, 120)}..."),
              TextSpan(
                text: " Selengkapnya",
                style: AppTypoghrapy.regular.copyWith(
                  color: AppColors.bluePrimary,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => context.pushNamed('/geography-detail',
                      queryParameters: {'id': geographyItem.id.toString()}),
              ),
            ],
          ),
        ).pading(padding),
        SizedBox(height: 18),
        MapWidget(
          useMarker: true,
          latitude: geographyItem.latLng.latitude,
          longitude: geographyItem.latLng.longitude,
        ).pading(padding),
      ],
    );
  }
}
