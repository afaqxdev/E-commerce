class AppStrings {
  // HTTP Headers
  static const String contentType = 'application/json';
  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer %s';
  static const String splashSubtitle =
      'Hos ass kan du baka tid has nastan alla Sveriges salonger och motagningar. Baka frisor, massage, skonhetsbehandingar, friskvard och mycket mer.';

  // API Log Messages
  static const String getRequestLog = 'GET request to: %s';
  static const String postRequestLog = 'POST request to: %s';
  static const String postBodyLog = 'POST body: %s';
  static const String putRequestLog = 'PUT request to: %s';
  static const String putBodyLog = 'PUT body: %s';
  static const String deleteRequestLog = 'DELETE request to: %s';

  // User-Facing Error Messages
  static const String noInternetConnection =
      'No internet connection. Please check your network and try again.';
  static const String requestTimedOut =
      'The request timed out. Please try again later.';
  static const String unauthorizedRequest =
      'You are not authorized to perform this action.';
  static const String forbiddenRequest =
      'Access to this resource is forbidden.';
  static const String resourceNotFound =
      'The requested resource was not found.';
  static const String serverError =
      'An error occurred while communicating with the server (Status: %s).';
  static const String unexpectedError =
      'An unexpected error occurred (Status: %s).';
  static const String unexpectedResponseFormat =
      'Failed to load categories due to an unexpected response.';
  static const String genericError = 'Something went wrong. Please try again.';

  // MainScreen Navigation Labels
  static const String navProducts = 'Products';
  static const String navCategories = 'Categories';
  static const String navFavorites = 'Favorites';
  static const String navUser = 'User';

  // CategoriesScreen Strings
  static const String categoriesTitle = 'Categories';
  static const String searchCategoriesHint = 'Search categories...';
  static const String noCategoriesFound = 'No categories found.';

  // FavoritesScreen Strings
  static const String favoritesTitle = 'Favorites';
  static const String searchFavoritesHint = 'Search favorites...';
  static const String noFavoritesFound = 'No favorites yet.';

  // ProductDetailsScreen Strings
  static const String addedToFavorites = 'Added to favorites';
  static const String removedFromFavorites = 'Removed from favorites';
  static const String descriptionLabel = 'Description';
  static const String currencySymbol = '\$';
  static const String discountLabel = '%s%% OFF';
  static const String brandLabel = 'Brand: %s';
  static const String stockLabel = 'Stock: %s';
  static const String productHeroTag = 'product_%s';

  // CategoryProvider Debug Logs
  static const String fetchCategoriesLog = 'State: %s — Fetching categories...';
  static const String rawResponseLog = 'Raw response: %s';
  static const String categoriesFetchedLog =
      'Categories fetched successfully: %s';
  static const String errorLog = 'Error: %s';
  static const String exceptionLog = 'Exception caught: %s';
  static const String stateAfterFetchLog = 'State after fetch: %s';
  static const String emptySearchLog = 'Search query empty — showing all %s';
  static const String filteredSearchLog = 'Filtered %s for "%s": %s';
  static const String filteredCategoriesLog =
      'Filtered categories for "%s": %s';

  // FavoritesProvider Debug Logs
  static const String toggleFavoriteLog =
      'Toggled favorite: %s (isFavorite: %s)';
  static const String removeFavoriteLog = 'Removed favorite: %s';

  // NavigationProvider Debug Logs
  static const String changeNavIndexLog = 'Changed navigation index to: %s';
}
