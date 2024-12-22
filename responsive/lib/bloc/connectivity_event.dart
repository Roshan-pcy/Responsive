part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent {}

class InternetLost extends ConnectivityEvent {}

class InternetGain extends ConnectivityEvent {}
