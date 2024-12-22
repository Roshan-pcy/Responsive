abstract class Switch_Events {
  Switch_Events();
  @override
  List<Object> get props => [];
}

class EnableAndDISbleEvent extends Switch_Events {}

class SliderEvent extends Switch_Events {
  double sldier;
  @override
  List<Object> get props => [sldier];
  SliderEvent({required this.sldier});
}
