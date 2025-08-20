import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:task_app/config/api_endpoint.dart';
import 'package:task_app/model/category_model.dart';
import 'package:task_app/services/api_services.dart';

import '../../config/api_exception.dart';
import '../../const/app_strings.dart';

enum CategoryState { idle, loading, success, error }

class CategoryProvider extends ChangeNotifier {
  final ApiService apiService;

  CategoryProvider({required this.apiService});

  List<CategoryModel> _categories = [];
  List<CategoryModel> _filteredCategories = [];
  CategoryState _state = CategoryState.idle;
  String? _errorMessage;

  List<CategoryModel> get categories =>
      _filteredCategories.isEmpty ? _categories : _filteredCategories;
  CategoryState get state => _state;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCategories({bool forceRefresh = false}) async {
    if (_categories.isNotEmpty && !forceRefresh) {
      dev.log('Categories already loaded, skipping fetch');
      return; // Skip API call if categories are already loaded
    }

    _state = CategoryState.loading;
    dev.log(
      AppStrings.fetchCategoriesLog.replaceFirst('%s', _state.toString()),
    );
    notifyListeners();

    try {
      final response = await apiService.getApi(ApiEndpoints.categoryApi);
      dev.log(
        AppStrings.rawResponseLog.replaceFirst('%s', response.toString()),
      );

      if (response is List) {
        _categories =
            response.map((json) => CategoryModel.fromJson(json)).toList();
        _filteredCategories = [];
        _state = CategoryState.success;
        dev.log(
          AppStrings.categoriesFetchedLog.replaceFirst(
            '%s',
            _categories.toString(),
          ),
        );
      } else {
        _state = CategoryState.error;
        _errorMessage = AppStrings.unexpectedResponseFormat;
        dev.log(AppStrings.errorLog.replaceFirst('%s', _errorMessage!));
      }
    } catch (e) {
      _state = CategoryState.error;
      _errorMessage = _mapErrorToString(e);
      dev.log(AppStrings.exceptionLog.replaceFirst('%s', _errorMessage!));
    }

    dev.log(
      AppStrings.stateAfterFetchLog.replaceFirst('%s', _state.toString()),
    );
    notifyListeners();
  }

  void searchCategories(String query) {
    if (query.isEmpty) {
      _filteredCategories = [];
      dev.log(AppStrings.emptySearchLog);
    } else {
      _filteredCategories =
          _categories
              .where(
                (category) =>
                    category.name.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
      dev.log(
        AppStrings.filteredCategoriesLog
            .replaceFirst('%s', query)
            .replaceFirst('%s', _filteredCategories.toString()),
      );
    }
    notifyListeners();
  }

  String? _mapErrorToString(dynamic error) {
    if (error is NoInternetException) return AppStrings.noInternetConnection;
    if (error is RequestTimeOutException) return AppStrings.requestTimedOut;
    if (error is UnAuthorisedException) return error.message;
    if (error is FetchDataException) return error.message;
    return AppStrings.genericError;
  }

  void reset() {
    _categories = [];
    _filteredCategories = [];
    _state = CategoryState.idle;
    _errorMessage = null;
    notifyListeners();
  }
}
