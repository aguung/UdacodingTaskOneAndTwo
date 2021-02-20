import 'package:app_task/model/auth_user.dart';
import 'package:app_task/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository repository;
  RegisterCubit({this.repository}) : super(RegisterInitial());

  void register(String email, String name,String password) async {
    emit(LoadingRegisterState());
    var result = await repository.register(email, name, password);
    result.fold(
          (errorMessage) => emit(FailureRegisterState(errorMessage)),
          (user) => emit(SuccessRegisterState(user)),
    );
  }
}
