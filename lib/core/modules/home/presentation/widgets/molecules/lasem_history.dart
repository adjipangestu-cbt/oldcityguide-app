import 'package:flutter/material.dart';
import 'package:oldcityguideapp/l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;
    final BottomNavigationViewmodel bottomNavigationViewmodel =
        Provider.of<BottomNavigationViewmodel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.sectionKnowMore,
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
                    title: l10n.cardHistoryTitle,
                    desc: l10n.cardHistoryDesc,
                    onTap: () => context.push('/history'),
                  ),
                  ItemCard(
                      imageUrl: 'assets/images/wisata.jpg',
                      title: l10n.cardDestinationTitle,
                      desc: l10n.cardDestinationDesc,
                      onTap: () =>
                          bottomNavigationViewmodel.updateNavigationIndex(1)),
                  ItemCard(
                    imageUrl: 'assets/images/kuliner.jpg',
                    title: l10n.cardCulinaryTitle,
                    desc: l10n.cardCulinaryDesc,
                    onTap: () => context.push('/culinary'),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
