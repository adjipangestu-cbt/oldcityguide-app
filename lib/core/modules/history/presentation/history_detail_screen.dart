import 'package:oldcityguideapp/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/image_slider.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/map.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/template_page.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:oldcityguideapp/core/modules/history/domain/dto/history_item_dto.dart';
import 'package:oldcityguideapp/core/modules/history/presentation/viewmodels/history_viewmodel.dart';
import 'package:provider/provider.dart';

class HistoryDetailScreen extends StatefulWidget {
  final int id;
  const HistoryDetailScreen({super.key, required this.id});

  @override
  State<HistoryDetailScreen> createState() => _HistoryDetailScreenState();
}

class _HistoryDetailScreenState extends State<HistoryDetailScreen> {
  HistoryItemDto? _item;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final item = context.read<HistoryViewmodel>().getItem(widget.id);
      setState(() {
        _item = item;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final padding = const EdgeInsets.symmetric(horizontal: 20);
    var document = parse(_item?.desc);
    final htmlData = document.outerHtml;
    return TemplatePage(
        title: _item?.name ?? AppLocalizations.of(context)!.historyDetailDefaultTitle,
        child: SingleChildScrollView(
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_item?.location != null) Text(AppLocalizations.of(context)!.historyLocationLabel).pading(padding),
              if (_item?.location != null)
                MapWidget(
                        latitude: _item!.location!.latitude,
                        longitude: _item!.location!.longitude)
                    .pading(padding),
              if (_item?.imageurls.isNotEmpty == true)
                ImageSlider(images: _item?.imageurls ?? []),
              Html(data: htmlData).pading(padding),
            ],
          ),
        ));
  }
}
