import 'package:appointment_app/pages/appointments.dart';
import 'package:appointment_app/pages/company_home.dart';
import 'package:appointment_app/pages/customer_home.dart';
import 'package:appointment_app/pages/new_login.dart';

import 'package:flutter/material.dart';

void main() async {
  runApp(MaterialApp(
    routes: {
      '/':(context) => const Login(),
      '/Company':(context) => const CompanyHome(),
      '/Customer':(context) => const CustomerHome(),
      '/add_appointments':(context) => const Appointments(),
    },
  ));
}