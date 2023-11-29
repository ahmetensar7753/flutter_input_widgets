import 'dart:developer';

import 'package:flutter/material.dart';

class GlobalKeyUsage extends StatelessWidget {
  GlobalKeyUsage({Key? key}) : super(key: key);

  final counterWidgetKey = GlobalKey<_SayacWidgetState>();

  @override
  Widget build(BuildContext context) {
    log("1");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Global Key Usage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Button Pressed:"),
            SayacWidget(
              key: counterWidgetKey,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          counterWidgetKey.currentState!._arttir();
        },
      ),
    );
  }
}

class SayacWidget extends StatefulWidget {
  const SayacWidget({Key? key}) : super(key: key);

  @override
  State<SayacWidget> createState() => _SayacWidgetState();
}

class _SayacWidgetState extends State<SayacWidget> {
  int _sayac = 0;
  void _arttir() {
    setState(() {
      _sayac++;
    });
  }

  @override
  Widget build(BuildContext context) {
    log("2");
    return Text(
      _sayac.toString(),
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}
