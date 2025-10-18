import 'package:animal_app/Core/theme/app_color.dart';
import 'package:animal_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:animal_app/features/home/presentation/screens/details_screen.dart';
import 'package:animal_app/features/home/presentation/widgets/erroe_widget.dart';
import 'package:animal_app/features/home/presentation/widgets/pet_card_widget.dart';
import 'package:animal_app/features/home/presentation/widgets/search_field.dart';
import 'package:animal_app/features/home/presentation/widgets/static_tabs.dart';
import 'package:animal_app/features/home/presentation/widgets/title_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleSection(),
              const SizedBox(height: 20),
              SearchField(),
              const SizedBox(height: 24),
              Text('Categories', style: context.theme.textTheme.bodyMedium),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: StaticTabs(),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    final isSearching = state.isSearching;
                    final searchResults = state.searchBreeds ?? [];
                    final normalBreeds = state.breeds;
                    if (state.state.isLoading) {
                      return Skeletonizer(
                        enabled: true,
                        child: ListView.separated(
                          itemCount: 5,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            return PetCard(
                              pet: null,
                              onTap: () {},
                            );
                          },
                        ),
                      );
                    }
                    if (state.state.isFailure) {
                      return CustomErrorWidget(
                        onPressed: () {
                          if (isSearching) {
                                  context.read<HomeCubit>().searchBreeds(
                                    state.searchQuery,
                                  );
                                } else {
                                  context.read<HomeCubit>().getBreeds();
                                }
                        },
                        errorMessage: state.errorMessage,
                      );
                    }

                    if (isSearching && searchResults.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 60,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No results found for "${state.searchQuery}"',
                              style: const TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            TextButton(
                              onPressed: () {
                                context.read<HomeCubit>().clearSearch();
                              },
                              child: const Text('Clear Search'),
                            ),
                          ],
                        ),
                      );
                    }

                    if (!isSearching && normalBreeds.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.pets,
                              size: 60,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'No pets found',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.separated(
                      itemCount: isSearching
                          ? searchResults.length
                          : normalBreeds.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        if (isSearching) {
                          final searchBreed = searchResults[index];
                          

                          return PetCard(
                          pet: searchBreed,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PetDetailsScreen(),
                                ),
                              );
                            },
                          );
                        } else {
                          final breed = normalBreeds[index];
                        
                          return PetCard(
                          pet: breed,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PetDetailsScreen(),
                                ),
                              );
                            },
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension ImageUrlX on String {
  String toImageUrl() {
    return 'https://cdn2.thecatapi.com/images/$this.jpg';
  }
}

extension HelperExtention2 on BuildContext {
  ThemeData get theme => Theme.of(this);
}
