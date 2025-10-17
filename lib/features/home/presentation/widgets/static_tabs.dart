import 'package:animal_app/features/home/presentation/widgets/category_chip.dart';
import 'package:flutter/material.dart';

class StaticTabs extends StatelessWidget {
  String selectedCategory = 'All';
  StaticTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CategoryChip(
          label: 'All',
          isSelected: selectedCategory == 'All',
          onTap: () {},
        ),
        const SizedBox(width: 12),
        CategoryChip(
          label: 'Cats',
          isSelected: selectedCategory == 'Cats',
          onTap: () {},
        ),
        const SizedBox(width: 12),
        CategoryChip(
          label: 'Dogs',
          isSelected: selectedCategory == 'Dogs',
          onTap: () {},
        ),
        const SizedBox(width: 12),
        CategoryChip(
          label: 'Birds',
          isSelected: selectedCategory == 'Birds',
          onTap: () {},
        ),
        const SizedBox(width: 12),
        CategoryChip(
          label: 'Fish',
          isSelected: selectedCategory == 'Fish',
          onTap: () {},
        ),
        const SizedBox(width: 12),
        CategoryChip(
          label: 'Reptiles',
          isSelected: selectedCategory == 'Reptiles',
          onTap: () {},
        ),
      ],
    );
  }
}
