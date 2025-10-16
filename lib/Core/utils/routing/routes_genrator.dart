
import 'package:animal_app/Core/utils/routing/app_routes.dart';
import 'package:animal_app/features/Favorite/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.homeScreen:
      return MaterialPageRoute(
        builder: (_) => HomeScreen(),
      );
    
      // return MaterialPageRoute(
      //   builder: (_) => ProductsScreen(
      //     categoryId: args?['categoryId'],
      //     searchTerm: args?['searchTerm'],
      //   ),
      // );
    // case AppRoutes.detailsScreen:
    //   return MaterialPageRoute(builder: (_) => DetailsScreen());

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
