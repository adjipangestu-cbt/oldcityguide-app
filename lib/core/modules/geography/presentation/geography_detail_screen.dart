import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:link_text/link_text.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/map.dart';
import 'package:oldcityguideapp/core/common/domain/dto/gegraphy_dto.dart';
import 'package:oldcityguideapp/core/modules/geography/presentation/viewmodels/geography_viewmodel.dart';
import 'package:oldcityguideapp/core/ui/colors.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';
import 'package:provider/provider.dart';

class GeographyDetailScreen extends StatefulWidget {
  final int destinationid;
  const GeographyDetailScreen({super.key, required this.destinationid});

  @override
  State<GeographyDetailScreen> createState() => _GeographyDetailScreenState();
}

class _GeographyDetailScreenState extends State<GeographyDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      print(widget.destinationid);
      await context.read<GeographyViewmodel>().fetchData(widget.destinationid);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GeographyViewmodel>().state;
    final title = switch (state) {
      Success<GeographyDto>(data: final dto) => dto.name,
      _ => "",
    };
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.white, title: Text('geography_appbar_detail'.tr(args: [title]))),
      body: SafeArea(
        child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 40),
            child: switch (state) {
              Loading<GeographyDto>() => Center(
                  child: CircularProgressIndicator(),
                ),
              Success<GeographyDto>(data: final dto) => Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dto.desc,
                      softWrap: true,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    MapWidget(
                      latitude: dto.latLng.latitude,
                      longitude: dto.latLng.longitude,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      separatorBuilder: (_, index) {
                        return SizedBox(height: 12);
                      },
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: dto.transportationGuides.length,
                      itemBuilder: (context, index) =>
                          TranportationRouteGuideItem(
                              title: dto.transportationGuides[index].title,
                              guidesText:
                                  dto.transportationGuides[index].guides),
                    ),
                  ],
                ),
              Error<GeographyDto>(message: final err) => Text(err),
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
          childrenPadding: EdgeInsets.zero,
          children: guidesText
              .map(
                (guide) => LinkText(
                  guide,
                  linkStyle: TextStyle(color: AppColors.bluePrimary),
                ),
              )
              .toList()),
    );
  }
}
