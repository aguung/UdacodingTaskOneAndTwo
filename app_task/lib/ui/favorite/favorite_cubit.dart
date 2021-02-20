import 'package:app_task/model/favorite_user.dart';
import 'package:app_task/repository/favorite_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository repository;

  FavoriteCubit({this.repository}) : super(FavoriteInitial());

  void getFavorite() async {
    emit(LoadingFavoriteState());
    var result = await repository.getFavorite();
    result.fold(
      (errorMessage) => emit(FailureFavoriteState(errorMessage)),
      (favoriteUser) => emit(SuccessFavoriteState(favoriteUser)),
    );
  }

  void addFavorite(String videoId, String videoName, String videoUrl,
      String videoThumbnail) async {
    emit(LoadingFavoriteState());
    var result = await repository.addFavorite(
        videoId, videoName, videoUrl, videoThumbnail);
    result.fold(
      (errorMessage) => emit(FailureFavoriteState(errorMessage)),
      (favoriteUser) => emit(SuccessFavoriteState(favoriteUser)),
    );
  }

  void deleteFavorite(String favoriteId) async {
    emit(LoadingFavoriteState());
    var result = await repository.deleteFavorite(favoriteId);
    var resultFold = result.fold(
      (errorMessage) => errorMessage,
      (favoriteUser) => favoriteUser,
    );
    if (resultFold is String) {
      emit(FailureFavoriteState(resultFold));
      return;
    }
    var resultDelete = await repository.getFavorite();
    resultDelete.fold(
      (errorMessage) => emit(FailureFavoriteState(errorMessage)),
      (favoriteUser) => emit(
        SuccessFavoriteState(
          favoriteUser,
          message: 'Favorite data deleted successfully',
        ),
      ),
    );
  }
}
