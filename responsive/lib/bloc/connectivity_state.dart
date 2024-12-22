part of 'connectivity_bloc.dart';

abstract class ConnectivityState {}

class ConnectivityInitial extends ConnectivityState {}

class ConnectivityGain extends ConnectivityState {}

class ConnectivityLost extends ConnectivityState {}
