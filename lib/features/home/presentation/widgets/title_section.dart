import 'package:animal_app/Core/theme/app_color.dart';
import 'package:animal_app/Core/utils/app_assets.dart';
import 'package:animal_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return     Row(
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
              )
          ;
  }
}