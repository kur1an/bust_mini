import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

class DateTimeExample extends StatefulWidget {
  const DateTimeExample({Key? key}) : super(key: key);

  @override
  State<DateTimeExample> createState() => _DateTimeExampleState();
}

class _DateTimeExampleState extends State<DateTimeExample> {
  DateTime _dateTime = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  final DateFormat _formatter = DateFormat('yyyy-MM-dd HH:mm');

  void _selectDate() {
    showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      if (value != null) {
        setState(() {
          _dateTime = value;
        });
        _selectTime();
      }
    });
  }

  void _selectTime() {
    showTimePicker(
      context: context,
      initialTime: _timeOfDay,
    ).then((value) {
      if (value != null) {
        setState(() {
          _timeOfDay = value;
          _dateTime = DateTime(
            _dateTime.year,
            _dateTime.month,
            _dateTime.day,
            _timeOfDay.hour,
            _timeOfDay.minute,
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date & Time'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50),
              Text(
                'Selected Date and Time: ${_formatter.format(_dateTime)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Custom text color
                  fontStyle: FontStyle.italic, // Custom text style
                  letterSpacing: 1.2, // Custom letter spacing
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _selectDate,
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.orange), // Custom button color
                  elevation: MaterialStateProperty.all(5), // Button elevation
                  shadowColor: MaterialStateProperty.all(Colors.black), // Shadow color
                ),
                child: const Text(
                  'Select Date and Time',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Button text color
                    letterSpacing: 1.2, // Custom letter spacing
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}