part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class SuccessFavoriteState extends FavoriteState {
  final FavoriteUser favoriteUser;
  final String message;
  SuccessFavoriteState(this.favoriteUser,{this.message});
  @override
  String toString() {
    return 'SuccessLoadAllProfileState{favoriteUser: $favoriteUser, message: $message}';
  }
}


class LoadingFavoriteState extends FavoriteState {}

class FailureFavoriteState extends FavoriteState {
  final String errorMessage;

  FailureFavoriteState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'FailureFavoriteState{errorMessage: $errorMessage}';
  }
}
