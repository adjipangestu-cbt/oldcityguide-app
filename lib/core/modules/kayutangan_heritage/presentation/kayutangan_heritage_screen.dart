import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:oldcityguideapp/core/modules/kayutangan_heritage/domain/dto/kayutangan_heritage_dto.dart';
import 'package:oldcityguideapp/core/modules/kayutangan_heritage/presentation/viewmodels/kayutangan_heritage_viewmodel.dart';
import 'package:oldcityguideapp/core/ui/typoghrapy.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';
import 'package:provider/provider.dart';

class KayutanganHeritageScreen extends StatefulWidget {
  const KayutanganHeritageScreen({super.key});

  @override
  State<KayutanganHeritageScreen> createState() =>
      _KayutanganHeritageScreenState();
}

class _KayutanganHeritageScreenState extends State<KayutanganHeritageScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final languageCode = Localizations.localeOf(context).languageCode;
      context
          .read<KayutanganHeritageViewmodel>()
          .fetchData(languageCode: languageCode);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final languageCode = Localizations.localeOf(context).languageCode;
    final vm = context.read<KayutanganHeritageViewmodel>();
    if (vm.state is Success<List<KayutanganHeritageDto>>) {
      vm.fetchData(languageCode: languageCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<KayutanganHeritageViewmodel>();
    final state = vm.state;
    final isId = Localizations.localeOf(context).languageCode == 'id';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(isId
            ? 'Kampung Heritage Kayutangan'
            : 'Kayutangan Heritage Village'),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: switch (state) {
          Loading<List<KayutanganHeritageDto>>() => const Center(
              child: CircularProgressIndicator(),
            ),
          Error<List<KayutanganHeritageDto>>(message: final err) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(err),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final lang =
                          Localizations.localeOf(context).languageCode;
                      vm.fetchData(languageCode: lang);
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          Success<List<KayutanganHeritageDto>>(data: final items) =>
            ListView.separated(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              itemCount: items.length,
              separatorBuilder: (_, __) => const Divider(height: 40),
              itemBuilder: (context, index) {
                final item = items[index];
                return _HeritageItemWidget(item: item);
              },
            ),
        },
      ),
    );
  }
}

class _HeritageItemWidget extends StatefulWidget {
  final KayutanganHeritageDto item;
  const _HeritageItemWidget({required this.item});

  @override
  State<_HeritageItemWidget> createState() => _HeritageItemWidgetState();
}

class _HeritageItemWidgetState extends State<_HeritageItemWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final fullWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          widget.item.title,
          style: AppTypoghrapy.title,
        ),
        const SizedBox(height: 12),

        // Carousel slider (only if images exist)
        if (widget.item.images.isNotEmpty) ...[
          CarouselSlider.builder(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              enlargeCenterPage: false,
              enlargeFactor: 0.3,
              pageSnapping: true,
              viewportFraction: 0.92,
              onPageChanged: (value, _) {
                setState(() {
                  _currentIndex = value;
                });
              },
            ),
            itemCount: widget.item.images.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
              final imageUrl = widget.item.images[itemIndex];
              final isLocalAsset = imageUrl.startsWith('assets/');
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                width: fullWidth * 0.80,
                child: isLocalAsset
                    ? Image.asset(
                        imageUrl,
                        width: fullWidth * 0.80,
                        fit: BoxFit.cover,
                        errorBuilder: (c, e, s) => Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(Icons.image_not_supported,
                                size: 50, color: Colors.grey),
                          ),
                        ),
                      )
                    : Image.network(
                        imageUrl,
                        width: fullWidth * 0.80,
                        fit: BoxFit.cover,
                        errorBuilder: (c, e, s) => Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(Icons.image_not_supported,
                                size: 50, color: Colors.grey),
                          ),
                        ),
                      ),
              );
            },
          ),
          const SizedBox(height: 8),
          // Dot indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.item.images.length, (dotIndex) {
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == dotIndex
                      ? Colors.blue
                      : Colors.grey[400],
                ),
              );
            }),
          ),
          const SizedBox(height: 12),
        ],

        // Content (HTML)
        Html(
          data: widget.item.content,
          style: {
            "div": Style(
              fontSize: FontSize(14),
              lineHeight: const LineHeight(1.6),
              textAlign: TextAlign.justify,
            ),
          },
        ),
      ],
    );
  }
}
