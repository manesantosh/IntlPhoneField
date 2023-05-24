abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class LoadingState extends AuthenticationState {}

class ErrorState extends AuthenticationState {
  final String error;
  ErrorState(this.error);
}

class SuccessState extends AuthenticationState {
  final String message;
  SuccessState(this.message);
}

