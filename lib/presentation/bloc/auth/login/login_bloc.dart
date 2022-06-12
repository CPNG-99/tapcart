import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapcart/domain/entities/Auth/auth.dart';
import 'package:tapcart/domain/usecases/auth/login.dart';

part 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login _login;

  LoginBloc(this._login) : super(LoginEmpty()) {
    on<OnLogin>((event, emit) async {
      final payload = event.payload;

      emit(LoginLoading());
      final result = await _login.execute(payload);

      result.fold((failure) {
        emit(LoginError(failure.message));
      }, (data) {
        emit(HasLoginData(data));
      });
    });
  }
}
