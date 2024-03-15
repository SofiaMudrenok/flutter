import 'package:flutter/material.dart';
import 'package:beautifyme/services.dart';
import 'package:provider/provider.dart';

class History extends ChangeNotifier {
  List<Booking> _bookings = [];

  List<Booking> get bookings => _bookings;

  void addBooking(Service service, DateTime dateTime) {
    _bookings.add(Booking(service: service, dateTime: dateTime));
    notifyListeners();
  }
}

class Booking {
  final Service service;
  final DateTime dateTime;

  Booking({required this.service, required this.dateTime});
}

class HistoryTable extends StatelessWidget {
  final List<Booking> bookings;

  const HistoryTable({Key? key, required this.bookings}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final history = Provider.of<History>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('History'),
        ),
        body: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('Service')),
            DataColumn(label: Text('Date Time')),
          ],
          rows: history.bookings
              .map(
                (booking) => DataRow(
                  cells: [
                    DataCell(Text(booking.service.name)),
                    DataCell(Text(booking.dateTime.toString())),
                  ],
                ),
              )
              .toList(),
        ));
  }
}
