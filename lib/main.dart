import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:beautifyme/services.dart';
import 'package:beautifyme/history.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => History(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final history = Provider.of<History>(context, listen: false);

    return MaterialApp(
      title: 'BEAUTIFYME',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF59401A),
          secondary: const Color(0xFF9F897C),
          background: const Color(0xFFD6CDBE),
        ),
      ),
      home: const MyHomePage(title: 'BEAUTIFYME'),
      routes: {
        '/history': (context) => HistoryTable(bookings: history.bookings),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final history = Provider.of<History>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ServicesScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
