part of 'home_cubit.dart';
enum HomeStaus { initial, loading, success, failure }
extension HomeStatu on HomeStaus {
  bool get isInitial => this == HomeStaus.initial;
  bool get isLoading => this == HomeStaus.loading;
  bool get isSuccess => this == HomeStaus.success;
  bool get isFailure => this == HomeStaus.failure;
}
 class HomeState extends Equatable {
HomeStaus state;
List<Breeds> breeds;
String? errorMessage;
HomeState({
  this.state = HomeStaus.initial,
  this.breeds = const [],
  this.errorMessage,
});
 HomeState copyWith({
  HomeStaus? state,
  List<Breeds>? breeds,
  String? errorMessage,
}) {
  return HomeState(
    state: state ?? this.state,
    breeds: breeds ?? this.breeds,
    errorMessage: errorMessage ?? this.errorMessage,
  );

}
  @override
  List<Object?> get props => [state, breeds, errorMessage];
  }