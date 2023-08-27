import 'package:assessment_project/model/search_result_model.dart';
import 'package:flutter/material.dart';
import '../data/network/base_api_service.dart';
import '../data/network/network_api_service.dart';
import '../res/app_url.dart';

class HomeRepo {
  final BaseApiService _apiService = NetworkApiService();

  Future<SearchResultModel> fetchSearchResult() async {
    try {
      Map<String, dynamic>? headers = {
        "Accept-Language": "en",
        "X-RapidAPI-Key": "6227c6875fmsh206b95f3280ceaap15fa15jsnacea417c7a60",
        "X-RapidAPI-Host": "edamam-recipe-search.p.rapidapi.com"
      };

      dynamic response =
          await _apiService.getGetApiResponse(AppUrl.searchResult, headers);
      debugPrint("Api Hitted");
      return SearchResultModel.fromJson(response);
    } catch (exception) {
      throw exception.toString();
    }
  }
}
