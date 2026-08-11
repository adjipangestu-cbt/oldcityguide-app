import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oldcityguideapp/core/common/viewmodels/bottom_navigation_viewmodel.dart';
import 'package:oldcityguideapp/core/ui/button.dart';
import 'package:oldcityguideapp/core/ui/typoghrapy.dart';
import 'package:provider/provider.dart';

class VrBanner extends StatelessWidget {
  const VrBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavigationViewmodel bottomNavigationViewmodel =
        Provider.of<BottomNavigationViewmodel>(context);

    final padding = const EdgeInsets.symmetric(horizontal: 20);
    return Stack(
      children: [
        Container(
          margin: padding,
          height: 318,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.greenAccent,
            image: DecorationImage(
                image: AssetImage('assets/images/vr_bg_img.png'),
                fit: BoxFit.cover),
          ),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'vr_immersive_title'.tr(),
                textAlign: TextAlign.center,
                style: AppTypoghrapy.title.copyWith(color: Colors.white),
              ),
              Text(
                'vr_immersive_desc'.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              ElevatedButton(
                style: AppButton.primaryButton,
                onPressed: () =>
                    bottomNavigationViewmodel.updateNavigationIndex(2),
                child: Row(
                  spacing: 8,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('vr_start_now'.tr()),
                    FaIcon(
                      FontAwesomeIcons.vrCardboard,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset('assets/images/vr_img.png'),
        ),
      ],
    );
  }
}
