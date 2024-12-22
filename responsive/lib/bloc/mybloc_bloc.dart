import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mybloc_event.dart';
part 'mybloc_state.dart';

class MyblocBloc extends Bloc<MyblocEvent, MyblocState> {
  MyblocBloc() : super(MyblocInitial()) {
    on<MyblocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
