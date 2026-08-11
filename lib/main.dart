import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oldcityguideapp/core/common/data/destination_repository_impl.dart';
import 'package:oldcityguideapp/core/common/viewmodels/bottom_navigation_viewmodel.dart';
import 'package:oldcityguideapp/core/common/viewmodels/destination_viewmodel.dart';
import 'package:oldcityguideapp/core/modules/about_us/presentation/viewmodels/about_us_viewmodel.dart';
import 'package:oldcityguideapp/core/modules/culture/presentation/viewmodels/culture_viewmodel.dart';
import 'package:oldcityguideapp/core/modules/digital_map/presentations/viewmodels/digital_map_viewmodel.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/presentation/viewmodels/food_culinary_viewmodel.dart';
import 'package:oldcityguideapp/core/modules/geography/presentation/viewmodels/geography_viewmodel.dart';
import 'package:oldcityguideapp/core/modules/history/presentation/viewmodels/history_viewmodel.dart';
import 'package:oldcityguideapp/core/modules/home/presentation/viewmodels/home_viewmodel.dart';
import 'package:oldcityguideapp/core/modules/vacation/presentation/viewmodel/vacation_viewmodel.dart';
import 'package:oldcityguideapp/core/modules/video/presentation/viewmodel/video_viewmodel.dart';
import 'package:oldcityguideapp/core/modules/vr/presentation/viewmodels/vr_videmodels.dart';
import 'package:oldcityguideapp/core/router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('id'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('id'),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNavigationViewmodel(),
        ),
        ChangeNotifierProvider(create: (context) => HomeViewmodel()),
        ChangeNotifierProvider(create: (context) => GeographyViewmodel()),
        ChangeNotifierProvider(create: (context) => VacationViewmodel()),
        ChangeNotifierProvider(create: (context) => HistoryViewmodel()),
        ChangeNotifierProvider(create: (context) => CultureViewmodel()),
        ChangeNotifierProvider(create: (context) => FoodCulinaryViewmodel()),
        ChangeNotifierProvider(create: (context) => VideoViewmodel()),
        ChangeNotifierProvider(create: (context) => AboutUsViewmodel()),
        ChangeNotifierProvider(create: (context) => VrViewmodel()),
        ChangeNotifierProvider(create: (context) => DigitalMapViewmodel()),
        ChangeNotifierProvider(
          create: (context) => DestinationViewmodel(
            repository: DestinationRepositoryImpl(),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
