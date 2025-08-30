import 'package:flutter/material.dart';
import 'package:news/core/constants/color_pallete.dart';
import 'package:news/models/source_data.dart';

class TabBarItemWidget extends StatelessWidget {
  const TabBarItemWidget({
    super.key,
    required this.sourceData,
    required this.isSelected,
  });

  final SourceData sourceData;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Text(
      sourceData.name,
      style: theme.textTheme.bodyLarge!.copyWith(
        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        fontSize: isSelected ? 16 : 14,
        color: isSelected ? ColorPallete.textDark : Colors.grey,
      ),
    );
  }
}
