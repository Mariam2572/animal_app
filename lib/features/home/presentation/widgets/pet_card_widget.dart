import 'package:animal_app/Core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
class PetCard extends StatelessWidget {
  final String name;
  final String gender;
  final String age;
  final String distance;
  final String image;
  final VoidCallback onTap;

  const PetCard({
    Key? key,
    required this.name,
    required this.gender,
    required this.age,
    required this.distance,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColor.lightGray,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: image,
                width: 80,
                height: 100,
                fit: BoxFit.cover,
                // placeholder: (context, url) {
                //   return Container(
                //     width: 80,
                //     height: 100,
                //     color: AppColor.lightCyan,
                //     child: Center(
                //       child: CircularProgressIndicator(
                //         color: AppColor.primary,
                //       ),
                //     ),
                //   );
                // },
                errorWidget: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 80,
                    color: AppColor.lightCyan,
                    child: Icon(
                      Icons.pets,
                      color: AppColor.primary,
                      size: 40,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    gender,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.gray,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    age,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.gray,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: AppColor.red,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        distance,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColor.gray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite_border,
                color: AppColor.primary,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}