import 'package:flutter/material.dart';

class CompanyHome extends StatefulWidget {
  const CompanyHome({super.key});

  @override
  State<CompanyHome> createState() => _CompanyHomeState();
}

class _CompanyHomeState extends State<CompanyHome> {

  Map? data = {};
  @override
  Widget build(BuildContext context) {
    data = data!.isNotEmpty ?data: ModalRoute.of(context)?.settings.arguments as Map;
    String companyName = data?['company_name'];
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(),

              ],//[]
            ),
            SizedBox(height: 120,),
          ],//[]
        ),
      ),
    );
  }
}


class Appointment {
  String? service;
  String? customerName;
  String? customerLocation;
}