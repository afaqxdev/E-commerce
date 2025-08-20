import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:task_app/const/color.dart';
import 'package:task_app/view/category_screen/catrgory_screen.dart';
import 'package:task_app/view/favourites_screen/favorites_screen.dart';
import 'package:task_app/view/main_screen/main_provider.dart';
import 'package:task_app/view/product_screen/product_screen.dart';
import 'package:task_app/view/user_name/user_name.dart';

import '../../const/app_strings.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const List<Widget> _screens = [
    ProductsScreen(categoryLink: ''),
    CategoriesScreen(),
    FavoritesScreen(),
    UserScreen(),
  ];

  static const List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag),
      activeIcon: _ActiveIcon(Icons.shopping_bag),
      label: AppStrings.navProducts,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      activeIcon: _ActiveIcon(Icons.category),
      label: AppStrings.navCategories,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      activeIcon: _ActiveIcon(Icons.favorite),
      label: AppStrings.navFavorites,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      activeIcon: _ActiveIcon(Icons.person),
      label: AppStrings.navUser,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: Scaffold(
        body: Consumer<NavigationProvider>(
          builder:
              (context, provider, child) => IndexedStack(
                index: provider.currentIndex,
                children: _screens,
              ),
        ),
        bottomNavigationBar: Consumer<NavigationProvider>(
          builder:
              (context, provider, child) => BottomNavigationBar(
                backgroundColor:
                    Theme.of(
                      context,
                    ).bottomNavigationBarTheme.backgroundColor ??
                    AppColors.black,
                currentIndex: provider.currentIndex,
                type: BottomNavigationBarType.fixed,
                selectedItemColor:
                    Theme.of(
                      context,
                    ).bottomNavigationBarTheme.selectedItemColor ??
                    Colors.white,
                unselectedItemColor:
                    Theme.of(
                      context,
                    ).bottomNavigationBarTheme.unselectedItemColor ??
                    Colors.grey[400],
                selectedIconTheme: const IconThemeData(size: 30),
                unselectedIconTheme: const IconThemeData(size: 24),
                selectedLabelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                elevation: 8,
                items: _navItems,
                onTap: (index) {
                  provider.changeIndex(index);
                  HapticFeedback.lightImpact(); // Add haptic feedback
                },
              ),
        ),
      ),
    );
  }
}

class _ActiveIcon extends StatelessWidget {
  final IconData icon;

  const _ActiveIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor
                ?.withValues(alpha: 0.2) ??
            Colors.white24,
      ),
      child: Icon(icon, size: 30),
    );
  }
}
