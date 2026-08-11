import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/destination_dropdown.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/no_data.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/search_input.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/template_page.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/domain/dto/food_culinary_dto.dart';
import 'package:oldcityguideapp/core/modules/food_and_culinary/presentation/viewmodels/food_culinary_viewmodel.dart';
import 'package:oldcityguideapp/core/modules/video/presentation/widgets/atoms/yt_player_item.dart';
import 'package:oldcityguideapp/core/ui/typoghrapy.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';
import 'package:provider/provider.dart';

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
    final padding = const EdgeInsets.all(20);
    return TemplatePage(
      title: 'culinary_title'.tr(),
      child: switch (state) {
        Loading<List<FoodCulinaryDto>>() => Center(
            child: CircularProgressIndicator(),
          ),
        Error<List<FoodCulinaryDto>>(message: final error) =>
          Text(error).pading(padding),
        Success<List<FoodCulinaryDto>>(data: final dto) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchInput(
                      onSearch: (keyword) {
                        viewModel.search(keyword);
                      },
                      placeHolder: 'culinary_search_hint'.tr())
                  .pading(
                const EdgeInsets.symmetric(horizontal: 20),
              ),
              DestinationPicker(onSelect: (id) {
                viewModel.filterByDestination(id);
              }).pading(padding),
              Expanded(
                child: Visibility(
                  visible: dto.isNotEmpty,
                  replacement: Center(child: NoData()),
                  child: ListView.separated(
                    separatorBuilder: (_, index) => SizedBox(
                      height: 20,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    itemCount: dto.length,
                    itemBuilder: (context, index) {
                      final data = dto[index];
                      return Column(
                        children: [
                          Text(
                            data.name,
                            style: AppTypoghrapy.title,
                          ),
                          // image slider container
                          Visibility(
                            visible: data.imageUrls.isNotEmpty,
                            replacement: Container(
                              width: double.infinity,
                              height: 200,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  color: Colors.grey),
                              child: Center(
                                child: Text(
                                  'culinary_image_failed'.tr(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            child: SizedBox(
                              height: 400,
                              child: ListView.separated(
                                separatorBuilder: (_, index) => SizedBox(
                                  width: 20,
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                scrollDirection: Axis.horizontal,
                                itemCount: data.imageUrls.length,
                                itemBuilder: (ctx, imageIndex) {
                                  return Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    width: 328,
                                    child: Image.network(
                                      data.imageUrls[imageIndex],
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          // Video container
                          Visibility(
                            visible: data.ytUrls.isNotEmpty,
                            child: Visibility(
                              visible: data.ytUrls.isNotEmpty,
                              child: SizedBox(
                                width: 348,
                                child: YtPlayerItem(
                                  title: "",
                                  urlId: data.ytUrls.firstOrNull ?? "",
                                ),
                              ),
                            ),
                          ),
                          Text(data.address)
                              .pading(padding.copyWith(bottom: 0)),
                          Text(
                            data.desc,
                            style: AppTypoghrapy.regular,
                          ).pading(padding.copyWith(bottom: 0)),
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
      },
    );
  }
}
