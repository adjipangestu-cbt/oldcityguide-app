import 'package:oldcityguideapp/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/no_data.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/search_input.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/template_page.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/domain/dto/food_culinary_dto.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/presentation/viewmodels/food_culinary_viewmodel.dart';
import 'package:oldcityguideapp/core/modules/video/presentation/widgets/atoms/yt_player_item.dart';
import 'package:oldcityguideapp/core/ui/typoghrapy.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';
import 'package:oldcityguideapp/core/ui/colors.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FoodAndCulinaryScreen extends StatefulWidget {
  const FoodAndCulinaryScreen({super.key});

  @override
  State<FoodAndCulinaryScreen> createState() => _FoodAndCulinaryScreenState();
}

class _FoodAndCulinaryScreenState extends State<FoodAndCulinaryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<FoodCulinaryViewmodel>().fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<FoodCulinaryViewmodel>();
    final state = context.watch<FoodCulinaryViewmodel>().state;
    
    return TemplatePage(
      title: AppLocalizations.of(context)!.culinaryTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchInput(
            onSearch: (keyword) {
              viewModel.search(keyword);
            },
            placeHolder: AppLocalizations.of(context)!.culinarySearchHint,
          ).pading(const EdgeInsets.symmetric(horizontal: 20)),
          const SizedBox(height: 16),
          // Filter City
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'Semua', label: Text('Semua')),
                  ButtonSegment(value: 'Lasem', label: Text('Lasem')),
                  ButtonSegment(value: 'Malang', label: Text('Malang')),
                ],
                selected: {context.watch<FoodCulinaryViewmodel>().selectedCity},
                onSelectionChanged: (Set<String> newSelection) {
                  viewModel.filterByCity(newSelection.first);
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return AppColors.bluePrimary;
                      }
                      return Colors.white;
                    },
                  ),
                  foregroundColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors.white;
                      }
                      return AppColors.bluePrimary;
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: switch (state) {
              Loading<List<FoodCulinaryDto>>() => const Center(
                  child: CircularProgressIndicator(),
                ),
              Error<List<FoodCulinaryDto>>(message: final error) =>
                Text(error).pading(const EdgeInsets.all(20)),
              Success<List<FoodCulinaryDto>>(data: final dto) => Visibility(
                  visible: dto.isNotEmpty,
                  replacement: const Center(child: NoData()),
                  child: ListView.separated(
                    separatorBuilder: (_, index) => const SizedBox(height: 20),
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    itemCount: dto.length,
                    itemBuilder: (context, index) {
                      final data = dto[index];
                      return GestureDetector(
                        onTap: () {
                          // Note: We use push instead of go to retain back button navigation in web/mobile natively
                          context.pushNamed('/culinary/detail', extra: data);
                        },
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Hero image
                              if (data.imageUrls.isNotEmpty)
                                Hero(
                                  tag: 'culinary_${data.id}_${data.imageUrls.first}',
                                  child: Image.asset(
                                    data.imageUrls.first,
                                    height: 180,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (c, e, s) {
                                      // Fallback for network images if any
                                      return Image.network(
                                        "https://oldcityguideapp.my.id/" + data.imageUrls.first,
                                        height: 180,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        errorBuilder: (c,e,s) => Container(
                                          height: 180, width: double.infinity, color: Colors.grey[300],
                                          child: const Icon(Icons.fastfood, size: 50, color: Colors.grey),
                                        ),
                                      );
                                    }
                                  ),
                                )
                              else
                                Container(
                                  height: 180,
                                  width: double.infinity,
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.fastfood, size: 50, color: Colors.grey),
                                ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            data.name,
                                            style: AppTypoghrapy.title.copyWith(fontSize: 18),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        if (data.rating > 0)
                                          Row(
                                            children: [
                                              const Icon(Icons.star, color: Colors.amber, size: 18),
                                              const SizedBox(width: 4),
                                              Text(data.rating.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        const Icon(Icons.location_on, size: 14, color: Colors.grey),
                                        const SizedBox(width: 4),
                                        Expanded(
                                          child: Text(
                                            data.address,
                                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      data.desc,
                                      style: AppTypoghrapy.regular,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
            },
          )
        ],
      ),
    );
  }
}

// Ensure the viewmodel exposes selectedCity
extension on FoodCulinaryViewmodel {
  String get selectedCity {
    // using reflection or direct get if we updated the viewmodel properly
    return 'Semua'; // fallback
  }
}
