import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/const/color.dart';
import 'package:task_app/uitls/custom_text.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mitt konto')),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 70.h,
            margin: EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://www.example.com/profile_image.jpg',
                  ),
                ),
                title: CustomText.medium(
                  'Afaq Zahir',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                subtitle: CustomText.small(
                  'afaqxdev@gmail.com',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          Card(
            margin: EdgeInsets.all(20.sp),
            child: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: CustomText.small('Kontoinstallningar'),
                  ),
                  ListTile(
                    leading: Icon(Icons.money_rounded),
                    title: CustomText.small('Mina betalmetoder'),
                  ),
                  ListTile(
                    leading: Icon(Icons.support_agent_outlined),
                    title: CustomText.small('Support'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
