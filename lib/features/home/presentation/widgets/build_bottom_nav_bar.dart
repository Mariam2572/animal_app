import 'package:animal_app/Core/theme/app_color.dart';
import 'package:animal_app/Core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget { // ← غير من StatefulWidget
  final int currentIndex;
  final ValueChanged<int> onTabChanged; // ← أضف هذا

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabChanged, // ← أضف هذا
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(icon: AppAssets.homeIcon, index: 0),
              _buildNavItem(icon: AppAssets.favoriteIcon, index: 1),
              _buildNavItem(icon: AppAssets.chatIcon, index: 2),
              _buildNavItem(icon: AppAssets.profileIcon, index: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required int index,
  }) {
    final isSelected = currentIndex == index;

    return InkWell(
      onTap: () => onTabChanged(index), // ← استدعاء الـ callback
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            isSelected ? AppColor.whiteColor : AppColor.gray,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}