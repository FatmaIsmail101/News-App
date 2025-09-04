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

  // القيم الأساسية (ثابتة)
  List<String> themes = ['light', 'dark'];
  List<String> languages = ['en', 'ar'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: MediaQuery.of(context).size.width * .7.w,
      color: Colors.black,
      child: Column(
        children: [
          // Header
          Container(
            color: ColorPallete.backgroundLight,
            alignment: Alignment.center,
            height: 200.h,
            width: double.infinity,
            child: Text(
              "News App".tr(),
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Home button
          Bounceable(
            onTap: () => widget.onTap(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
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

          Divider(
            color: Colors.white,
            thickness: 2.h,
            indent: 20.w,
            endIndent: 20.w,
          ),

          // Theme section
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
                expandedBorder: Border.all(color: Colors.white),
                // ✅ تم التعديل
                closedSuffixIcon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 30.r,
                ),
              ),
              initialItem: themes[0].tr(), // أول قيمة مترجمة
              items: themes.map((t) => t.tr()).toList(),
              onChanged: (value) {
                // هنا ممكن تغير الـ theme بتاع الابلكيشن
              },
            ),
          ),

          Divider(color: Colors.white, thickness: 2, indent: 20, endIndent: 20),

          // Language section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
            child: Bounceable(
              onTap: () {},
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage(AppAssets.language),
                    color: Colors.white,
                  )SizedBox(width: 8.w),
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
                expandedBorder: Border.all(color: Colors.white),
                // ✅
                closedSuffixIcon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 30.r,
                ),
              ),
              initialItem: languages[selectedIndex] == 'en'
                  ? 'english'.tr()
                  : 'arabic'.tr(),
              items: [
                'english'.tr(),
                'arabic'.tr(),
              ],
              onChanged: (value) {
                if (value == 'english'.tr()) {
                  setState(() => selectedIndex = 0);
                  context.setLocale(const Locale("en"));
                } else if (value == 'arabic'.tr()) {
                  setState(() => selectedIndex = 1);
                  context.setLocale(const Locale("ar"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
