abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignValidState extends SignInState {}

class SignErrorState extends SignInState {
  final String errorMessage;
  SignErrorState(this.errorMessage);
}

class SignLoadingState extends SignInState {}
