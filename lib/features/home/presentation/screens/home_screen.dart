import 'package:animal_app/Core/theme/app_color.dart';
import 'package:animal_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:animal_app/features/home/presentation/screens/details_screen.dart';
import 'package:animal_app/features/home/presentation/widgets/build_bottom_nav_bar.dart';
import 'package:animal_app/features/home/presentation/widgets/pet_card_widget.dart';
import 'package:animal_app/features/home/presentation/widgets/search_field.dart';
import 'package:animal_app/features/home/presentation/widgets/static_tabs.dart';
import 'package:animal_app/features/home/presentation/widgets/title_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> pets = [
    {
      'name': 'Joli',
      'gender': 'Female',
      'age': '5 Months Old',
      'distance': '1.6 km away',
      'image': 'assets/images/cat.jpg',
    },
    {
      'name': 'Tom',
      'gender': 'Male',
      'age': '1 year Old',
      'distance': '2.7 km away',
      'image': 'assets/images/beagle.jpg',
    },
    {
      'name': 'Oliver',
      'gender': 'Male &Female',
      'age': '3 Months Old',
      'distance': '2 km away',
      'image': 'assets/images/birds.jpg',
    },
    {
      'name': 'Shelly',
      'gender': 'Female',
      'age': '1.5 year Old',
      'distance': '3 km away',
      'image': 'assets/images/dog.jpg',
    },
  ];

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
                    if (state.state.isLoading) {
                      return Skeletonizer(
                        enabled: true,
                        child: ListView.separated(
                          itemCount: state.breeds.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                          
                            if (state.state.isSuccess) {
                              return PetCard(
                                name:  'No Name',
                                gender: 'No Gender',
                                age: 'No Age',
                                distance:  'No Distance',
                                image:  'No Image',
                                onTap: () {
                                  
                                },
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      );
                    }
                    return ListView.separated(
                      itemCount: state.breeds.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final breed = state.breeds[index];
                        final breedImage = breed.referenceImageId?.toImageUrl();

                        if (state.state.isSuccess) {
                          return PetCard(
                            name: breed.name ?? 'No Name',
                            gender: breed.temperament ?? 'No Gender',
                            age: breed.lifeSpan ?? 'No Age',
                            distance: breed.origin ?? 'No Distance',
                            image: breedImage ?? 'No Image',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PetDetailsScreen(pet: pets[index]),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
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
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
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
