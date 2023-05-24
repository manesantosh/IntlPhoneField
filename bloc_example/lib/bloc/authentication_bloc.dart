import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    
    const String emailIdRegExp =
        r"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
    const String passwordRegExp =
        "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z])(?=.*[@#\$%^&+=])(?=\\S+\$).{6,}\$";
    
    on<LoginEvent>((event, emit) async {
      if(event.email.isEmpty && event.password.isEmpty){
        emit(ErrorState('Email and Password are required'));
      } else if(event.email.isEmpty) {
        emit(ErrorState('Email is required'));
      } else if(event.password.isEmpty) {
        emit(ErrorState('Password is required'));
      } else if (!event.email.contains(RegExp(emailIdRegExp))){
        emit(ErrorState('Invalid email'));
      } else if (!event.password.contains(RegExp(passwordRegExp))) {
        emit(ErrorState('Invalid password'));
      } else {
        emit(LoadingState());
        await Future.delayed(const Duration(seconds: 3));
        emit(SuccessState('Login Successfully'));
      }
    });
  }
}
