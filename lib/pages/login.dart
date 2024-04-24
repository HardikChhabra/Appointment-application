import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250.0,
            decoration: BoxDecoration(
              color: Colors.white.withRed(18).withGreen(56).withBlue(95).withOpacity(1),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login to your Account",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      height: 1.3,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    "Enter Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1.5,
                    ),
                  ),
                ], //[]
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/customer_login');
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(2.5, 1.0, 2.5, 5.0),
                    child: Text(
                      "Customer",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2.0,
                      ),

                    ),
                  ),
                ),
                const SizedBox(height: 30.0,),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/company_login');
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(2.5, 1.0, 2.5, 5.0),
                    child: Text(
                      "Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],//[]
      ),

    );
  }
}
