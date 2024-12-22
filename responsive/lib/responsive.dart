import 'package:flutter/material.dart';

class Responsive extends StatefulWidget {
  const Responsive({super.key});

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.sizeOf(context).height;
    double widthh = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(child: Text('width:$widthh  height:$hight')),
    );
  }
}
