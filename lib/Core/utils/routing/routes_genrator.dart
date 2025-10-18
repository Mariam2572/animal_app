import 'package:animal_app/Core/config/di.dart';
import 'package:animal_app/Core/constants/constants.dart';
import 'package:animal_app/Core/utils/routing/app_routes.dart';
import 'package:animal_app/features/Favorite/data/repos/repo/fav_repo.dart';
import 'package:animal_app/features/Favorite/presentation/cubit/favorite_cubit.dart';
import 'package:animal_app/features/home/data/repos/repo/breeds_repo.dart';
import 'package:animal_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:animal_app/features/home/presentation/screens/home_screen.dart';
import 'package:animal_app/features/layout/main_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.mainNavigationScreen:
      return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  HomeCubit(getIt.get<BreedsRepoContract>())..getBreeds(),
            ),
            BlocProvider(
              create: (context) => FavoriteCubit(getIt.get<FavRepo>())
              ..getFavorites(dotenv.env['API_KEY']!),
            ),
          ],
          child: const MainNavigationScreen(),
        ),
      );
    case AppRoutes.homeScreen:
      return MaterialPageRoute(builder: (_) => HomeScreen());

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
