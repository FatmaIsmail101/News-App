import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/constants/color_pallete.dart';
import 'package:news/modules/home/model/category_data_model.dart';

class CategoryCardWidget extends StatelessWidget {
  final CategoryDataModel categoryDataModel;

  CategoryCardWidget({
    super.key,
    required this.categoryDataModel,
    required this.index,
    required this.onTap,
  });

  int index;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 200.h,
      width: double.infinity.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: ColorPallete.textDark,
        image: DecorationImage(
          image: AssetImage(categoryDataModel.img),
          alignment: index % 2 == 0 ? Alignment.topLeft : Alignment.topRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 50.h,
            left: 16.w,
            right: index % 2 == 0 ? 20.w : 150.w,
            child: Text(
              categoryDataModel.title,
              textAlign: index % 2 == 0 ? TextAlign.right : TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
              ),
            ),
          ),
          Positioned(
            bottom: 16.h,
            right: index % 2 == 0 ? 16.w : 150.w,
            child: Bounceable(
              onTap: () => onTap(categoryDataModel),
              child: Container(
                width: 169.w,
                height: 54.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(84.r),
                  color: Colors.white54,
                ),
                child: Directionality(
                  textDirection: index % 2 == 0
                      ? ui.TextDirection.ltr
                      : ui.TextDirection.rtl,
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.r),
                        child: Text(
                          "view all".tr(),
                          style: theme.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: 25.r,
                        backgroundColor: ColorPallete.backgroundLight,
                        foregroundColor: ColorPallete.backgroundLight,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: ColorPallete.textDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
