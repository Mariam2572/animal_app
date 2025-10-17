// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:animal_app/features/home/data/models/breeds.dart';
import 'package:animal_app/features/home/data/repos/repo/breeds_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BreedsRepoContract _breedsRepo;
  HomeCubit(
    this._breedsRepo,
  ) : super( HomeState());
  getBreeds({int limit = 10, int page = 0}) async {
    emit(state.copyWith(state: HomeStaus.loading));
    final result = await _breedsRepo.getBreeds(limit: limit, page: page);
    result.when(
      success: (data) {
        emit(state.copyWith(state: HomeStaus.success, breeds: data));
        log('success: ${data?.length}');
      },
      error: (error) {
        emit(state.copyWith(
            state: HomeStaus.failure, errorMessage: error.errorMessage));
      },
    );
    
  }
}
