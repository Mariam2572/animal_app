import 'package:animal_app/Core/theme/app_color.dart';
import 'package:animal_app/Core/utils/app_assets.dart';
import 'package:animal_app/features/Favorite/screens/details_screen.dart';
import 'package:animal_app/features/Favorite/widgets/build_bottom_nav_bar.dart';
import 'package:animal_app/features/Favorite/widgets/category_chip.dart';
import 'package:animal_app/features/Favorite/widgets/pet_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Find Your Forever Pet',
                    style: context.theme.textTheme.titleSmall,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColor.lightGray,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.notificationIcon,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: AppColor.lightGray,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.searchIcon,
                            width: 20,
                            height: 20,
                            color: AppColor.gray,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: AppColor.gray,
                                  fontSize: 16,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColor.lightGray,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.settingsIcon,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Categories',
                style: context.theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryChip(
                      label: 'All',
                      isSelected: selectedCategory == 'All',
                      onTap: () {
                        setState(() {
                          selectedCategory = 'All';
                        });
                      },
                    ),
                    const SizedBox(width: 12),
                    CategoryChip(
                      label: 'Cats',
                      isSelected: selectedCategory == 'Cats',
                      onTap: () {
                        setState(() {
                          selectedCategory = 'Cats';
                        });
                      },
                    ),
                    const SizedBox(width: 12),
                    CategoryChip(
                      label: 'Dogs',
                      isSelected: selectedCategory == 'Dogs',
                      onTap: () {
                        setState(() {
                          selectedCategory = 'Dogs';
                        });
                      },
                    ),
                    const SizedBox(width: 12),
                    CategoryChip(
                      label: 'Birds',
                      isSelected: selectedCategory == 'Birds',
                      onTap: () {
                        setState(() {
                          selectedCategory = 'Birds';
                        });
                      },
                    ),
                    const SizedBox(width: 12),
                    CategoryChip(
                      label: 'Fish',
                      isSelected: selectedCategory == 'Fish',
                      onTap: () {
                        setState(() {
                          selectedCategory = 'Fish';
                        });
                      },
                    ),
                    const SizedBox(width: 12),
                    CategoryChip(
                      label: 'Reptiles',
                      isSelected: selectedCategory == 'Reptiles',
                      onTap: () {
                        setState(() {
                          selectedCategory = 'Reptiles';
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: pets.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final pet = pets[index];
                    return PetCard(
                      name: pet['name'],
                      gender: pet['gender'],
                      age: pet['age'],
                      distance: pet['distance'],
                      image: pet['image'],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PetDetailsScreen(pet: pet),
                          ),
                        );
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

extension HelperExtention2 on BuildContext {
  ThemeData get theme => Theme.of(this);
}