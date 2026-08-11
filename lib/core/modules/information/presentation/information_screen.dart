import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:oldcityguideapp/core/ui/colors.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Image.asset('assets/images/logo.png'),
            const SizedBox(height: 20),
            Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: "OLDCITY",
                    style: TextStyle(color: Color(0xFF33658A)),
                  ),
                  TextSpan(
                    text: "GUIDEAPP",
                    style: TextStyle(color: Color(0xFFF26419)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 92),
            Column(
              spacing: 20,
              children: [
                MenuInfoItem(
                  label: 'info_menu_label'.tr(),
                  text: 'info_about_us'.tr(),
                  iconData: FaIcon(FontAwesomeIcons.circleInfo),
                  onTap: () => context.push('/about-us'),
                ),
              ],
            ),
          ],
        ),
      ).pading(EdgeInsets.symmetric(horizontal: 16)),
    );
  }
}

class MenuInfoItem extends StatelessWidget {
  final String label;
  final String text;
  final FaIcon iconData;
  final Function onTap;
  const MenuInfoItem({
    super.key,
    required this.label,
    required this.text,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: TextStyle(color: Colors.grey)),
        ListTile(
          titleTextStyle: TextStyle(color: AppColors.bluePrimary),
          onTap: () => onTap(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          tileColor: Color(0xFFF3F3F3),
          leading: iconData,
          title: Text(text),
          trailing: FaIcon(
            FontAwesomeIcons.chevronRight,
            color: AppColors.bluePrimary,
          ),
        ),
      ],
    );
  }
}
