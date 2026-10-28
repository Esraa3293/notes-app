sealed class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {}

class HomeDataLoadedState extends HomeStates {
  final List<String> notes;

  HomeDataLoadedState({required this.notes});
}

class HomeErrorState extends HomeStates {
  final String message;

  HomeErrorState({required this.message});
}
