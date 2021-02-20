part of 'grafik_cubit.dart';

abstract class GrafikState extends Equatable {
  const GrafikState();
  @override
  List<Object> get props => [];
}

class GrafikInitial extends GrafikState {}

class SuccessGrafikState extends GrafikState {
  final FavoriteUser favoriteUser;
  SuccessGrafikState(this.favoriteUser);
  @override
  List<Object> get props => [favoriteUser];
}

class LoadingGrafikState extends GrafikState {}

class FailureGrafikState extends GrafikState {
  final String errorMessage;

  FailureGrafikState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'FailureGrafikState{errorMessage: $errorMessage}';
  }
}