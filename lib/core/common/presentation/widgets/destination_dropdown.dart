import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oldcityguideapp/core/common/domain/dto/destinations_dto.dart';
import 'package:oldcityguideapp/core/common/viewmodels/destination_viewmodel.dart';
import 'package:oldcityguideapp/core/ui/button.dart';
import 'package:oldcityguideapp/core/ui/colors.dart';
import 'package:oldcityguideapp/core/utils/debounce.dart';
import 'package:provider/provider.dart';

class DestinationPicker extends StatefulWidget {
  final Function(int) onSelect;
  const DestinationPicker({super.key, required this.onSelect});

  @override
  State<DestinationPicker> createState() => _DestinationPickerState();
}

class _DestinationPickerState extends State<DestinationPicker> {
  DestinationsDto selectedDestination =
      DestinationUtils.defaultSelectAllDestinationDto;
  final Debounce _debounce = Debounce(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DestinationViewmodel>().getDestinations();
    });
  }

  @override
  Widget build(BuildContext context) {
    final destinations = context.watch<DestinationViewmodel>().destinations;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'destination_label'.tr(),
          style: TextStyle(color: AppColors.greyTerliary, fontSize: 12),
        ),
        ElevatedButton.icon(
          iconAlignment: IconAlignment.end,
          style: AppButton.whiteButtonOutlined,
          onPressed: () => _showDialog(
            CupertinoPicker(
                magnification: 1.22,
                squeeze: 1.2,
                useMagnifier: true,
                itemExtent: 32,
                scrollController: FixedExtentScrollController(
                    initialItem: destinations.indexOf(selectedDestination)),
                onSelectedItemChanged: (int selectedItemIndex) {
                  setState(() {
                    selectedDestination = destinations[selectedItemIndex];
                  });
                  _debounce.run(() {
                    widget.onSelect(destinations[selectedItemIndex].id);
                  });
                },
                children: destinations
                    .map(
                      (destination) => Center(
                        child: Text(destination.name),
                      ),
                    )
                    .toList()),
          ),
          label: Text(selectedDestination.name),
          icon: FaIcon(FontAwesomeIcons.caretDown),
        ),
      ],
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(top: false, child: child),
      ),
    );
  }
}
