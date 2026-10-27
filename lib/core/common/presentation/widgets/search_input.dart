import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchInput extends StatefulWidget {
  final Function(String) onSearch;
  final String placeHolder;
  final TextEditingController? externalController;
  const SearchInput({
    super.key,
    required this.onSearch,
    required this.placeHolder,
    this.externalController,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late final TextEditingController controller;
  bool _ownsController = false;

  @override
  void initState() {
    super.initState();
    if (widget.externalController != null) {
      controller = widget.externalController!;
    } else {
      controller = TextEditingController();
      _ownsController = true;
    }
    controller.addListener(() {
      final text = controller.text.trim();
      widget.onSearch(text);
    });
  }

  @override
  void dispose() {
    if (_ownsController) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        suffixIcon: controller.text.trim().isEmpty
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                // ignore: deprecated_member_use
                child: FaIcon(FontAwesomeIcons.search, size: 20),
              )
            : IconButton(
                onPressed: () => controller.clear(),
                icon: FaIcon(FontAwesomeIcons.xmark, size: 20),
              ),
        hintText: widget.placeHolder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ), // Default outlined border
      ),
    );
  }
}
