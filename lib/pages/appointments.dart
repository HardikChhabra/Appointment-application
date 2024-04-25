import 'package:appointment_app/pages/service.dart';
import 'package:flutter/material.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {

  Map? data ={};
  @override
  Widget build(BuildContext context) {
    data = data!.isNotEmpty ?data: ModalRoute.of(context)?.settings.arguments as Map;
    String serviceInUse = data?['serviceName'];
    List<AvailableCompanies> companies = companyBuilder(serviceInUse);
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
                  children: companies.map<Widget>((e) {return Container(child: e.companyCard(),);}).toList(),
                ),
              ),
            )
          ],//[]
        ),
      ),
    );
  }
}


class AvailableCompanies {
  String companyName;
  int rating;
  int price;
  int duration;

  AvailableCompanies({required this.companyName, required this.rating, required this.price, required this.duration });

  factory AvailableCompanies.fromMap(Map<String, dynamic> map) {
    return AvailableCompanies(companyName: map['name'] as String, rating: map['rating'], price: map['price'], duration: map['duration']);
  }

  Widget companyCard () {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                companyName,
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
                    rating.toString(),
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    price.toString(),
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    duration.toString(),
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