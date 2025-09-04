import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/constants/assets.dart';
import 'package:news/modules/home/model/category_data_model.dart';
import 'package:news/modules/home/pages/category_details_view.dart';
import 'package:news/modules/home/widgets/category_card_widget.dart';
import 'package:news/modules/home/widgets/custom_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryDataModel> category = [
    CategoryDataModel(
        id: 'general', title: 'general'.tr(), img: AppAssets.general),
    CategoryDataModel(
      id: 'business',
      title: 'business'.tr(),
      img: AppAssets.business,
    ),
    CategoryDataModel(
      id: 'entertainment',
      title: 'entertainment'.tr(),
      img: AppAssets.entertainment,
    ),
    CategoryDataModel(
        id: 'health', title: 'health'.tr(), img: AppAssets.health),
    CategoryDataModel(
        id: 'science', title: 'science'.tr(), img: AppAssets.science),
    CategoryDataModel(
      id: 'technology',
      title: 'technology'.tr(),
      img: AppAssets.technology,
    ),
    CategoryDataModel(
        id: 'sports', title: 'sports'.tr(), img: AppAssets.sports),
  ];
  CategoryDataModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: ImageIcon(
              AssetImage(AppAssets.searchIcon),
              color: Colors.black,
            ),
          ),
        ],
        title: Text(
          selectedCategory == null ? "Home".tr() : selectedCategory!.title.tr(),
          style: theme.textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      drawer: CustomDrawer(
        onTap: () {
          setState(() {
            selectedCategory = null;
          });
          Navigator.pop(context);
        },
      ),
      body: selectedCategory == null
          ? Padding(
        padding: EdgeInsets.all(15.0.r),
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16.h,
                  children: [
                    Text(
                      "good Morning \nHere is Some News For You".tr(),
                      style: theme.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CategoryCardWidget(
                          categoryDataModel: category[index],
                          onTap: onCategoryTapped,
                          index: index,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 16.h);
                      },
                      itemCount: category.length,
                    ),
                  ],
                ),
              ),
            )
          : CategoryDetailsView(categoryDataModel: selectedCategory!),
    );
  }

  onCategoryTapped(CategoryDataModel categoryDataModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selectedCategory = categoryDataModel;
      });
      log(categoryDataModel.id);
    });
  }
}
