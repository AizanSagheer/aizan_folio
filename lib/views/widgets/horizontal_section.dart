import 'package:flutter/material.dart';
import 'section_title.dart';

class HorizontalSection extends StatelessWidget {
  final String title;
  final double titleFontSize;
  final double height;
  final List<Widget> children;
  final ScrollController? controller;
  final ScrollbarThemeData? scrollbarTheme;
  const HorizontalSection({
    super.key,
    required this.title,
    required this.height,
    required this.children,
    this.titleFontSize = 22,
    this.controller,
    this.scrollbarTheme,
  });

  @override
  Widget build(BuildContext context) {
    final listView = ListView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: children,
    );
    Widget scrollable = controller != null
        ? Scrollbar(
            controller: controller,
            thumbVisibility: true,
            trackVisibility: true,
            child: listView,
          )
        : listView;
    if (scrollbarTheme != null) {
      scrollable = ScrollbarTheme(
        data: scrollbarTheme!,
        child: scrollable,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: title, fontSize: titleFontSize),
        const SizedBox(height: 16),
        SizedBox(
          height: height,
          child: scrollable,
        ),
      ],
    );
  }
}
