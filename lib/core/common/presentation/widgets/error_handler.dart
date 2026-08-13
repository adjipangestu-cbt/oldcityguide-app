import 'package:oldcityguideapp/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ErrorHandler extends StatelessWidget {
  final String message;
  final Function onRetry;
  const ErrorHandler({super.key, required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        Text(message),
        ElevatedButton.icon(
          onPressed: () {
            onRetry();
          },
          icon: FaIcon(FontAwesomeIcons.arrowRotateRight),
          label: Text(AppLocalizations.of(context)!.errorRetry),
        )
      ],
    );
  }
}
