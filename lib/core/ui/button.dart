import 'package:flutter/material.dart';
import 'package:oldcityguideapp/core/ui/colors.dart';

class AppButton {
  static ButtonStyle primaryButton = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(AppColors.bluePrimary),
    foregroundColor: WidgetStateProperty.all(Colors.white),
    iconColor: WidgetStateProperty.all(Colors.white),
  );
  static ButtonStyle whiteButton = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Colors.white),
    foregroundColor: WidgetStateProperty.all(AppColors.bluePrimary),
    elevation: WidgetStatePropertyAll(0),
    iconColor: WidgetStateProperty.all(AppColors.bluePrimary),
  );
  static ButtonStyle whiteButtonOutlined = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Colors.white),
    foregroundColor: WidgetStateProperty.all(AppColors.bluePrimary),
    elevation: WidgetStatePropertyAll(0),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // corner radius
        side: BorderSide(
          width: 1, // border thickness
        ),
      ),
    ),
    iconColor: WidgetStateProperty.all(AppColors.bluePrimary),
  );
}
