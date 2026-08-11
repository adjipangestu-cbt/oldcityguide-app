import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/destination_dropdown.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/error_handler.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/no_data.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:oldcityguideapp/core/modules/vr/domain/dto/vr_dto.dart';
import 'package:oldcityguideapp/core/modules/vr/presentation/viewmodels/vr_videmodels.dart';
import 'package:oldcityguideapp/core/ui/typoghrapy.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';
import 'package:provider/provider.dart';

class VrScreen extends StatefulWidget {
  const VrScreen({super.key});

  @override
  State<VrScreen> createState() => _VrScreenState();
}

class _VrScreenState extends State<VrScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VrViewmodel>().fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<VrViewmodel>().state;
    final viewmodel = context.read<VrViewmodel>();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Virtual Reality Tempat Bersejarah di Lasem',
            style: AppTypoghrapy.title,
            softWrap: true,
          ).pading(
            const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 35),
          ),

          // Body (must expand to fill remaining space)
          Expanded(
            child: switch (state) {
              Loading<List<VrDto>>() => const Center(
                  child: CircularProgressIndicator(),
                ),
              Error<List<VrDto>>(message: final error) => ErrorHandler(
                  message: error,
                  onRetry: () => viewmodel.fetch(),
                ),
              Success<List<VrDto>>(data: final dto) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Destination filter dropdown
                    DestinationPicker(
                      onSelect: (id) => viewmodel.filterByDestinationId(id),
                    ).pading(
                      const EdgeInsets.symmetric(horizontal: 20)
                          .copyWith(top: 20),
                    ),

                    // List or NoData message
                    Expanded(
                      child: dto.isEmpty
                          ? const Center(child: NoData())
                          : ListView.separated(
                              padding: const EdgeInsets.all(20),
                              itemCount: dto.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 12),
                              itemBuilder: (context, index) {
                                final data = dto[index];
                                return Material(
                                  clipBehavior: Clip.hardEdge,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  color: const Color(0xFFF4F4F4),
                                  child: InkWell(
                                    onTap: () => context.pushNamed(
                                      '/vr',
                                      queryParameters: {
                                        'imageUrl': data.imageUrl,
                                        'title': data.name,
                                      },
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Image
                                        Container(
                                          width: double.infinity,
                                          height: 200,
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Image.network(
                                            data.imageUrl,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        // Title row
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(data.name),
                                            ),
                                            const FaIcon(
                                                FontAwesomeIcons.chevronRight),
                                          ],
                                        ),
                                      ],
                                    ).pading(const EdgeInsets.all(8)),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
            },
          ),
        ],
      ),
    );
  }
}
