import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SwitchState extends Equatable {
  bool isSwicth;
  double values;

  SwitchState({this.isSwicth = false, this.values = 0});
  @override
  List<Object?> get props => [isSwicth, values];
  SwitchState copyWith({bool? value, double? vluaes}) {
    return SwitchState(isSwicth: value ?? false, values: vluaes ?? 0);
  }
}
