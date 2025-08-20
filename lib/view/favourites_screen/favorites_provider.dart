import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:task_app/model/product_model.dart';

import '../../const/app_strings.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Product> _favorites = [];
  List<Product> _filteredFavorites = [];
  String _searchQuery = '';

  List<Product> get favorites =>
      _filteredFavorites.isEmpty && _searchQuery.isEmpty
          ? List.unmodifiable(_favorites)
          : List.unmodifiable(_filteredFavorites);

  bool isFavorite(Product product) {
    return _favorites.any((item) => item.id == product.id);
  }

  void toggleFavorite(Product product) {
    final isFav = isFavorite(product);
    if (isFav) {
      _favorites.removeWhere((item) => item.id == product.id);
    } else {
      _favorites.add(product);
    }
    dev.log(
      AppStrings.toggleFavoriteLog
          .replaceFirst('%s', product.title)
          .replaceFirst('%s', (!isFav).toString()),
    );
    searchFavorites(_searchQuery); // Reapply search filter if active
    notifyListeners();
  }

  void removeFavorite(Product product) {
    _favorites.removeWhere((item) => item.id == product.id);
    dev.log(AppStrings.removeFavoriteLog.replaceFirst('%s', product.title));
    searchFavorites(_searchQuery); // Reapply search filter if active
    notifyListeners();
  }

  void searchFavorites(String query) {
    _searchQuery = query;
    if (query.isEmpty) {
      _filteredFavorites = [];
      dev.log(AppStrings.emptySearchLog.replaceFirst('%s', 'favorites'));
    } else {
      _filteredFavorites =
          _favorites
              .where(
                (product) =>
                    product.title.toLowerCase().contains(query.toLowerCase()) ||
                    product.category.toLowerCase().contains(
                      query.toLowerCase(),
                    ),
              )
              .toList();
      dev.log(
        AppStrings.filteredSearchLog
            .replaceFirst('%s', 'favorites')
            .replaceFirst('%s', query)
            .replaceFirst('%s', _filteredFavorites.toString()),
      );
    }
    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';
    _filteredFavorites = [];
    dev.log(AppStrings.emptySearchLog.replaceFirst('%s', 'favorites'));
    notifyListeners();
  }
}
