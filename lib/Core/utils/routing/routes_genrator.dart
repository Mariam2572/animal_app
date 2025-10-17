import 'package:animal_app/Core/config/di.dart';
import 'package:animal_app/Core/utils/routing/app_routes.dart';
import 'package:animal_app/features/home/data/repos/repo/breeds_repo.dart';
import 'package:animal_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:animal_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.homeScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => HomeCubit(getIt.get<BreedsRepoContract>())..getBreeds(),
          child: HomeScreen(),
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
