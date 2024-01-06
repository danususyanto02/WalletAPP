import 'package:bloc/bloc.dart';
import 'package:bwa/models/signin_form_model.dart';
import 'package:bwa/models/signup_form_model.dart';
import 'package:bwa/models/user_edit_form_model.dart';
import 'package:bwa/models/user_model.dart';
import 'package:bwa/services/auth_services.dart';
import 'package:bwa/services/user_services.dart';
import 'package:bwa/services/wallet_services.dart';

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
      if (event is AuthUpdateUser) {
        try {
          if (state is AuthSuccess) {
            final updatedUser = (state as AuthSuccess).user.copyWith(
                  name: event.data.name,
                  username: event.data.username,
                  email: event.data.email,
                  password: event.data.password,
                );
            print(event.data.toJson());
            emit(AuthLoading());
            await UserServices().updateUser(event.data);
            emit(AuthSuccess(updatedUser));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
      if (event is AuthUpdatePin) {
        try {
          if (state is AuthSuccess) {
            final updatedUser = (state as AuthSuccess).user.copyWith(
                  pin: event.newPin,
                );
            // print(event.data.toJson());
            emit(AuthLoading());
            await WalletServices().updatePin(event.oldPin, event.newPin);

            emit(AuthSuccess(updatedUser));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
      if (event is AuthLogout) {
        try {
          emit(AuthLoading());
          await AuthServices().logout();

          emit(AuthInitial());
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
