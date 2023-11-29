import 'dart:developer';

import 'package:flutter/material.dart';

class OtherFormMembers extends StatefulWidget {
  const OtherFormMembers({Key? key}) : super(key: key);

  @override
  State<OtherFormMembers> createState() => _OtherFormMembersState();
}

class _OtherFormMembersState extends State<OtherFormMembers> {
  bool checkBoxState = false;
  String city = "";
  bool switchState = false;
  late Color switchColor;
  double sliderValue = 10;

  String dropDowncity = "Yalova";

  @override
  void initState() {
    super.initState();
    switchColor = Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Other Form Members"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            CheckboxListTile(
              value: checkBoxState,
              onChanged: (value) {
                setState(() {
                  checkBoxState = value!;
                });
              },
              activeColor: Colors.red,
              title: const Text("Title"),
              subtitle: const Text("SubTitle"),
              secondary: const Icon(Icons.alarm),
            ),
            RadioListTile<String>(
              value: "Ankara",
              groupValue: city,
              onChanged: (value) {
                setState(() {
                  city = value!;
                  log(city);
                });
              },
              title: const Text("Ankara"),
            ),
            RadioListTile<String>(
              value: "Yalova",
              groupValue: city,
              onChanged: (value) {
                setState(() {
                  city = value!;
                  log(city);
                });
              },
              title: const Text("Yalova"),
            ),
            RadioListTile<String>(
              value: "Bursa",
              groupValue: city,
              onChanged: (value) {
                setState(() {
                  city = value!;
                  log(city);
                });
              },
              title: const Text("Bursa"),
              subtitle: const Text("Radio Subtitle"),
              secondary: const Icon(Icons.yard_sharp),
              activeColor: Colors.red,
            ),
            SwitchListTile(
              value: switchState,
              onChanged: (value) {
                setState(() {
                  if (value) {
                    switchColor = Colors.blue;
                  } else {
                    switchColor = Colors.red;
                  }
                  switchState = value;
                  log(switchState as String);
                });
              },
              title: Text(
                "Title",
                style: TextStyle(color: switchColor),
              ),
              subtitle: const Text("Switch Subtitle"),
              tileColor: Colors.red.shade100,
              secondary:
                  const Icon(Icons.ac_unit_sharp, color: Colors.blueAccent),
            ),
            Slider(
              value: sliderValue,
              onChanged: (yeniDeger) {
                setState(() {
                  sliderValue = yeniDeger;
                });
              },
              min: 10,
              max: 20,
              divisions: 100,
              label: sliderValue.toString(),
              activeColor: Colors.orange,
              inactiveColor: Colors.red,
            ),
            DropdownButton<String>(
              items: const [
                DropdownMenuItem<String>(
                  value: "Yalova",
                  child: Row(
                    children: [
                      Icon(Icons.location_city_rounded),
                      Text("Yalova"),
                    ],
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "Rize",
                  child: Row(
                    children: [
                      Icon(Icons.forest),
                      Text("Rize"),
                    ],
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "Antalya",
                  child: Row(
                    children: [
                      Icon(Icons.waves),
                      Text("Antalya"),
                    ],
                  ),
                ),
              ],
              onChanged: (String? secilen) {
                setState(() {
                  dropDowncity = secilen!;
                });
              },
              hint: const Text("Please Select"),
              value: dropDowncity,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_box_rounded),
        onPressed: () {},
      ),
    );
  }
}
