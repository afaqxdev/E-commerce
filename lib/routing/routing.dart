import 'package:flutter/material.dart';
import 'package:task_app/model/product_model.dart';
import 'package:task_app/routing/routing_name.dart';
import 'package:task_app/view/product_details/product_details.dart';
import 'package:task_app/view/product_screen/product_screen.dart';

import '../../view/splash_screen/splash_screen.dart';
import '../view/main_screen/main_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case RoutesName.mainScreen:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case RoutesName.productScreen:
        final categoryLink = settings.arguments as String;

        return MaterialPageRoute(
          builder: (context) => ProductsScreen(categoryLink: categoryLink),
        );

      case RoutesName.productDetails:
        final product = settings.arguments as Product;

        return MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(product: product),
        );

      default:
        return MaterialPageRoute(
          builder:
              (context) =>
                  const Scaffold(body: Center(child: Text('No Screen Found'))),
        );
    }
  }
}
