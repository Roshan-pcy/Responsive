import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/New%20BLoc/swict_event.dart';
import 'package:responsive/New%20BLoc/swicth_bloc.dart';
import 'package:responsive/New%20BLoc/switch_states.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<SwicthBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                  value: state.isSwicth,
                  onChanged: (value) {
                    context.read<SwicthBloc>().add(EnableAndDISbleEvent());
                  },
                );
              },
            ),
            BlocBuilder<SwicthBloc, SwitchState>(
              builder: (context, state) {
                return Container(
                  height: 300,
                  width: 400,
                  color: Colors.red.withOpacity(state.values),
                );
              },
            ),
            BlocBuilder<SwicthBloc, SwitchState>(
              builder: (context, state) {
                return Slider(
                  value: state.values,
                  onChanged: (value) {
                    context.read<SwicthBloc>().add(SliderEvent(sldier: value));
                  },
                );
              },
            ),
            Text(
              '0',
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Increas')),
            ElevatedButton(onPressed: () {}, child: Text('decrease')),
          ],
        ),
      ),
    );
  }
}
