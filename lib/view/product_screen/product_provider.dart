import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:task_app/config/api_endpoint.dart';
import 'package:task_app/model/product_model.dart';
import 'package:task_app/services/api_services.dart';

class ProductProvider extends ChangeNotifier {
  final ApiService apiService;

  ProductProvider({required this.apiService});

  List<Product> _products = [];
  List<Product> _filteredProducts = [];
  bool _isLoading = false;

  List<Product> get products => _filteredProducts;
  bool get isLoading => _isLoading;

  Timer? _debounce;

  /// Fetch all products
  Future<void> fetchProducts(String linkApi) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await apiService.getApi(
        linkApi.isEmpty ? ApiEndpoints.productApi : linkApi,
      );
      if (response != null && response['products'] != null) {
        _products =
            (response['products'] as List)
                .map((item) => Product.fromJson(item))
                .toList();
        _filteredProducts = List.from(_products);
      }
    } catch (e) {
      if (kDebugMode) print('Error fetching products: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Fetch single product by ID
  Future<Product?> fetchProductById(int id) async {
    try {
      final response = await apiService.getApi(
        '${ApiEndpoints.singleProduct}$id',
      );
      if (response != null) {
        return Product.fromJson(response);
      }
    } catch (e) {
      if (kDebugMode) print('Error fetching product: $e');
    }
    return null;
  }

  /// Search products with debounce
  void searchProducts(String query, {int debounceMilliseconds = 500}) {
    // Cancel previous timer if exists
    _debounce?.cancel();

    // Start a new debounce timer
    _debounce = Timer(Duration(milliseconds: debounceMilliseconds), () {
      if (query.isEmpty) {
        _filteredProducts = List.from(_products);
      } else {
        _filteredProducts =
            _products
                .where(
                  (product) =>
                      product.title.toLowerCase().contains(
                        query.toLowerCase(),
                      ) ||
                      product.category.toLowerCase().contains(
                        query.toLowerCase(),
                      ),
                )
                .toList();
      }
      notifyListeners();
    });
  }

  /// Get products by category

  @override
  void dispose() {
    _debounce?.cancel(); // Clean up debounce timer
    super.dispose();
  }
}
