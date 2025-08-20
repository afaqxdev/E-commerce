import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/const/app_strings.dart';
import 'package:task_app/const/color.dart';
import 'package:task_app/const/images.dart';
import 'package:task_app/uitls/custom_text.dart';
import 'package:task_app/uitls/sizebox_extension.dart';
import 'package:task_app/view/splash_screen/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashProvider = Provider.of<SplashProvider>(context, listen: false);

    // Start initialization only once
    WidgetsBinding.instance.addPostFrameCallback((_) {
      splashProvider.initializeApp(context);
    });

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(splashImage),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black54, // semi-transparent overlay
            BlendMode.darken, // darkens the image
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            50.ph,

            CustomText(
              text: 'My Store',
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            250.ph,
            CustomText.medium(
              'Valkommen',
              color: AppColors.white,
              textAlign: TextAlign.center,
            ),
            30.ph,

            CustomText.small(
              AppStrings.splashSubtitle,
              color: AppColors.white,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
