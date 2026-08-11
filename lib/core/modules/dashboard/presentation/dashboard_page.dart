import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oldcityguideapp/core/common/viewmodels/bottom_navigation_viewmodel.dart';
import 'package:oldcityguideapp/core/modules/dashboard/presentation/widget/atoms/connection_indicator.dart';
import 'package:oldcityguideapp/core/modules/home/presentation/home_screen.dart';
import 'package:oldcityguideapp/core/modules/information/presentation/information_screen.dart';
import 'package:oldcityguideapp/core/modules/vacation/presentation/vacation_screen.dart';
import 'package:oldcityguideapp/core/modules/video/presentation/widgets/video_page.dart';
import 'package:oldcityguideapp/core/modules/vr/presentation/vr_screen.dart';
import 'package:oldcityguideapp/core/ui/colors.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    VacationScreen(),
    VrScreen(),
    VideoPage(),
    InformationScreen(),
  ];

  void _toggleLanguage(BuildContext context) {
    final currentLocale = context.locale;
    if (currentLocale.languageCode == 'id') {
      context.setLocale(const Locale('en'));
    } else {
      context.setLocale(const Locale('id'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationViewmodel bottomNavigationViewmodel =
        Provider.of<BottomNavigationViewmodel>(context);
    final int navigationState = Provider.of<BottomNavigationViewmodel>(
      context,
    ).selectedIndex;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.language, color: AppColors.bluePrimary),
                const SizedBox(width: 4),
                Text(
                  context.locale.languageCode.toUpperCase(),
                  style: TextStyle(
                    color: AppColors.bluePrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            tooltip: 'language_toggle_tooltip'.tr(),
            onPressed: () => _toggleLanguage(context),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: _widgetOptions.elementAt(navigationState),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConnectionIndicator(),
          BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.house),
                label: 'nav_home'.tr(),
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.umbrellaBeach),
                label: 'nav_vacation'.tr(),
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.vrCardboard),
                label: 'nav_vr'.tr(),
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.photoFilm),
                label: 'nav_video'.tr(),
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.circleInfo),
                label: 'nav_information'.tr(),
              ),
            ],
            currentIndex: navigationState,
            selectedItemColor: AppColors.bluePrimary,
            unselectedItemColor: Colors.grey, // color for
            selectedFontSize: 12,
            unselectedFontSize: 12,
            type: BottomNavigationBarType.fixed, // disables shifting animation
            onTap: (index) {
              bottomNavigationViewmodel.updateNavigationIndex(index);
            },
          ),
        ],
      ),
    );
  }
}
