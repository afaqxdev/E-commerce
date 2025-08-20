import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/const/color.dart';
import 'package:task_app/uitls/custom_text.dart';
import 'package:task_app/view/favourites_screen/favorites_provider.dart';
import 'package:task_app/view/product_screen/widget/product_card.dart';

import '../../const/app_strings.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const CustomText(
          text: AppStrings.favoritesTitle,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, provider, child) {
          final favoritesToShow = provider.favorites;

          if (favoritesToShow.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 20),
                  CustomText.small(AppStrings.noFavoritesFound),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                TextField(
                  controller: searchController,
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
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onChanged: (value) {
                    Provider.of<FavoritesProvider>(
                      context,
                      listen: false,
                    ).searchFavorites(value);
                  },
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemCount: favoritesToShow.length,
                    itemBuilder: (context, index) {
                      final product = favoritesToShow[index];
                      return ProductCard(product: product);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
