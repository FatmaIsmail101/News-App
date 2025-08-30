import 'package:flutter/material.dart';
import 'package:news/models/articales_data.dart';
import 'package:news/models/source_data.dart';
import 'package:news/modules/network/api_requests.dart';

import 'article_item_widget.dart';

class ArticalesListView extends StatelessWidget {
  const ArticalesListView({super.key, required this.sourceData});

  final SourceData sourceData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: ApiRequests.getArticles(sourceData.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          List<ArticlesData> articlesList = snapshot.data ?? [];
          //Ui
          return ListView.separated(
            itemBuilder: (context, index) {
              return ArticleItemWidget(articlesData: articlesList[index]);
            },
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: articlesList.length,
          );
        },
      ),
    );
  }
}
