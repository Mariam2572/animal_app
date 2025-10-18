// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:animal_app/features/home/data/models/breeds.dart';
import 'package:animal_app/features/home/data/repos/repo/breeds_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BreedsRepoContract _breedsRepo;
  
  Timer? _debounceTimer; // ← للـ Debouncing
  
  HomeCubit(this._breedsRepo) : super(HomeState());

  // ✅ 1. جلب البيانات العادية
  Future<void> getBreeds({int limit = 10, int page = 0}) async {
    emit(state.copyWith(state: HomeStaus.loading));
    
    final result = await _breedsRepo.getBreeds(limit: limit, page: page);
    
    result.when(
      success: (data) {
        emit(state.copyWith(
          state: HomeStaus.success,
          breeds: data,
          searchBreeds: null, // ← مسح نتائج البحث القديمة
        ));
      },
      error: (error) {
        emit(state.copyWith(
          state: HomeStaus.failure,
          errorMessage: error.errorMessage,
        ));
      },
    );
  }

  // ✅ 2. البحث مع Debouncing
  void searchBreeds(String query) {
    // إلغاء الـ timer السابق
    _debounceTimer?.cancel();

    // إذا الـ query فاضي، ارجع للبيانات الأصلية
    if (query.trim().isEmpty) {
      emit(state.copyWith(
        searchBreeds: null,
        searchQuery: '',
      ));
      return;
    }

    // إنشاء timer جديد (500ms)
    _debounceTimer = Timer(
      const Duration(milliseconds: 500),
      () => _performSearch(query),
    );
  }

  // ✅ 3. تنفيذ البحث الفعلي
  Future<void> _performSearch(String query) async {
    emit(state.copyWith(
      state: HomeStaus.loading,
      searchQuery: query,
    ));

    final result = await _breedsRepo.searchBreeds(query: query);

    result.when(
      success: (data) {
        emit(state.copyWith(
          state: HomeStaus.success,
          searchBreeds: data,
          searchQuery: query,
        ));
      },
      error: (error) {
        emit(state.copyWith(
          state: HomeStaus.failure,
          errorMessage: error.errorMessage,
          searchQuery: query,
        ));
      },
    );
  }

  // ✅ 4. مسح البحث
  void clearSearch() {
    _debounceTimer?.cancel();
    emit(state.copyWith(
      searchBreeds: null,
      searchQuery: '',
      state: HomeStaus.success,
    ));
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}