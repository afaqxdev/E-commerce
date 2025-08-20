import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_app/const/app_strings.dart';
import 'package:task_app/const/color.dart';
import 'package:task_app/services/api_services.dart';
import 'package:task_app/uitls/custom_text.dart';
import 'package:task_app/view/product_screen/product_provider.dart';
import 'package:task_app/view/product_screen/widget/product_card.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.categoryLink});
  final String categoryLink;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (_) =>
              ProductProvider(apiService: ApiService())
                ..fetchProducts(categoryLink),
      child: Scaffold(
        backgroundColor: AppColors.white,

        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          title: CustomText.medium('Products'),
          backgroundColor: AppColors.white,
        ),
        body: Consumer<ProductProvider>(
          builder: (context, productProvider, child) {
            if (productProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (productProvider.products.isEmpty) {
              return Center(child: CustomText.medium('No products found'));
            }

            return Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Column(
                children: [
                  TextField(
                    // controller: productProvider.searchController,
                    decoration: InputDecoration(
                      hintText: AppStrings.searchFavoritesHint,
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.black,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.black,
                          width: 1,
                        ),
                      ),
                      filled: true,
                      fillColor: AppColors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onChanged: productProvider.searchProducts,
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.all(10.w),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                      ),
                      itemCount: productProvider.products.length,
                      itemBuilder: (context, index) {
                        final product = productProvider.products[index];
                        return ProductCard(product: product);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
