import 'package:easy_localization/easy_localization.dart';
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
      title: 'about_us_title'.tr(),
      child: switch (state) {
        Loading<List<UserProfileDto>>() => CircularProgressIndicator(),
        Error<List<UserProfileDto>>(message: final error) => Text(error).pading(
            const EdgeInsets.all(20),
          ),
        Success<List<UserProfileDto>>(data: final dto) => ListView.separated(
            itemBuilder: (context, index) {
              final data = dto[index];
              return index == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('about_us_team'.tr(),
                                style: TextStyle(fontWeight: FontWeight.bold))
                            .pading(const EdgeInsets.only(left: 20)),
                        SizedBox(
                          height: 20,
                        ),
                        PersonItem(
                          name: data.name,
                          description: data.description,
                          imageUrl: data.imageUrl,
                        )
                      ],
                    )
                  : PersonItem(
                      name: data.name,
                      description: data.description,
                      imageUrl: data.imageUrl,
                    );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20,
              );
            },
            itemCount: dto.length),
      },
    );
  }
}

class PersonItem extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String description;
  const PersonItem(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.description});

  @override
  State<PersonItem> createState() => _PersonItemState();
}

class _PersonItemState extends State<PersonItem> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
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
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      widget.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  FaIcon(
                    isExpanded
                        ? FontAwesomeIcons.chevronUp
                        : FontAwesomeIcons.chevronDown,
                  ),
                ],
              ).pading(const EdgeInsets.all(8)),
            ),
          ),
          AnimatedSize(
            duration: Duration(milliseconds: 200),
            child: AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: isExpanded
                    ? Text(
                        widget.description,
                        style: TextStyle(color: Colors.grey),
                        softWrap: true,
                      ).pading(const EdgeInsets.all(8))
                    : SizedBox.shrink()),
          ),
        ],
      ),
    ).pading(const EdgeInsets.symmetric(horizontal: 16));
  }
}
