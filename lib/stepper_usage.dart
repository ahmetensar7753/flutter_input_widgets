import 'dart:developer';

import 'package:flutter/material.dart';

class StepperExample extends StatefulWidget {
  const StepperExample({Key? key}) : super(key: key);

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _activeStep = 0;
  String name = "";
  String mail = "";
  String pass = "";
  late List<Step> allSteps;
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();
  bool error = false;

  @override
  Widget build(BuildContext context) {
    allSteps = _allSteps();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stepper Example"),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          controlsBuilder: (context, details) {
            return Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent.shade700),
                  onPressed: details.onStepContinue,
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade700),
                  onPressed: details.onStepCancel,
                  child: const Text(
                    "Back",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            );
          },
          steps: allSteps,
          currentStep: _activeStep,
          onStepContinue: () {
            setState(() {
              forwardButtonControl();
            });
          },
          onStepCancel: () {
            setState(() {
              if (_activeStep > 0) {
                _activeStep--;
              }
            });
          },
        ),
      ),
    );
  }

  List<Step> _allSteps() {
    List<Step> stepler = [
      Step(
        title: const Text("Enter username"),
        subtitle: const Text("subTitle"),
        state: setStates(0),
        isActive: true,
        content: TextFormField(
          key: key0,
          decoration: InputDecoration(
            labelText: "Username",
            hintText: "Username",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 6) {
              return "Enter at least 6 char";
            }
            return null;
          },
          onSaved: (value) {
            name = value!;
          },
        ),
      ),
      Step(
        title: const Text("Enter e-mail"),
        subtitle: const Text("subTitle"),
        state: setStates(1),
        isActive: true,
        content: TextFormField(
          key: key1,
          decoration: InputDecoration(
            labelText: "E-mail",
            hintText: "E-mail",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (value) {
            if (value!.length < 6 || !value.contains("@")) {
              return "Enter a valid e-mail address";
            }
            return null;
          },
          onSaved: (value) {
            mail = value!;
          },
        ),
      ),
      Step(
        title: const Text("Enter password"),
        subtitle: const Text("subTitle"),
        state: setStates(2),
        isActive: true,
        content: TextFormField(
          key: key2,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (value) {
            if (value!.length < 6) {
              return "Enter at least 6 char";
            }
            return null;
          },
          onSaved: (value) {
            pass = value!;
          },
        ),
      ),
    ];

    return stepler;
  }

  StepState setStates(int oankiStep) {
    if (_activeStep == oankiStep) {
      if (error) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else {
      return StepState.complete;
    }
  }

  void forwardButtonControl() {
    switch (_activeStep) {
      case 0:
        if (key0.currentState!.validate()) {
          key0.currentState!.save();
          error = false;
          _activeStep = 1;
        } else {
          error = true;
        }
        break;
      case 1:
        if (key1.currentState!.validate()) {
          key1.currentState!.save();
          error = false;
          _activeStep = 2;
        } else {
          error = true;
        }
        break;
      case 2:
        if (key2.currentState!.validate()) {
          key2.currentState!.save();
          error = false;
          //_activeStep = 2;
          formCompleted();
        } else {
          error = true;
        }
        break;
    }
  }

  void formCompleted() {
    log("Entered values : name => $name - mail => $mail - pass => $pass");
  }
}
