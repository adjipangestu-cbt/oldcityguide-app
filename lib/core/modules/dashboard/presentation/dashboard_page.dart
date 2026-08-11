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
  @override
  Widget build(BuildContext context) {
    final BottomNavigationViewmodel bottomNavigationViewmodel =
        Provider.of<BottomNavigationViewmodel>(context);
    final int navigationState = Provider.of<BottomNavigationViewmodel>(
      context,
    ).selectedIndex;
    return Scaffold(
      body: _widgetOptions.elementAt(navigationState),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConnectionIndicator(),
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.house),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.umbrellaBeach),
                label: 'Wisata',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.vrCardboard),
                label: 'VR',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.photoFilm),
                label: 'Video',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.circleInfo),
                label: 'Informasi',
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
