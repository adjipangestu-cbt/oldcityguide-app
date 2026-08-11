import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/destination_dropdown.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/error_handler.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/no_data.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/template_page.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:oldcityguideapp/core/modules/digital_map/domain/dto/digital_map_dto.dart';
import 'package:oldcityguideapp/core/modules/digital_map/presentations/viewmodels/digital_map_viewmodel.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';
import 'package:provider/provider.dart';

class DigitalMapScreen extends StatefulWidget {
  const DigitalMapScreen({super.key});

  @override
  State<DigitalMapScreen> createState() => _DigitalMapScreenState();
}

class _DigitalMapScreenState extends State<DigitalMapScreen> {
  late DigitalMapViewmodel viewmodel;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewmodel = context.read<DigitalMapViewmodel>();
      viewmodel.getAllData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DigitalMapViewmodel>().allDigitalMapState;
    final padding = const EdgeInsets.symmetric(horizontal: 20);
    return TemplatePage(
      title: "Peta Digital",
      child: switch (state) {
        Loading<List<DigitalMapDto>>() =>
          Center(child: CircularProgressIndicator()),
        Error<List<DigitalMapDto>>(message: final message) =>
          ErrorHandler(message: message, onRetry: () => viewmodel.getAllData()),
        Success<List<DigitalMapDto>>(data: final dto) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DestinationPicker(onSelect: (id) {
                viewmodel.filterByDestination(id);
              }).pading(padding.copyWith(top: 20)),
              Visibility(
                visible: dto.isNotEmpty,
                replacement: Expanded(child: NoData()),
                child: Expanded(
                  child: ListView.separated(
                      padding: padding.copyWith(top: 20),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            tileColor: Colors.white,
                            onTap: () => context.pushNamed(
                                    '/digital-map-detail',
                                    queryParameters: {
                                      'id': dto[index].id.toString()
                                    }),
                            title: Text(dto[index].name),
                            subtitle: Text(dto[index].description),
                            subtitleTextStyle: TextStyle(color: Colors.grey),
                            trailing: FaIcon(FontAwesomeIcons.chevronRight));
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 12,
                          ),
                      itemCount: dto.length),
                ),
              )
            ],
          )
      },
    );
  }
}
