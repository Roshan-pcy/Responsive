abstract class singInEvent {}

class SignInTextChange extends singInEvent {
  final String email;
  final String password;
  SignInTextChange(this.email, this.password);
}

class Submited extends singInEvent {
  final String email;
  final String password;
  Submited(this.email, this.password);
}
