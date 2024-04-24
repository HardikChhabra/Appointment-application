
import 'package:appointment_app/pages/company_login.dart';
import 'package:appointment_app/pages/customer_home.dart';
import 'package:appointment_app/pages/customer_login.dart';
import 'package:appointment_app/pages/login.dart';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/':(context) => const Login(),
    '/company_login':(context) => const CompanyLogin(),
    '/customer_login':(context) => const CustomerLogin(),
    '/customer_home':(context) => const CustomerHome(),
  },
));

