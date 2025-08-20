// pubspec.yaml dependencies needed:
// dependencies:
//   flutter:
//     sdk: flutter
//   http: ^1.1.0
//   provider: ^6.0.5
//   cached_network_image: ^3.3.0

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_app/routing/routing.dart';
import 'package:task_app/routing/routing_name.dart';
import 'package:task_app/services/api_services.dart';
import 'package:task_app/services/splash_services.dart';
import 'package:task_app/view/category_screen/category_provider.dart';
import 'package:task_app/view/favourites_screen/favorites_provider.dart';
import 'package:task_app/view/product_screen/product_provider.dart';
import 'package:task_app/view/splash_screen/splash_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final apiService = ApiService(); // optionally pass apiKey if needed

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService(); // optionally pass apiKey if needed
    final splashServices = SplashServices();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SplashProvider(splashServices: splashServices),
        ),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(
          create: (_) => ProductProvider(apiService: apiService),
        ),
        ChangeNotifierProvider(
          create:
              (_) =>
                  CategoryProvider(apiService: apiService)..fetchCategories(),
        ),
      ],
      child: ScreenUtilInit(
        child: MaterialApp(
          title: 'E-Commerce App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: RoutesName.splashScreen,
          onGenerateRoute: Routes.generateRoute,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
