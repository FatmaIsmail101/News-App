import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/articales_data.dart';
import 'package:news/models/source_data.dart';
import 'package:news/modules/network/api_constants.dart';
import 'package:news/modules/network/end_points.dart';

abstract class ApiRequests {
  ///1-import http package
  ///2-request get
  ///3-need Uri.parse String Url
  static Future<List<SourceData>> getSources(String categoryId) async {
    Map<String, dynamic>? queryParameters = {
      "apiKey": ApiConstants.apiKey,
      "categoryId": categoryId,
    };
    final response = await http.get(
      Uri.https(ApiConstants.baseUrl, EndPoints.getSources, queryParameters),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      SourcesListData sourcesListDat = SourcesListData.fromJson(data);
      return sourcesListDat.sources;
    } else {
      throw Exception("Failed to load data");
    }
  }

  static Future<List<ArticlesData>> getArticles(String sourceId) async {
    Map<String, dynamic>? queryParameters = {
      "apiKey": ApiConstants.apiKey,
      "source": sourceId,
    };
    final response = await http.get(
      Uri.https(ApiConstants.baseUrl, EndPoints.everything, queryParameters),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      NewsData newsData = NewsData.fromJosn(data);
      return newsData.articales;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
