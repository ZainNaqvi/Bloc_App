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
  late final Cubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                "Hi",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
