import 'package:animal_app/Core/helper/helper_extention.dart';
import 'package:animal_app/Core/theme/app_color.dart';
import 'package:animal_app/features/home/presentation/widgets/chip_widget.dart';
import 'package:flutter/material.dart';


class PetDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> pet;

  const PetDetailsScreen({
    Key? key,
    required this.pet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightCyan,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColor.black,
                        size: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: AppColor.primary,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  pet['image'],
                  height: 280,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 280,
                      child: Icon(
                        Icons.pets,
                        color: AppColor.primary,
                        size: 120,
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          pet['name'],
                          style: context.theme.textTheme.titleMedium,
                        ),
                        Text(
                          '\$95',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 18,
                          color: AppColor.red,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          pet['distance'],
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColor.gray,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: InfoChip(
                            label: 'Gender',
                            value: 'Male',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: InfoChip(
                            label: 'Age',
                            value: '1 Year',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: InfoChip(
                            label: 'Weight',
                            value: '10 kg',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'About:',
                      style: context.theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Tom is a playful and loyal Golden Retriever who loves being around people. He\'s 1 years old, full of energy, and always ready for a game of fetch.\n\nTom enjoys morning walks, belly rubs, and taking long naps after playtime.\n\nHe\'s gentle with kids, gets along well with other pets, and makes the perfect family companion.',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.gray,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Adopt me',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

