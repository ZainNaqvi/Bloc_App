import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'dart:math' as math show Random;

void main() {
  runApp(MaterialApp(home: HelloWorld()));
}

List list = [
  "Hi",
  "Hello",
  "Bellow",
  "Yellow",
];

extension RandamElement<T> on Iterable<T> {
  T getRandamElement() => elementAt(math.Random().nextInt(length));
}

class NamesCubits extends Cubit<String?> {
  NamesCubits() : super(null);
  void pickRandomNumber() => emit(list.getRandamElement());
}

class HelloWorld extends StatefulWidget {
  const HelloWorld({super.key});

  @override
  State<HelloWorld> createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  late final NamesCubits cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = NamesCubits();
  }

  @override
  void dispose() {
    cubit.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<String?>(
        stream: cubit.stream,
        builder: (context, snapshot) {
          final button = Center(
            child: TextButton(
              onPressed: () => cubit.pickRandomNumber(),
              child: Text("Pick randam name"),
            ),
          );
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return button;
            case ConnectionState.waiting:
              return button;
            case ConnectionState.active:
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data ?? ''),
                    button,
                  ],
                ),
              );
            case ConnectionState.done:
              return SizedBox();
          }
        },
      ),
    );
  }
}
