import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news/core/constants/assets.dart';
import 'package:news/modules/home/model/category_data_model.dart';
import 'package:news/modules/home/widgets/category_card_widget.dart';
import 'package:news/modules/home/widgets/custom_drawer.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryDataModel> category = [
    CategoryDataModel(id: 'general', title: 'General', img: AppAssets.general),
    CategoryDataModel(
      id: 'business',
      title: 'Business',
      img: AppAssets.business,
    ),
    CategoryDataModel(
      id: 'entertainment',
      title: 'Entertainment',
      img: AppAssets.entertainment,
    ),
    CategoryDataModel(id: 'health', title: 'Health', img: AppAssets.health),
    CategoryDataModel(id: 'science', title: 'Science', img: AppAssets.science),
    CategoryDataModel(
      id: 'technology',
      title: 'Technology',
      img: AppAssets.technology,
    ),
    CategoryDataModel(id: 'sports', title: 'Sports', img: AppAssets.sports),
  ];
  CategoryDataModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageIcon(
              AssetImage(AppAssets.searchIcon),
              color: Colors.black,
            ),
          ),
        ],
        title: Text(
          selectedCategory == null ? "Home" : selectedCategory!.title,
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
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Text(
                      "Good Morning \nHere is Some News For You",
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
                        return SizedBox(height: 16);
                      },
                      itemCount: category.length,
                    ),
                  ],
                ),
              ),
            )
          : Text(selectedCategory!.id),
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
