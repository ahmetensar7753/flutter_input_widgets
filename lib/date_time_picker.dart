import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class DateTimeExample extends StatefulWidget {
  const DateTimeExample({Key? key}) : super(key: key);

  @override
  State<DateTimeExample> createState() => _DateTimeExampleState();
}

class _DateTimeExampleState extends State<DateTimeExample> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime threeMonthAgo = DateTime(now.year, now.month - 3);
    DateTime twentyDaysLater = DateTime(now.year, now.month + 1, now.day + 20);

    TimeOfDay nowTime = TimeOfDay.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Date Time Picker"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: now,
                        firstDate: threeMonthAgo,
                        lastDate: twentyDaysLater)
                    .then((selectedDate) {
                  log(selectedDate.toString());
                  log(selectedDate!.toIso8601String());
                  log(selectedDate.toString());
                  log(selectedDate.toUtc().toString());
                  log(selectedDate.toLocal().toString());
                  log(selectedDate.microsecondsSinceEpoch.toString());

                  log(formatDate(selectedDate, [dd, "-", mm, "-", yyyy]));
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Select Date"),
            ),
            ElevatedButton(
              onPressed: () {
                showTimePicker(context: context, initialTime: nowTime)
                    .then((selectedTime) {
                  log("${selectedTime!.hour} : ${selectedTime.minute}");
                });
              },
              child: const Text("Select Time"),
            ),
          ],
        ),
      ),
    );
  }
}
