// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:animal_app/Core/helper/helper_extention.dart';
import 'package:animal_app/Core/theme/app_color.dart';
import 'package:animal_app/Core/utils/app_assets.dart';

class FavCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  const FavCard({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              height: 90,
              width: double.infinity,
              imageUrl: imageUrl,
            errorWidget: (context, url, error) => Icon(Icons.error, color: AppColor.red),
            ),
            const SizedBox(height: 8),
            Text(name, style: context.theme.textTheme.labelLarge),
            // const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: AppColor.red),
                const SizedBox(width: 4),
                Text(
                  '2.5 km away',
                  style: TextStyle(fontSize: 13, color: AppColor.gray),
                ),
                Spacer(),
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
          ],
        ),
      ),
    );
  }
}
