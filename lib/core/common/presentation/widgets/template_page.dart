import 'package:flutter/material.dart';

class TemplatePage extends StatelessWidget {
  final String title;
  final Widget child;
  const TemplatePage({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(title),
        centerTitle: true,
      ),
      body: SafeArea(child: child),
    );
  }
}
