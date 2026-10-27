import 'package:oldcityguideapp/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/no_data.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/search_input.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/template_page.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/domain/dto/food_culinary_dto.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/presentation/viewmodels/food_culinary_viewmodel.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/presentation/viewmodels/widgets/culinary_map_view.dart';
import 'package:oldcityguideapp/core/ui/typoghrapy.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';
import 'package:oldcityguideapp/core/ui/colors.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class FoodAndCulinaryScreen extends StatefulWidget {
  const FoodAndCulinaryScreen({super.key});

  @override
  State<FoodAndCulinaryScreen> createState() => _FoodAndCulinaryScreenState();
}

class _FoodAndCulinaryScreenState extends State<FoodAndCulinaryScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final vm = context.read<FoodCulinaryViewmodel>();
      final locale = Localizations.localeOf(context).languageCode;
      vm.setLocaleAndFetch(locale);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context).languageCode;
    context.read<FoodCulinaryViewmodel>().setLocale(locale);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<FoodCulinaryViewmodel>();
    final state = context.watch<FoodCulinaryViewmodel>().state;
    final selectedCulture = context.watch<FoodCulinaryViewmodel>().selectedCulture;
    final viewMode = context.watch<FoodCulinaryViewmodel>().viewMode;

    return TemplatePage(
      title: AppLocalizations.of(context)!.culinaryTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar
          SearchInput(
            externalController: _searchController,
            onSearch: (keyword) {
              viewModel.search(keyword);
            },
            placeHolder: AppLocalizations.of(context)!.culinarySearchHint,
          ).pading(const EdgeInsets.symmetric(horizontal: 20)),
          const SizedBox(height: 12),

          // Culture tabs + Map toggle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: CulinaryCulture.values.map((culture) {
                        final isSelected = culture == selectedCulture;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            selected: isSelected,
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  culture.icon,
                                  size: 16,
                                  color: isSelected ? Colors.white : culture.color,
                                ),
                                const SizedBox(width: 6),
                                Text(culture.localizedLabel(context)),
                              ],
                            ),
                            selectedColor: culture.color,
                            backgroundColor: culture.lightColor,
                            labelStyle: TextStyle(
                              color: isSelected ? Colors.white : culture.color,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                            checkmarkColor: Colors.white,
                            onSelected: (_) {
                              _searchController.clear();
                              viewModel.selectCulture(culture);
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                // Map/List toggle
                IconButton(
                  icon: Icon(
                    viewMode == CulinaryViewMode.map
                        ? Icons.list_rounded
                        : Icons.map_rounded,
                    color: AppColors.bluePrimary,
                  ),
                  tooltip: viewMode == CulinaryViewMode.map
                      ? 'Tampilan List'
                      : 'Tampilan Peta',
                  onPressed: () {
                    viewModel.setViewMode(
                      viewMode == CulinaryViewMode.map
                          ? CulinaryViewMode.list
                          : CulinaryViewMode.map,
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Content area
          Expanded(
            child: switch (state) {
              Loading<List<FoodCulinaryDto>>() => const Center(
                  child: CircularProgressIndicator(),
                ),
              Error<List<FoodCulinaryDto>>(message: final error) =>
                Text(error).pading(const EdgeInsets.all(20)),
              Success<List<FoodCulinaryDto>>(data: final dto) =>
                viewMode == CulinaryViewMode.map
                    ? CulinaryMapView(
                        items: context.read<FoodCulinaryViewmodel>().allData,
                      )
                    : _buildListView(context, dto, selectedCulture),
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListView(
    BuildContext context,
    List<FoodCulinaryDto> dto,
    CulinaryCulture selectedCulture,
  ) {
    // Get culture intro based on current locale
    final intro = context.read<FoodCulinaryViewmodel>().cultureIntros[selectedCulture];

    return CustomScrollView(
      slivers: [
        // Culture intro card
        if (intro != null)
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: selectedCulture.lightColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: selectedCulture.color.withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(selectedCulture.icon,
                          size: 20, color: selectedCulture.color),
                      const SizedBox(width: 8),
                      Text(
                        intro.judul,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: selectedCulture.color,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    intro.pengantar,
                    style: const TextStyle(fontSize: 13, height: 1.5),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),

        // List items
        if (dto.isEmpty)
          const SliverFillRemaining(
            child: Center(child: NoData()),
          )
        else
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final data = dto[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 8),
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(
                        '/culinary/detail',
                        queryParameters: {'id': data.id.toString()},
                      );
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
                            Image.asset(
                              data.imageUrls.first,
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (c, e, s) => Container(
                                height: 180,
                                width: double.infinity,
                                color: Colors.grey[300],
                                child: const Icon(Icons.fastfood,
                                    size: 50, color: Colors.grey),
                              ),
                            )
                          else
                            Container(
                              height: 180,
                              width: double.infinity,
                              color: Colors.grey[300],
                              child: const Icon(Icons.fastfood,
                                  size: 50, color: Colors.grey),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        data.name,
                                        style: AppTypoghrapy.title
                                            .copyWith(fontSize: 18),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    if (data.yearEstablished.isNotEmpty)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Text(
                                          data.yearEstablished,
                                          style: const TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on,
                                        size: 14, color: Colors.grey),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        data.address,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  data.shortDesc,
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
                  ),
                );
              },
              childCount: dto.length,
            ),
          ),

        const SliverToBoxAdapter(child: SizedBox(height: 20)),
      ],
    );
  }
}
