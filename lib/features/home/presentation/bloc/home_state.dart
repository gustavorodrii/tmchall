abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final String email;
  final String name;
  final List<Map<String, dynamic>> cards;
  final List<String> drawerItems;

  HomeLoaded({
    required this.email,
    required this.name,
    required this.cards,
    required this.drawerItems,
  });
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}

class HomeLoggedOut extends HomeState {}
