import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:news/core/constants/assets.dart';
import 'package:news/core/constants/color_pallete.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key, required this.onTap});

  final Function onTap;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  List<String> themes = ['Light', 'Dark'];
  List<String> language = ['English', 'Arabic'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      color: Colors.black,
      child: Column(
        spacing: 20,
        children: [
          Container(
            color: ColorPallete.backgroundLight,

            alignment: Alignment.center,
            height: 200,
            width: double.infinity,
            child: Text(
              textAlign: TextAlign.center,
              "News App",
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Bounceable(
            onTap: () => widget.onTap(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16,
              ),
              child: Row(
                children: [
                  ImageIcon(AssetImage(AppAssets.home), color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    "Go To Home",
                    style: theme.textTheme.headlineSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(color: Colors.white, thickness: 2, indent: 20, endIndent: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Bounceable(
              onTap: () {},
              child: Row(
                children: [
                  ImageIcon(AssetImage(AppAssets.theme), color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    "Theme",
                    style: theme.textTheme.headlineSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomDropdown<String>(
              decoration: CustomDropdownDecoration(
                hintStyle: theme.textTheme.bodyLarge!.copyWith(
                  color: Colors.black,
                ),
                headerStyle: theme.textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                ),
                closedFillColor: Colors.transparent,
                closedBorder: Border.all(color: Colors.white),
                closedBorderRadius: BorderRadius.all(Radius.circular(16)),
                expandedBorder: BoxBorder.all(color: Colors.white),
                closedSuffixIcon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              initialItem: themes[0],
              items: themes,
              onChanged: (p0) {},
            ),
          ),
          Divider(color: Colors.white, thickness: 2, indent: 20, endIndent: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Bounceable(
              onTap: () {},
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage(AppAssets.language),
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Language",
                    style: theme.textTheme.headlineSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomDropdown<String>(
              decoration: CustomDropdownDecoration(
                hintStyle: theme.textTheme.bodyLarge!.copyWith(
                  color: Colors.black,
                ),
                headerStyle: theme.textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                ),
                closedFillColor: Colors.transparent,
                closedBorder: Border.all(color: Colors.white),
                closedBorderRadius: BorderRadius.all(Radius.circular(16)),
                expandedBorder: BoxBorder.all(color: Colors.white),
                closedSuffixIcon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              initialItem: language[0],
              items: language,
              onChanged: (p0) {},
            ),
          ),
        ],
      ),
    );
  }
}
