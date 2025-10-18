// ignore_for_file: public_member_api_docs, sort_constructors_first
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
List<Breeds>? searchBreeds;
String? errorMessage;
final String searchQuery;
  HomeState({
    this.state = HomeStaus.initial,
    this.breeds = const [],
    this.searchBreeds,
    this.errorMessage,
   this.searchQuery ='',
  });
 HomeState copyWith({
  HomeStaus? state,
  List<Breeds>? breeds,
  String? errorMessage,
  List<Breeds>? searchBreeds,
   String? searchQuery,

}) {
  return HomeState(
    state: state ?? this.state,
    breeds: breeds ?? this.breeds,
    errorMessage: errorMessage ?? this.errorMessage,
    searchBreeds: searchBreeds ?? this.searchBreeds,
    searchQuery: searchQuery ?? this.searchQuery,
  );

}
  bool get isSearching => searchQuery.isNotEmpty;
  
  bool get hasSearchResults => 
      searchBreeds != null && searchBreeds!.isNotEmpty;
  @override
  List<Object?> get props => [state, breeds, errorMessage];
  }
