import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/bloc/validation_bloc/bloc/myvalidation_event.dart';
import 'package:responsive/bloc/validation_bloc/bloc/myvalidation_state.dart';

class SingInBloc extends Bloc<singInEvent, SignInState> {
  SingInBloc() : super(SignInInitialState()) {
    on<SignInTextChange>((event, emit) {
      if (event.email == '' && EmailValidator.validate(event.email) == false) {
        emit(SignErrorState('plase Enter Email adresss'));
      } else if (event.password.length <= 8) {
        emit(SignErrorState('Please Enter Valid password'));
      } else {
        emit(SignValidState());
      }
    });
    on<Submited>((event, emit) {
      emit(SignLoadingState());
    });
  }
}
