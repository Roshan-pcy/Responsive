import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/bloc/validation_bloc/bloc/myvalidation_bloc.dart';
import 'package:responsive/bloc/validation_bloc/bloc/myvalidation_event.dart';
import 'package:responsive/bloc/validation_bloc/bloc/myvalidation_state.dart';

class Validation extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  Validation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          BlocBuilder<SingInBloc, SignInState>(
            builder: (context, state) {
              if (state is SignErrorState) {
                return Text(state.errorMessage);
              } else {
                return Container();
              }
            },
          ),
          TextFormField(
            onChanged: (value) {
              BlocProvider.of<SingInBloc>(context)
                  .add(SignInTextChange(email.text, password.text));
            },
            controller: email,
            decoration: InputDecoration(hintText: 'Email'),
          ),
          TextFormField(
            onChanged: (value) {
              BlocProvider.of<SingInBloc>(context)
                  .add(SignInTextChange(email.text, password.text));
            },
            controller: password,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          BlocBuilder<SingInBloc, SignInState>(
            builder: (context, state) {
              if (state is SignLoadingState) {
                return Center(child: CircularProgressIndicator());
              }

              return Container(
                  color: state is SignValidState ? Colors.green : Colors.white,
                  child: ElevatedButton(
                      onPressed: () {
                        if (state is SignValidState) {
                          BlocProvider.of<SingInBloc>(context)
                              .add(Submited(email.text, password.text));
                        }
                      },
                      child: Text('sing in')));
            },
          )
        ],
      ),
    );
  }
}
