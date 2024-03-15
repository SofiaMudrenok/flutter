import 'package:flutter/material.dart';
import 'package:beautifyme/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:beautifyme/history.dart';

class ConfirmationScreen extends StatelessWidget {
  final Service service;
  final DateTime dateTime;

  ConfirmationScreen({required this.service, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Selected Service: ${service.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            Text('Selected Date and Time: $dateTime',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CupertinoButton(
            onPressed: () {
              var history = History();
              history.addBooking(service, dateTime);
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 8),
                  Text(
                    ' Apple Pay',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                var history = History();
                history.addBooking(service, dateTime);
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: Text('AfterPay'),
              )),
        ],
      ),
    );
  }
}
