import 'package:animal_app/Core/theme/app_color.dart';
import 'package:animal_app/features/Favorite/presentation/cubit/favorite_cubit.dart';
import 'package:animal_app/features/Favorite/presentation/widgets/fav_card.dart';
import 'package:animal_app/features/home/presentation/screens/home_screen.dart';
import 'package:animal_app/features/home/presentation/widgets/static_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Favorite Pets',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: StaticTabs(),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<FavoriteCubit, FavoriteState>(
                  builder: (context, state) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: state.getFavorites!.length,
                      itemBuilder: (context, index) {
                    final favoriteItem = state.getFavorites?[index];

                        return state.status.isSuccess? FavCard(
                          imageUrl: favoriteItem?.imageId?.toImageUrl()??'' , name:favoriteItem?.imageId??'' ):Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primary,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              // Expanded(
              //     child: Center(
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Icon(
              //             Icons.favorite_border,
              //             size: 80,
              //             color: AppColor.gray.withOpacity(0.3),
              //           ),
              //           const SizedBox(height: 20),
              //           const Text(
              //             'No Favorites Yet',
              //             style: TextStyle(
              //               fontSize: 20,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
