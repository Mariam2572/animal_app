import 'package:animal_app/Core/theme/app_color.dart';
import 'package:animal_app/features/home/data/models/breeds.dart';
import 'package:animal_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
class PetCard extends StatelessWidget {
final Breeds? pet;
  final VoidCallback onTap;

  const PetCard({
    Key? key,
  required this.pet,
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
                imageUrl: pet?.referenceImageId
                              ?.toImageUrl()??'',
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
                    pet?.name??'Unknown',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    pet?.temperament??'Unknown',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.gray,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    pet?.lifeSpan??'Unknown',
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
                        pet?.origin??'Unknown',
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