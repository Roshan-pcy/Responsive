import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  Connectivity connection = Connectivity();
  StreamSubscription? subscription;
  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<InternetGain>((event, emit) {
      emit(ConnectivityGain());
    });
    on<InternetLost>((event, emit) => emit(ConnectivityLost()));
    subscription = connection.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGain());
      } else {
        add(InternetLost());
      }
    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    subscription?.cancel();
    return super.close();
  }
}
