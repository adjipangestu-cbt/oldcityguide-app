import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:oldcityguideapp/core/modules/about_us/presentation/about_us_screen.dart';
import 'package:oldcityguideapp/core/modules/culture/presentation/culture_detail_screen.dart';
import 'package:oldcityguideapp/core/modules/culture/presentation/culture_screen.dart';
import 'package:oldcityguideapp/core/modules/dashboard/presentation/dashboard_page.dart';
import 'package:oldcityguideapp/core/modules/digital_map/presentations/digital_map_detail_screen.dart';
import 'package:oldcityguideapp/core/modules/digital_map/presentations/digital_map_screen.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/presentation/food_and_culinary_screen.dart';
import 'package:oldcityguideapp/core/modules/geography/presentation/geography_detail_screen.dart';
import 'package:oldcityguideapp/core/modules/geography/presentation/geography_screen.dart';
import 'package:oldcityguideapp/core/modules/history/presentation/history_detail_screen.dart';
import 'package:oldcityguideapp/core/modules/history/presentation/history_screen.dart';
import 'package:oldcityguideapp/core/modules/home/presentation/home_screen.dart';
import 'package:oldcityguideapp/core/modules/vr/presentation/vr_detail_screen.dart';
import 'package:oldcityguideapp/core/modules/kayutangan_heritage/presentation/kayutangan_heritage_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return DashboardPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: '/about-us',
          builder: (BuildContext context, GoRouterState state) {
            return const AboutUsScreen();
          },
        ),
        GoRoute(
          path: '/geography',
          builder: (BuildContext context, GoRouterState state) {
            return const GeographyScreen();
          },
        ),
        GoRoute(
          path: '/geography-detail',
          name: '/geography-detail',
          builder: (BuildContext context, GoRouterState state) {
            final id =
                int.tryParse(state.uri.queryParameters['id'].toString()) ?? 0;
            return GeographyDetailScreen(
              destinationid: id,
            );
          },
        ),
        GoRoute(
          path: '/history',
          builder: (BuildContext context, GoRouterState state) {
            return const HistoryScreen();
          },
        ),
        GoRoute(
          path: '/history/detail',
          name: '/history/detail',
          builder: (BuildContext context, GoRouterState state) {
            final id =
                int.tryParse(state.uri.queryParameters['id'] ?? "0") ?? 0;
            return HistoryDetailScreen(
              id: id,
            );
          },
        ),
        GoRoute(
          path: '/culinary',
          builder: (BuildContext context, GoRouterState state) {
            return const FoodAndCulinaryScreen();
          },
        ),
        GoRoute(
          path: '/culture',
          builder: (BuildContext context, GoRouterState state) {
            return const CultureScreen();
          },
        ),
        GoRoute(
          path: '/culture/detail',
          name: '/culture/detail',
          builder: (BuildContext context, GoRouterState state) {
            final id =
                int.tryParse(state.uri.queryParameters['id'] ?? "0") ?? 0;
            return CultureDetailScreen(
              id: id,
            );
          },
        ),
        GoRoute(
          path: '/digital-map',
          name: '/digital-map',
          builder: (BuildContext context, GoRouterState state) {
            return DigitalMapScreen();
          },
        ),
        GoRoute(
          path: '/digital-map-detail',
          name: '/digital-map-detail',
          builder: (BuildContext context, GoRouterState state) {
            final id =
                int.tryParse(state.uri.queryParameters['id'].toString()) ?? 0;
            return DigitalMapDetailScreen(
              id: id,
            );
          },
        ),
        GoRoute(
          path: '/vr',
          name: '/vr',
          builder: (BuildContext context, GoRouterState state) {
            final imageUrl = state.uri.queryParameters['imageUrl']!;
            final title = state.uri.queryParameters['title']!;
            return VRDetailContent(title: title, imageUrl: imageUrl);
          },
        ),
        GoRoute(
          path: '/kayutangan-heritage',
          builder: (BuildContext context, GoRouterState state) {
            return const KayutanganHeritageScreen();
          },
        ),
      ],
    ),
  ],
);
