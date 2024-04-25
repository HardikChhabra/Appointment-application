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
      appBar: AppBar(
        toolbarHeight: 250.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white.withRed(18).withGreen(56).withBlue(95).withOpacity(1),
        flexibleSpace: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter Credentials",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 2.0,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(2.0, 150.0, 2.0, 0.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                decoration: const InputDecoration(
                    labelText: "Input ID:",
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.0,
                    )
                ),
                controller: name,
              ),
            ),
            const SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: "Input Password:",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2.0,
                  ),
                ),
                controller: pwd,
              ),
            ),
            const SizedBox(height: 120.0,),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/company_home', arguments: {'company_name': name});
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 18.0),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            )
          ],//[]
        ),
      ),
    );
  }
}
