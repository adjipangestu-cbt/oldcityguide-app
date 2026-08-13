import 'package:flutter/material.dart';
import 'package:oldcityguideapp/l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oldcityguideapp/core/common/viewmodels/bottom_navigation_viewmodel.dart';
import 'package:oldcityguideapp/core/common/viewmodels/locale_provider.dart';
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeProvider = context.read<LocaleProvider>();
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
                  localeProvider.locale.languageCode.toUpperCase(),
                  style: TextStyle(
                    color: AppColors.bluePrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            tooltip: l10n.languageToggleTooltip,
            onPressed: () => localeProvider.toggleLocale(),
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
                label: l10n.navHome,
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.umbrellaBeach),
                label: l10n.navVacation,
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.vrCardboard),
                label: l10n.navVr,
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.photoFilm),
                label: l10n.navVideo,
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.circleInfo),
                label: l10n.navInformation,
              ),
            ],
            currentIndex: navigationState,
            selectedItemColor: AppColors.bluePrimary,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              bottomNavigationViewmodel.updateNavigationIndex(index);
            },
          ),
        ],
      ),
    );
  }
}
