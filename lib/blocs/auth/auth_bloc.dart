import 'package:bloc/bloc.dart';
import 'package:bwa/models/signin_form_model.dart';
import 'package:bwa/models/signup_form_model.dart';
import 'package:bwa/models/user_model.dart';
import 'package:bwa/services/auth_services.dart';

import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmail) {
        try {
          emit(AuthLoading());
          final res = await AuthServices().checkEmail(event.email);
          if (res == false) {
            emit(AuthCheckEmailSuccess());
          } else {
            emit(const AuthFailed('Email sudah terdaftar'));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
      if (event is AuthRegister) {
        try {
          emit(AuthLoading());
          final user = await AuthServices().register(event.data);
          emit(AuthSuccess(user));
        } catch (e) {
          // debugPrint(event.data.toString());
          emit(AuthFailed(e.toString()));
        }
      }
      if (event is AuthLogin) {
        try {
          emit(AuthLoading());
          final user = await AuthServices().login(event.data);
          emit(AuthSuccess(user));
        } catch (e) {
          // debugPrint(event.data.toString());
          emit(AuthFailed(e.toString()));
        }
      }
      if (event is AuthGetCurrentUser) {
        try {
          emit(AuthLoading());

          final SignInFormModel data =
              await AuthServices().getCredentialFromLocal();

          final UserModel user = await AuthServices().login(data);

          emit(AuthSuccess(user));
        } catch (e) {
          // debugPrint(event.data.toString());
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
