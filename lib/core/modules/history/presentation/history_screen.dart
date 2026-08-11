import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/destination_dropdown.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/no_data.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/search_input.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/template_page.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:oldcityguideapp/core/modules/history/domain/dto/history_item_dto.dart';
import 'package:oldcityguideapp/core/modules/history/presentation/viewmodels/history_viewmodel.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HistoryViewmodel>().fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HistoryViewmodel>();
    final state = context.watch<HistoryViewmodel>().state;
    final padding = const EdgeInsets.symmetric(horizontal: 20);
    return TemplatePage(
      title: "Sejarah",
      child: switch (state) {
        Loading<List<HistoryItemDto>>() =>
          Center(child: CircularProgressIndicator()),
        Error<List<HistoryItemDto>>() => throw UnimplementedError(),
        Success<List<HistoryItemDto>>(data: final dto) => Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              SearchInput(
                      onSearch: (keyword) {
                        viewModel.search(keyword);
                      },
                      placeHolder: "Cari sejarah")
                  .pading(padding),
              DestinationPicker(onSelect: (id) {
                viewModel.filterByDestination(id);
              }).pading(padding),
              Visibility(
                visible: dto.isNotEmpty,
                replacement: Expanded(child: Center(child: NoData())),
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
                            onTap: () => context.pushNamed('/history/detail',
                                queryParameters: {'id': index.toString()}),
                            title: Text(dto[index].name),
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
