import 'package:oldcityguideapp/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:oldcityguideapp/core/ui/typoghrapy.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/no_data_image.png'),
        Text(
          AppLocalizations.of(context)!.noDataMessage,
          style: AppTypoghrapy.subTitle,
        ),
      ],
    );
  }
}
