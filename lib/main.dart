import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_inputs/stepper_usage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Input Operations',
      home: StepperExample(),
    );
  }
}

class TextFieldUsage extends StatefulWidget {
  final String title;
  const TextFieldUsage({Key? key, required this.title}) : super(key: key);

  @override
  State<TextFieldUsage> createState() => _TextFieldUsageState();
}

class _TextFieldUsageState extends State<TextFieldUsage> {
  late TextEditingController _emailController;
  late FocusNode _focusNode;
  int maxLineCount = 1;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "ensarbesir@gmail.com");
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          maxLineCount = 5;
        } else {
          maxLineCount = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              focusNode: _focusNode,
              controller: _emailController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              autofocus: false,
              maxLines: maxLineCount,
              maxLength: 30,
              onChanged: (String value) {
                setState(() {
                  _emailController.value = TextEditingValue(
                    text: value,
                    selection: TextSelection.collapsed(offset: value.length),
                  ); // metinde her değişiklikte bu kısım çalışıyor.
                });
              },
              onSubmitted: (String value) {
                log("$value************************"); // text yazılıp onaylandıktan sonra çalışıyor.
              },
              cursorColor: Colors.red,
              decoration: InputDecoration(
                labelText: "Label Text",
                hintText: "Enter e-mail",
                //icon: Icon(Icons.add), textfield'ın sol tarafında dışarıda icon oluşturuyor.
                prefixIcon: const Icon(Icons.access_alarms_outlined),
                suffixIcon: const Icon(Icons.accessibility_rounded),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                filled: true,
                fillColor: Colors.orange.shade100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_emailController.text),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _emailController.text = "ahmetensar@hotmail.com";
          });
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
