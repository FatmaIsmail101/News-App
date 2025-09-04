import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/constants/assets.dart';
import 'package:news/core/constants/color_pallete.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key, required this.onTap});

  final Function onTap;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedIndex = 0;
  List<String> themes = ['Light'.tr(), 'Dark'.tr()];
  List<String> language = ['English'.tr(), 'Arabic'.tr()];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width * .7.w,
      color: Colors.black,
      child: Column(
        spacing: 20.h,
        children: [
          Container(
            color: ColorPallete.backgroundLight,

            alignment: Alignment.center,
            height: 200.h,
            width: double.infinity.w,
            child: Text(
              textAlign: TextAlign.center,
              "News App".tr(),
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Bounceable(
            onTap: () => widget.onTap(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h)),
              child: Row(
                children: [
                  ImageIcon(AssetImage(AppAssets.home), color: Colors.white),
                  SizedBox(width: 8.w),
                  Text(
                    "Go To Home".tr(),
                    style: theme.textTheme.headlineSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(color: Colors.white,
              thickness: 2.h,
              indent: 20.w,
              endIndent: 20.w),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
            child: Bounceable(
              onTap: () {},
              child: Row(
                children: [
                  ImageIcon(AssetImage(AppAssets.theme), color: Colors.white),
                  SizedBox(width: 8.w),
                  Text(
                    "theme".tr(),
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
            padding: EdgeInsets.symmetric(horizontal: 16.0.h),
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
                closedBorderRadius: BorderRadius.all(Radius.circular(16.r)),
                expandedBorder: BoxBorder.all(color: Colors.white),
                closedSuffixIcon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 30.r,
                ),
              ),
              initialItem: themes[0],
              items: themes,
              onChanged: (p0) {},
            ),
          ),
          Divider(color: Colors.white, thickness: 2, indent: 20, endIndent: 20),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
            child: Bounceable(
              onTap: () {},
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage(AppAssets.language),
                    color: Colors.white,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "language".tr(),
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
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
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
                closedBorderRadius: BorderRadius.all(Radius.circular(16.r)),
                expandedBorder: BoxBorder.all(color: Colors.white),
                closedSuffixIcon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 30.r,
                ),
              ),
              initialItem: language[selectedIndex],
              items: language,
              onChanged: (value) {
                if (value == language[0]) {
                  context.setLocale(Locale("en"));
                } else if (value == language[1]) {
                  context.setLocale(Locale('ar'));
                }
              },

            ),
          ),
        ],
      ),
    );
  }
}
