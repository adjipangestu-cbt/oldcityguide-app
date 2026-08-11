import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oldcityguideapp/core/common/viewmodels/bottom_navigation_viewmodel.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:oldcityguideapp/core/modules/home/presentation/widgets/atoms/history_item_card.dart';
import 'package:provider/provider.dart';

class LasemHistory extends StatelessWidget {
  final EdgeInsets padding;

  const LasemHistory({super.key, required this.padding});

  @override
  Widget build(BuildContext context) {
    final BottomNavigationViewmodel bottomNavigationViewmodel =
        Provider.of<BottomNavigationViewmodel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'section_know_more'.tr(),
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
        ).pading(padding),
        SizedBox(
            height: 421,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 12,
                children: [
                  SizedBox(),
                  ItemCard(
                    imageUrl: 'assets/images/image.png',
                    title: 'card_history_title'.tr(),
                    desc: 'card_history_desc'.tr(),
                    onTap: () => context.push('/history'),
                  ),
                  ItemCard(
                      imageUrl: 'assets/images/wisata.jpg',
                      title: 'card_destination_title'.tr(),
                      desc: 'card_destination_desc'.tr(),
                      onTap: () =>
                          bottomNavigationViewmodel.updateNavigationIndex(1)),
                  ItemCard(
                    imageUrl: 'assets/images/kuliner.jpg',
                    title: 'card_culinary_title'.tr(),
                    desc: 'card_culinary_desc'.tr(),
                    onTap: () => context.push('/culinary'),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
