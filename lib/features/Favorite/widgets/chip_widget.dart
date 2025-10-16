import 'package:animal_app/Core/theme/app_color.dart';
import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  final String label;
  final String value;

  const InfoChip({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.lightCyan,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: AppColor.gray,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: AppColor.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}