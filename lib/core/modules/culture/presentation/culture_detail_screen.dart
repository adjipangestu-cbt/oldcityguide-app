import 'package:oldcityguideapp/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/image_slider.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/template_page.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:oldcityguideapp/core/modules/culture/domain/dto/culture_item_dto.dart';
import 'package:oldcityguideapp/core/modules/culture/presentation/viewmodels/culture_viewmodel.dart';
import 'package:provider/provider.dart';

class CultureDetailScreen extends StatefulWidget {
  final int id;
  const CultureDetailScreen({super.key, required this.id});

  @override
  State<CultureDetailScreen> createState() => _CultureDetailScreenState();
}

class _CultureDetailScreenState extends State<CultureDetailScreen> {
  CultureItemDto? _item;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final item = context.read<CultureViewmodel>().getItem(widget.id);
      setState(() {
        _item = item;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final padding = const EdgeInsets.symmetric(horizontal: 20);
    return TemplatePage(
      title: _item?.name ?? AppLocalizations.of(context)!.cultureDetailDefaultTitle,
      child: SingleChildScrollView(
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_item?.imageurls.isNotEmpty == true)
              ImageSlider(images: _item?.imageurls ?? []),
            Html(data: _item?.desc ?? "").pading(padding),
          ],
        ),
      ),
    );
  }
}
