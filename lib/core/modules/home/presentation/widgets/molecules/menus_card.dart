import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oldcityguideapp/core/common/viewmodels/bottom_navigation_viewmodel.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:oldcityguideapp/core/modules/home/presentation/widgets/atoms/menu_item.dart';
import 'package:provider/provider.dart';

class MenusCard extends StatelessWidget {
  final EdgeInsets padding;
  const MenusCard({super.key, required this.padding});

  @override
  Widget build(BuildContext context) {
    final BottomNavigationViewmodel bottomNavigationViewmodel =
        Provider.of<BottomNavigationViewmodel>(context);

    final items = [
      MenuItem(
        backgroundColor: Color(0xFF85bbd7),
        icon: Icons.map, 
        text: 'menu_digital_map'.tr(),
        onTap: () => context.pushNamed('/digital-map'),
      ),
      MenuItem(
        backgroundColor: Color(0xFF8e86d9),
        icon: Icons.pin_drop, 
        text: 'menu_geography'.tr(),
        onTap: () => context.push('/geography'),
      ),
      MenuItem(
        backgroundColor: Color(0xFFd88786),
        icon: Icons.beach_access, 
        text: 'menu_destination'.tr(),
        onTap: () => bottomNavigationViewmodel.updateNavigationIndex(1),
      ),
      MenuItem(
        backgroundColor: Color(0xFF40a99b),
        icon: Icons.view_in_ar, 
        text: 'menu_virtual_reality'.tr(),
        onTap: () => bottomNavigationViewmodel.updateNavigationIndex(2),
      ),
      MenuItem(
        backgroundColor: Color(0xFFf2641a),
        icon: Icons.restaurant, 
        text: 'menu_cafe_culinary'.tr(),
        onTap: () => context.push('/culinary'),
      ),
      MenuItem(
        backgroundColor: Color(0xFFf4b028),
        icon: Icons.menu_book, 
        text: 'menu_history'.tr(),
        onTap: () => context.push('/history'),
      ),
      MenuItem(
        backgroundColor: Color(0xFF2f4758),
        icon: Icons.movie, 
        text: 'menu_video'.tr(),
        onTap: () => bottomNavigationViewmodel.updateNavigationIndex(3),
      ),
      MenuItem(
        backgroundColor: Color(0xFFf4b028),
        icon: Icons.menu_book, 
        text: 'menu_culture'.tr(),
        onTap: () => context.push('/culture'),
      ),
    ];

    return Card(
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 4, 
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(), 
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          children: items,
        ),
      ),
    ).pading(padding);
  }
}