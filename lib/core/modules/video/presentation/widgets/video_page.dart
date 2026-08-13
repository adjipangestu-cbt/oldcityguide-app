import 'package:oldcityguideapp/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/destination_dropdown.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/error_handler.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/no_data.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/search_input.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:oldcityguideapp/core/modules/video/domain/dto/yt_video_dto.dart';
import 'package:oldcityguideapp/core/modules/video/presentation/viewmodel/video_viewmodel.dart';
import 'package:oldcityguideapp/core/modules/video/presentation/widgets/atoms/yt_player_item.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';
import 'package:provider/provider.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<VideoViewmodel>().fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = context.watch<VideoViewmodel>().state;
    final viewmodel = context.read<VideoViewmodel>();
    return switch (state) {
      Loading<List<YtVideoDto>>() => Center(
          child: CircularProgressIndicator(),
        ),
      Error<List<YtVideoDto>>(message: final err) => Padding(
          padding: const EdgeInsets.all(20),
          child: ErrorHandler(message: err, onRetry: () => viewmodel.fetch()),
        ),
      Success<List<YtVideoDto>>(data: final dto) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            SearchInput(
              onSearch: (keyword) {
                viewmodel.searchVideo(keyword);
              },
              placeHolder: AppLocalizations.of(context)!.videoSearchHint,
            ).pading(const EdgeInsets.symmetric(horizontal: 20)),
            SizedBox(height: 12),
            DestinationPicker(onSelect: (id) {
              viewmodel.filterByDestinationId(id);
            }).pading(const EdgeInsets.symmetric(horizontal: 20)),
            Expanded(
              child: Visibility(
                visible: dto.isEmpty,
                replacement: ListView.separated(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  separatorBuilder: (_, index) => SizedBox(height: 20),
                  shrinkWrap: true,
                  itemCount: dto.length,
                  itemBuilder: (context, index) => YtPlayerItem(
                      key: Key(dto[index].hashCode.toString()),
                      title: dto[index].name,
                      urlId: dto[index].urlId),
                ),
                child: Center(child: NoData().pading(const EdgeInsets.all(20))),
              ),
            ),
          ],
        )
    };
  }
}
