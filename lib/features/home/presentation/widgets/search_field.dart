import 'package:animal_app/Core/theme/app_color.dart';
import 'package:animal_app/Core/utils/app_assets.dart';
import 'package:animal_app/features/home/presentation/cubit/home_cubit.dart'
    show HomeState, HomeCubit, HomeStatu;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Row(
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
                    state.state.isLoading && state.searchQuery.isNotEmpty
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : SvgPicture.asset(
                            AppAssets.searchIcon,
                            width: 20,
                            height: 20,
                          ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        onChanged: (query) {
                          context.read<HomeCubit>().searchBreeds(query);
                        },
                        decoration: InputDecoration(
                          hintText: 'Search pets...',
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                          border: InputBorder.none,
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    setState(() {
                                      _searchController.clear();
                                    });
                                    context.read<HomeCubit>().clearSearch();
                                  },
                                )
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
