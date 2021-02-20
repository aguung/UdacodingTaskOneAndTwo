import 'package:app_task/model/favorite_user.dart';
import 'package:app_task/repository/favorite_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'grafik_state.dart';

class GrafikCubit extends Cubit<GrafikState> {
  final FavoriteRepository repository;
  GrafikCubit({this.repository}) : super(GrafikInitial());

  void getGrafik() async {
    emit(LoadingGrafikState());
    var result = await repository.getGrafik();
    result.fold(
          (errorMessage) => emit(FailureGrafikState(errorMessage)),
          (favoriteUser) => emit(SuccessGrafikState(favoriteUser)),
    );
  }
}
