import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:appointment_app/pages/new_customer_home.dart';

import 'appointments.dart';
import 'new_login.dart';

void initialiseSupabase () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://pjemotdaanarccxyerxi.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBqZW1vdGRhYW5hcmNjeHllcnhpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM1MDkyODUsImV4cCI6MjAyOTA4NTI4NX0.FIqB8jTlZPU3uP-yfBJAhJZ8W2ib_ZbEfRp5x3eDA-4",
  );
}

List<Service> serviceBuilder () {
  List<Map<String, dynamic>>response = [
    {
      'service' : "Application Development",
      'rating' : 3,
      'price' : 13500
    },
    {
      'service' : "API",
      'rating' : 4,
      'price' : 20000
    },
    {
      'service' : "Cloud Computing",
      'rating' : 3,
      'price' : 25000
    },
    {
      'service' : "Networking",
      'rating' : 3,
      'price' : 20000
    },
    {
      'service' : "Security",
      'rating' : 4,
      'price' : 20000
    },
    {
      'service' : "API",
      'rating' : 4,
      'price' : 20000
    },
    {
      'service' : "API",
      'rating' : 4,
      'price' : 20000
    }
  ];
  return (response).map((e) => Service.fromMap(e)).toList();
}

List<AvailableCompanies> companyBuilder (String serviceName) {
  List<Map<String, dynamic>> response = [
    {
      'name': "Google",
      'rating': 4,
      'price' : 250000,
      'duration': 50
    },
    {
      'name': "Google",
      'rating': 4,
      'price' : 250000,
      'duration': 50
    },
    {
      'name': "Google",
      'rating': 4,
      'price' : 250000,
      'duration': 50
    },
    {
      'name': "Google",
      'rating': 4,
      'price' : 250000,
      'duration': 50
    },
    {
      'name': "Google",
      'rating': 4,
      'price' : 250000,
      'duration': 50
    }
  ];
  return (response).map((e) => AvailableCompanies.fromMap(e)).toList();
}

List<Users> userRetrieve () {
  List<Map<String, dynamic>> response = [
    {
      'name' : "Hardik",
      'pwd' : "HelloWorld",
      'isCustomer': 1,
      'ID': '01'
    },
    {
      'name' : "Sahil",
      'pwd' : "HelloWorld",
      'isCustomer': 0,
      'ID': '02'
    },
    {
      'name' : "Harsh",
      'pwd' : "HelloWorld",
      'isCustomer': 1,
      'ID': '03'
    },
  ];
  return (response).map((e) => Users.fromMap(e)).toList();
}