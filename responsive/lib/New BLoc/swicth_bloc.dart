import 'package:bloc/bloc.dart';
import 'package:responsive/New%20BLoc/swict_event.dart';
import 'package:responsive/New%20BLoc/switch_states.dart';

class SwicthBloc extends Bloc<Switch_Events, SwitchState> {
  SwicthBloc() : super(SwitchState()) {
    on<EnableAndDISbleEvent>(mytruefunction);
    on<SliderEvent>(mysliderfunction);
  }

  void mytruefunction(EnableAndDISbleEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(value: !state.isSwicth));
  }

  void mysliderfunction(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(vluaes: event.sldier));
  }
}
