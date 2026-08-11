import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchInput extends StatefulWidget {
  final Function(String) onSearch;
  final String placeHolder;
  const SearchInput({
    super.key,
    required this.onSearch,
    required this.placeHolder,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      final text = controller.text.trim();
      widget.onSearch(text);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        suffixIcon: controller.text.trim().isEmpty
            // ignore: deprecated_member_use
            ? FaIcon(FontAwesomeIcons.search)
            : IconButton(
                onPressed: () => controller.clear(),
                icon: FaIcon(FontAwesomeIcons.xmark)),
        hintText: widget.placeHolder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ), // Default outlined border
      ),
    );
  }
}
