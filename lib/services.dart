import 'package:flutter/material.dart';
import 'package:beautifyme/date.dart';

class Service {
  final String name;
  final String icon;
  final String sku;

  Service({required this.name, required this.icon, required this.sku});
}

final List<Service> services = [
  Service(name: 'Манікюр', icon: '🖐️', sku: 'MAN001'),
  Service(name: 'Педікюр', icon: '🦶', sku: 'PED001'),
  Service(name: 'Зачіска', icon: '💇‍♂️', sku: 'HAIR001'),
  Service(name: 'Нарощування вій', icon: '👁️', sku: 'EYE001'),
  Service(name: 'Перманентний макіяж', icon: '💄', sku: 'MAKEUP001'),
];

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.75,
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Card(
            elevation: 3,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DateTimeSelectionScreen(
                      service: service,
                    ),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    service.icon,
                    style: TextStyle(fontSize: 40),
                  ),
                  SizedBox(height: 10),
                  Text(
                    service.name,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
