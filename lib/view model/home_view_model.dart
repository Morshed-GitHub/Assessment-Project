import 'package:assessment_project/model/search_result_model.dart';
import 'package:flutter/material.dart';
import '../data/response/api_response.dart';
import '../repo/home_repo.dart';

class HomeViewModel with ChangeNotifier {
  ApiResponse<SearchResultModel> _apiResponse = ApiResponse.loading();
  final HomeRepo _homeRepo = HomeRepo();

  final TextEditingController _searchController = TextEditingController();
  bool _isTextEntered = false; // Track text entry

  // Getter Method
  ApiResponse<SearchResultModel> get apiResponse => _apiResponse;
  TextEditingController get searchController => _searchController;
  bool get isTextEntered => _isTextEntered; // Track text entry

  void updateTextEntered(String value) {
    debugPrint(searchController.text.toString());
    _isTextEntered = value.trim().isNotEmpty;
    notifyListeners();
  }

  void clearSearchBar() {
    _searchController.clear();
    _isTextEntered = false;
    notifyListeners();
  }

  Future<void> fetchSearchResult() async {
    _setApiResponse(ApiResponse.loading());

    try {
      await _homeRepo.fetchSearchResult().then((value) {
        // if successfully fetched the data, then...
        _setApiResponse(ApiResponse.completed(
            value)); // set the data into apiResponse from where we will access.
        debugPrint('Fetched Api');
      });
    } catch (error) {
      // otherwise throw error
      debugPrint('Error Occured hvm: $error');
      // _setApiResponse(ApiResponse.error(error.toString()));
    }
  }

  // Set Api response according to scenarios like (loading, completed, error)
  void _setApiResponse(ApiResponse<SearchResultModel> response) {
    _apiResponse = response;
    notifyListeners();
  }
}
