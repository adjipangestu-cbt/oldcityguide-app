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
        text: 'Peta Digital',
        onTap: () => context.pushNamed('/digital-map'),
      ),
      MenuItem(
        backgroundColor: Color(0xFF8e86d9),
        icon: Icons.pin_drop, 
        text: 'Geografi',
        onTap: () => context.push('/geography'),
      ),
      MenuItem(
        backgroundColor: Color(0xFFd88786),
        icon: Icons.beach_access, 
        text: 'Destinasi Wisata',
        onTap: () => bottomNavigationViewmodel.updateNavigationIndex(1),
      ),
      MenuItem(
        backgroundColor: Color(0xFF40a99b),
        icon: Icons.view_in_ar, 
        text: 'Virtual Reality',
        onTap: () => bottomNavigationViewmodel.updateNavigationIndex(2),
      ),
      MenuItem(
        backgroundColor: Color(0xFFf2641a),
        icon: Icons.restaurant, 
        text: 'Kafe dan Kuliner',
        onTap: () => context.push('/culinary'),
      ),
      MenuItem(
        backgroundColor: Color(0xFFf4b028),
        icon: Icons.menu_book, 
        text: 'Sejarah',
        onTap: () => context.push('/history'),
      ),
      MenuItem(
        backgroundColor: Color(0xFF2f4758),
        icon: Icons.movie, 
        text: 'Video',
        onTap: () => bottomNavigationViewmodel.updateNavigationIndex(3),
      ),
      MenuItem(
        backgroundColor: Color(0xFFf4b028),
        icon: Icons.menu_book, 
        text: 'Silang Budaya',
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