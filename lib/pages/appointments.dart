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
    return const Placeholder();
  }
}


class AvailableCompanies {
  String companyName;
  int rating;
  int price;
  int duration;

  AvailableCompanies({required this.companyName, required this.rating, required this.price, required this.duration });

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