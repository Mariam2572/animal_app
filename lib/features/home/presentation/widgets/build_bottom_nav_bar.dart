import 'package:animal_app/Core/theme/app_color.dart';
import 'package:animal_app/Core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

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
              _buildNavItem(
                icon: AppAssets.homeIcon,
                isSelected: currentIndex == 0,
                onTap: () {},
              ),
              _buildNavItem(
                icon: AppAssets.favoriteIcon,
                isSelected: currentIndex == 1,
                onTap: () {},
              ),
              _buildNavItem(
                icon: AppAssets.chatIcon,
                isSelected: currentIndex == 2,
                onTap: () {},
              ),
              _buildNavItem(
                icon: AppAssets.profileIcon,
                isSelected: currentIndex == 3,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
          color: isSelected ? AppColor.whiteColor : AppColor.gray,
        ),
      ),
    );
  }
}