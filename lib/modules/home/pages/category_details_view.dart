import 'package:flutter/material.dart';
import 'package:news/core/constants/color_pallete.dart';
import 'package:news/models/source_data.dart';
import 'package:news/modules/home/model/category_data_model.dart';
import 'package:news/modules/home/widgets/tab_bar_item_widget.dart';
import 'package:news/modules/network/api_requests.dart';

import '../widgets/articales_list_vie.dart';

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView({super.key, required this.categoryDataModel});

  final CategoryDataModel categoryDataModel;

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  @override
  void initState() {
    super.initState();
  }

  int selectecdIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiRequests.getSources(widget.categoryDataModel.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        List<SourceData> sourcesList = snapshot.data ?? [];

        return Column(
          children: [
            DefaultTabController(
              length: sourcesList.length,
              child: TabBar(
                onTap: (index) {
                  //todo
                  setState(() {
                    selectecdIndex = index;
                  });
                },
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: ColorPallete.textDark,

                tabs: sourcesList.map((element) {
                  return TabBarItemWidget(
                    isSelected: selectecdIndex == sourcesList.indexOf(element),
                    sourceData: element,
                  );
                }).toList(),
              ),
            ),
            ArticalesListView(sourceData: sourcesList[selectecdIndex]),
          ],
        );
      },
    );
  }
}
