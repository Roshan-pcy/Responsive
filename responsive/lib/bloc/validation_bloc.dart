import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'validation_event.dart';
part 'validation_state.dart';

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  ValidationBloc() : super(ValidationInitial()) {
    on<ValidationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
