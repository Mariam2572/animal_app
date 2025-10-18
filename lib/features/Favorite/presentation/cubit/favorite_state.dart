// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorite_cubit.dart';

enum FavoriteStatus { initial, loading, success, failure }
extension FavoriteStatu on FavoriteStatus {
  bool get isInitial => this == FavoriteStatus.initial;
  bool get isLoading => this == FavoriteStatus.loading;
  bool get isSuccess => this == FavoriteStatus.success;
  bool get isFailure => this == FavoriteStatus.failure;
}
class FavoriteState extends Equatable {
  final FavoriteStatus status;
  final String? errorMessage;
  final FavoriteModel? favorites;
  final List<GetFavoriteModel>? getFavorites;
  const FavoriteState({
    this.status = FavoriteStatus.initial,
    this.errorMessage,
    this.favorites ,
    this.getFavorites = const [],
  });
  FavoriteState copyWith({
    FavoriteStatus? status,
    String? errorMessage,
    FavoriteModel? favorites,
    List<GetFavoriteModel>? getFavorites,
  }) {
    return FavoriteState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      favorites: favorites ?? this.favorites,
      getFavorites: getFavorites ?? this.getFavorites,
    );
  }



  @override
  List<Object?> get props => [status, errorMessage, favorites, getFavorites];
}


