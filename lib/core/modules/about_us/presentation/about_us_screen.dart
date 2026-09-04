import 'package:oldcityguideapp/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/template_page.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:oldcityguideapp/core/modules/about_us/domain/dto/user_profile_dto.dart';
import 'package:oldcityguideapp/core/modules/about_us/presentation/viewmodels/about_us_viewmodel.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';
import 'package:provider/provider.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<AboutUsViewmodel>().fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AboutUsViewmodel>().users;

    return TemplatePage(
      title: AppLocalizations.of(context)!.aboutUsTitle,
      child: switch (state) {
        Loading<List<UserProfileDto>>() => const Center(child: CircularProgressIndicator()),
        Error<List<UserProfileDto>>(message: final error) => Text(error).pading(
            const EdgeInsets.all(20),
          ),
        Success<List<UserProfileDto>>(data: final dto) => ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 20),
            itemBuilder: (context, index) {
              final data = dto[index];
              return index == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.aboutUsTeam,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                            .pading(const EdgeInsets.only(left: 20, bottom: 20)),
                        PersonItem(
                          name: data.name,
                          description: data.description,
                          imageUrl: data.imageUrl,
                          imageAsset: data.imageAsset,
                          isLocalAsset: data.isLocalAsset,
                        )
                      ],
                    )
                  : PersonItem(
                      name: data.name,
                      description: data.description,
                      imageUrl: data.imageUrl,
                      imageAsset: data.imageAsset,
                      isLocalAsset: data.isLocalAsset,
                    );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20);
            },
            itemCount: dto.length),
      },
    );
  }
}

class PersonItem extends StatefulWidget {
  final String imageUrl;
  final String imageAsset;
  final bool isLocalAsset;
  final String name;
  final String description;
  const PersonItem({
    super.key,
    required this.imageUrl,
    required this.imageAsset,
    required this.isLocalAsset,
    required this.name,
    required this.description,
  });

  @override
  State<PersonItem> createState() => _PersonItemState();
}

class _PersonItemState extends State<PersonItem> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Color(0xFFefefef),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            height: 440,
            child: widget.isLocalAsset && widget.imageAsset.isNotEmpty
                ? Image.asset(
                    widget.imageAsset,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, err, st) => _fallbackImage(),
                  )
                : (widget.imageUrl.isNotEmpty
                    ? Image.network(
                        "https://oldcityguideapp.my.id/" + widget.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (ctx, err, st) => _fallbackImage(),
                      )
                    : _fallbackImage()),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        widget.name,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    FaIcon(
                      isExpanded
                          ? FontAwesomeIcons.chevronUp
                          : FontAwesomeIcons.chevronDown,
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: isExpanded
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0).copyWith(top: 0),
                        child: Text(
                          widget.description,
                          style: const TextStyle(color: Colors.grey, height: 1.5),
                          softWrap: true,
                        ),
                      )
                    : const SizedBox.shrink()),
          ),
        ],
      ),
    ).pading(const EdgeInsets.symmetric(horizontal: 20));
  }
  
  Widget _fallbackImage() {
    return Container(
      color: Colors.grey[300],
      child: const Center(
        child: Icon(Icons.person, size: 80, color: Colors.grey),
      ),
    );
  }
}
