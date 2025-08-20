import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/routing/routing_name.dart';
import 'package:task_app/view/category_screen/category_provider.dart';
import 'package:task_app/view/category_screen/widget/error_widget.dart';

import '../../const/app_strings.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.categoriesTitle),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Theme.of(context).primaryColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: AppStrings.searchCategoriesHint,
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onChanged: categoryProvider.searchCategories,
            ),
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          switch (categoryProvider.state) {
            case CategoryState.loading:
              return const Center(child: CircularProgressIndicator());

            case CategoryState.error:
              return ErrorWidgetCustom(
                message:
                    categoryProvider.errorMessage ?? AppStrings.genericError,
                onRetry: () {
                  categoryProvider.fetchCategories(forceRefresh: true);
                },
              );

            case CategoryState.success:
              final categories = categoryProvider.categories;
              if (categories.isEmpty) {
                return const Center(child: Text(AppStrings.noCategoriesFound));
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      title: Text(
                        category.name.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesName.productScreen,
                          arguments: category.url,
                        );
                      },
                    ),
                  );
                },
              );

            case CategoryState.idle:
              return const SizedBox.shrink(); // Empty state before loading
          }
        },
      ),
    );
  }
}
