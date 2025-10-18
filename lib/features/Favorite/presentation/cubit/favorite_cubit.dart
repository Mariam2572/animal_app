import 'package:animal_app/features/Favorite/data/models/response/favorite_model.dart';
import 'package:animal_app/features/Favorite/data/models/response/get_favorite_model.dart';
import 'package:animal_app/features/Favorite/data/repos/repo/fav_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavRepo _favRepo;
  FavoriteCubit(this._favRepo) : super(FavoriteState());
  
  Future<void> getFavorites(String apiKey) async {
    emit(state.copyWith(status: FavoriteStatus.loading));
    final result = await _favRepo.getFavorites(apiKey);
    result.when(
      success: (data) {
        emit(
          state.copyWith(
            status: FavoriteStatus.success,
            getFavorites: data,
          ),
        );
      },
      error: (error) {
        emit(
          state.copyWith(
            status: FavoriteStatus.failure,
            errorMessage: error.errorMessage,
          ),
        );
      },
    );
  }

}
