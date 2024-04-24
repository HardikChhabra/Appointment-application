import 'package:flutter/material.dart';

class CompanyLogin extends StatefulWidget {
  const CompanyLogin({super.key});

  @override
  State<CompanyLogin> createState() => _CompanyLoginState();
}

class _CompanyLoginState extends State<CompanyLogin> {

  final name = TextEditingController();
  final pwd = TextEditingController();
  @override
  void dispose() {
    name.dispose();
    pwd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Enter login details:"),
          const SizedBox(height: 30.0,),
          TextField(
            controller: name,
          ),
          const SizedBox(height: 20.0,),
          TextField(
            controller: pwd,
          ),
          const SizedBox(height: 40.0,),
          TextButton(
            onPressed: () {},
            child: const Text("Login"),
          )
        ],//[]
      ),
    );
  }
}
