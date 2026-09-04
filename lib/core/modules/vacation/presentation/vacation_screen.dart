import 'package:oldcityguideapp/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/destination_dropdown.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/error_handler.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/map.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/no_data.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/search_input.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:oldcityguideapp/core/modules/vacation/presentation/viewmodel/vacation_viewmodel.dart';
import 'package:oldcityguideapp/core/ui/typoghrapy.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';
import 'package:provider/provider.dart';

import 'package:carousel_slider/carousel_slider.dart';

class VacationScreen extends StatefulWidget {
  const VacationScreen({super.key});

  @override
  State<VacationScreen> createState() => _VacationScreenState();
}

class _VacationScreenState extends State<VacationScreen> {
  @override
  void initState() {
    super.initState();
    final vacationViewmodel = context.read<VacationViewmodel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 1. Ambil kode bahasa dari context ('id' atau 'en')
      final languageCode = Localizations.localeOf(context).languageCode;
      
      Future.microtask(() async {
        // 2. Teruskan kode bahasa ke dalam fungsi fetchData
        await vacationViewmodel.fetchData(languageCode: languageCode);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final vacationViewmodel = Provider.of<VacationViewmodel>(context);
    final state = Provider.of<VacationViewmodel>(context).state;
    return SafeArea(
      child: switch (state) {
        Loading<List<Map<String, Object>>>() => Center(
            child: CircularProgressIndicator(),
          ),
        Success<List<Map<String, Object>>>(data: final data) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchInput(
                      onSearch: (keyword) {
                        vacationViewmodel.search(keyword);
                      },
                      placeHolder: AppLocalizations.of(context)!.vacationSearchHint)
                  .pading(const EdgeInsets.only(top: 24)),
              DestinationPicker(onSelect: (value) {
                vacationViewmodel.filterByDestination(value);
              }).pading(const EdgeInsets.only(top: 12)),
              Visibility(
                visible: data.isNotEmpty,
                replacement: Expanded(child: Center(child: NoData())),
                child: Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(top: 20),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) => VacationItem(
                      name: data[index]['name'].toString(),
                      images: data[index]['images'] as List<String>,
                      description: data[index]['description'].toString(),
                      latLng: LatLng(
                          double.tryParse(data[index]['latitude'].toString()) ??
                              0,
                          double.tryParse(
                                  data[index]['longitude'].toString()) ??
                              0),
                    ),
                  ),
                ),
              ),
            ],
          ).pading(const EdgeInsets.symmetric(horizontal: 20)),
        Error<List<Map<String, Object>>>(message: final message) =>
          ErrorHandler(
                  message: message,
                  onRetry: () {
                    // 3. Jangan lupa tambahkan languageCode juga di fungsi retry
                    final languageCode = Localizations.localeOf(context).languageCode;
                    vacationViewmodel.fetchData(languageCode: languageCode);
                  })
              .pading(const EdgeInsets.all(20))
      },
    );
  }
}

class VacationItem extends StatefulWidget {
  final String name;
  final List<String> images;
  final String description;
  final LatLng? latLng;
  const VacationItem({
    super.key,
    required this.name,
    required this.images,
    required this.description,
    this.latLng,
  });

  @override
  State<VacationItem> createState() => _VacationItemState();
}

class _VacationItemState extends State<VacationItem> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final fullWidth = MediaQuery.of(context).size.width;
    return Column(
      spacing: 8,
      children: [
        Text(widget.name, style: AppTypoghrapy.title),
        Visibility(
          visible: widget.images.isNotEmpty,
          replacement: MapWidget(
              latitude: widget.latLng?.latitude ?? 0,
              longitude: widget.latLng?.longitude ?? 0),
          child: CarouselSlider.builder(
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
            itemCount: widget.images.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              final imageUrl = widget.images[itemIndex].toString();
              final isLocalAsset = imageUrl.startsWith('assets/');
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                width: fullWidth * 0.80,
                child: isLocalAsset
                    ? Image.asset(
                        imageUrl,
                        width: fullWidth * 0.80,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        imageUrl,
                        width: fullWidth * 0.80,
                        fit: BoxFit.cover,
                      ),
              );
            },
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.images.length, (dotIndex) {
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    _currentIndex == dotIndex ? Colors.blue : Colors.grey[400],
              ),
            );
          }),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(widget.description),
        )
      ],
    );
  }
}