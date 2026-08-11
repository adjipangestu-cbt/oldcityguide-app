import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:link_text/link_text.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/no_data.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:oldcityguideapp/core/common/domain/dto/gegraphy_dto.dart';
import 'package:oldcityguideapp/core/modules/geography/presentation/viewmodels/geography_viewmodel.dart';
import 'package:oldcityguideapp/core/ui/colors.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';
import 'package:provider/provider.dart';

class GeographyScreen extends StatefulWidget {
  const GeographyScreen({super.key});

  @override
  State<GeographyScreen> createState() => _GeographyScreenState();
}

class _GeographyScreenState extends State<GeographyScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<GeographyViewmodel>().fetchDestinations();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GeographyViewmodel>().allDestinations;

    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.white, title: Text("Geografi Lasem")),
      body: SafeArea(
        child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 40),
            child: switch (state) {
              Loading<List<GeographyDto>>() => Center(
                  child: CircularProgressIndicator(),
                ),
              Success<List<GeographyDto>>(data: final dto) => Visibility(
                  visible: dto.isNotEmpty,
                  replacement: NoData(),
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            tileColor: Colors.white,
                            onTap: () => context.pushNamed('/geography-detail',
                                    queryParameters: {
                                      'id': dto[index].id.toString()
                                    }),
                            title: Text(dto[index].name),
                            trailing: FaIcon(FontAwesomeIcons.chevronRight));
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 12,
                          ),
                      itemCount: dto.length),
                ),
              Error<List<GeographyDto>>(message: final err) => Text(err),
            }),
      ),
    );
  }
}

class TranportationRouteGuideItem extends StatelessWidget {
  final List<String> guidesText;
  final String title;
  const TranportationRouteGuideItem(
      {super.key, required this.guidesText, required this.title});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
          clipBehavior: Clip.hardEdge,
          collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          backgroundColor: Colors.white,
          collapsedBackgroundColor: Colors.white,
          title: Text(title),
          children: guidesText
              .map(
                (guide) => LinkText(
                  guide,
                  linkStyle: TextStyle(color: AppColors.bluePrimary),
                ).pading(const EdgeInsets.symmetric(horizontal: 16)),
              )
              .toList()),
    );
  }
}
