import 'package:appointment_app/pages/service.dart';
import 'package:flutter/material.dart';

class CustomerHome extends StatefulWidget {
  const CustomerHome({super.key});

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {

  @override
  Widget build(BuildContext context) {
    List<Service> services = serviceBuilder();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                  ),
                )
              ],//[]
            ),
            const SizedBox(height: 120,),
            SizedBox(
              height: 700,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: services.map<Widget>((e) {return Container(child: e.serviceCard(context),);}).toList(),
                ),
              ),
            )
          ],//[]
        ),
      ),
    );
  }
}


class Service {
  String serviceName;
  int avgRating;
  int avgPrice;

  Service({required this.serviceName, required this.avgRating, required this.avgPrice});

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(serviceName: map['service'] as String, avgRating: map['rating'], avgPrice: map['price']);
  }

  Widget serviceCard (context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/add_appointments", arguments: {'serviceName' : serviceName});
      },
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                serviceName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 2.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    avgRating.toString(),
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    avgPrice.toString(),
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              )
            ],//[]
          ),
        ),
      ),
    );
  }
}