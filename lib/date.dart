import 'package:flutter/material.dart';
import 'package:beautifyme/services.dart';
import 'package:beautifyme/confirm.dart';
import 'package:intl/intl.dart';

class DateTimeSelectionScreen extends StatefulWidget {
  final Service service;

  const DateTimeSelectionScreen({required this.service});

  @override
  _DateTimeSelectionScreenState createState() =>
      _DateTimeSelectionScreenState();
}

class _DateTimeSelectionScreenState extends State<DateTimeSelectionScreen> {
  DateTime? selectedDateTime;

  bool isDateTimeSelected() {
    return selectedDateTime != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Date and Time'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text(
                'Service: ${widget.service.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDateTime ?? DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(DateTime.now().year + 1),
                    );
                    if (picked != null && picked != selectedDateTime) {
                      setState(() {
                        selectedDateTime = picked;
                      });
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: Text('Select Date', style: TextStyle(fontSize: 18)),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: selectedDateTime != null
                          ? TimeOfDay.fromDateTime(selectedDateTime!)
                          : TimeOfDay.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        selectedDateTime = DateTime(
                          selectedDateTime!.year,
                          selectedDateTime!.month,
                          selectedDateTime!.day,
                          picked.hour,
                          picked.minute,
                        );
                      });
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: Text('Select Time', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            if (selectedDateTime != null)
              Text(
                'Selected Date: ${DateFormat('dd/MM/yyyy HH:mm').format(selectedDateTime!)}',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: isDateTimeSelected()
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmationScreen(
                      service: widget.service,
                      dateTime: selectedDateTime!,
                    ),
                  ),
                );
              }
            : () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Date and time not selected!'),
                  ),
                );
              },
        label: Text('Next'),
        icon: Icon(Icons.arrow_forward),
      ),
    );
  }
}
