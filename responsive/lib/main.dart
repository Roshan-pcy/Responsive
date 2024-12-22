import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/New%20BLoc/swicth_bloc.dart';
import 'package:responsive/Ui/FirebaseClass.dart';
import 'package:responsive/Ui/Validation.dart';
import 'package:responsive/bloc/connectivity_bloc.dart';
import 'package:responsive/bloc/validation_bloc/bloc/myvalidation_bloc.dart';
import 'package:responsive/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SingInBloc(),
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: MyFriends()));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  democlass demoClass =
      democlass(name: 'Roshan', age: 24, gmail: 'roshanpc@gmail.com');
  String jsonData = '{"name":"roshan","age":20,"gmail":"roshanpc@gmail.com"}';

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width / 10;

    print(padding);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> mapdata = demoClass.toMap();
                  var json = jsonEncode(mapdata);
                  print(json);
                },
                child: Text('Serializagtion')),
            ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> decoded = jsonDecode(jsonData);
                  print(decoded);
                  democlass demo = democlass.fromMap(decoded);
                  print(demo.age);
                },
                child: Text('De Serializagtion')),
            BlocBuilder<ConnectivityBloc, ConnectivityState>(
              builder: (context, state) {
                if (state is ConnectivityGain) {
                  return Text('connected!');
                } else if (state is ConnectivityLost) {
                  return Text('Lost');
                } else {
                  return Text('loading...');
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class democlass {
  late String name;
  late int age;
  late String gmail;
  democlass({required this.name, required this.age, required this.gmail});
  //map to object
  democlass.fromMap(Map<String, dynamic> map) {
    this.name = map['name'];
    this.age = map['age'];
    this.gmail = map['gmail'];
  }
  Map<String, dynamic> toMap() {
    return {'name': this.name, 'aged': this.age, 'gmail': this.gmail};
  }
}
