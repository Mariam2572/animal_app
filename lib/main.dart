import 'package:animal_app/Core/theme/app_theme.dart';
import 'package:animal_app/Core/utils/routing/app_routes.dart';
import 'package:animal_app/Core/utils/routing/routes_genrator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: AppTheme.theme,
        onGenerateRoute: (settings) => generateRoute(settings),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.homeScreen,
      ),
    );
  }
}
