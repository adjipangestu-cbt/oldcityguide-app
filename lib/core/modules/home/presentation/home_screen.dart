import 'package:flutter/material.dart';
import 'package:oldcityguideapp/core/common/domain/dto/gegraphy_dto.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/error_handler.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:oldcityguideapp/core/modules/home/presentation/viewmodels/home_viewmodel.dart';
import 'package:oldcityguideapp/core/modules/home/presentation/widgets/atoms/geography_item.dart';
import 'package:oldcityguideapp/core/modules/home/presentation/widgets/atoms/vr_banner.dart';
import 'package:oldcityguideapp/core/modules/home/presentation/widgets/molecules/lasem_history.dart';
import 'package:oldcityguideapp/core/modules/home/presentation/widgets/molecules/menus_card.dart';
import 'package:oldcityguideapp/core/ui/colors.dart';
import 'package:oldcityguideapp/core/ui/typoghrapy.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewmodel homeViewmodel;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeViewmodel = context.read<HomeViewmodel>();
      homeViewmodel.fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final geographyState = context.watch<HomeViewmodel>().geographyState;
    final padding = const EdgeInsets.symmetric(horizontal: 20);
    return Stack(
      children: [
        Image.asset('assets/images/home_bg.png'),
        SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Siang, selamat\ndatang di aplikasi\n',
                      ),
                      TextSpan(
                        text: 'OldCityGuide ',
                        style: TextStyle(
                          color: AppColors.orangeAccentSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'App',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ).pading(padding.copyWith(top: 44, bottom: 44)),
                MenusCard(padding: padding),
                SizedBox(height: 60),
                LasemHistory(padding: padding),
                SizedBox(height: 60),
                VrBanner(),
                SizedBox(height: 60),
                Text(
                  "Geografi",
                  style: AppTypoghrapy.title.copyWith(color: Colors.grey),
                ).pading(padding),
                SizedBox(height: 12),
                switch (geographyState) {
                  Loading<List<GeographyDto>>() =>
                    Center(child: CircularProgressIndicator()),
                  Error<List<GeographyDto>>(message: final message) =>
                    ErrorHandler(
                      message: message,
                      onRetry: () {
                        homeViewmodel.fetchData();
                      },
                    ).pading(padding),
                  Success<List<GeographyDto>>(data: final dto) => SizedBox(
                      height: 400,
                      child: ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 8,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: dto.length,
                        itemBuilder: (context, index) {
                          final data = dto[index];
                          return SizedBox(
                              width: 340,
                              child: GeographyItem(
                                geographyItem: data,
                              ));
                        },
                      ),
                    )
                }
              ],
            ),
          ),
        ),
      ],
    );
  }
}
