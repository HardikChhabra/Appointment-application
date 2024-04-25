import 'package:appointment_app/pages/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:slidable_button/slidable_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final name = TextEditingController();
  final pwd = TextEditingController();
  @override
  void dispose() {
    name.dispose();
    pwd.dispose();
    super.dispose();
  }

  String user = 'Company';
  @override
  void initState() {
    super.initState();
    user = 'Company';
  }

  void openAnimatedDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (context, a1, a2, widget) {
        return  AlertDialog(
          title: const Text(
            'Access Denied',
          ),
          content: const Text(
            'Please check credentials again'
          ),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    List<Users> users = userRetrieve();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: ((35*pageHeight)/100),
              width: pageWidth,
              decoration: BoxDecoration(
                color: Colors.white.withRed(18).withGreen(56).withBlue(95).withOpacity(1),
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15),topLeft: Radius.zero,topRight: Radius.zero),
              ),
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(0.015*pageHeight),
                child: const Text(
                  "Login To Your\nAccount",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2.0,
                    color: Colors.white,
                    decoration: null,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTapDown: (details) {
                setState(() {
                  user = details.localPosition.dx < 135 ? 'Company' : 'Customer';
                });
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, pageHeight*0.05, 0.0, pageHeight*0.03),
                child: HorizontalSlidableButton(
                  height: (pageWidth/1.5)/5,
                  width: pageWidth/1.5,
                  buttonWidth: pageWidth/3,
                  color: Colors.white.withRed(18).withGreen(56).withBlue(95).withOpacity(1),
                  buttonColor: Colors.white,
                  dismissible: false,
                  label: Center(
                    child: UserLabel(user: user,),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.0,horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Company',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        Text(
                          'Customer',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w400
                            ),
                        ),
                      ],
                    ),
                  ),
                  onChanged: (position) {
                    setState(() {
                      user = position == SlidableButtonPosition.end ? 'Customer' : 'Company';
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: pageHeight*0.025, horizontal: pageWidth*0.1),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(pageWidth*0.018),
                    child: TextField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 3,
                            ),
                          ),
                          labelText: "Email/Phone Number",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2.0,
                          )
                      ),
                      controller: name,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(pageWidth*0.018),
                    child: TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                width: 3,
                              ),
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2.0,
                          )
                      ),
                      controller: pwd,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(pageHeight*0.05),
              child: ElevatedButton(
                onPressed: () {
                  bool data = user == "Customer"? true:false;
                  Users currentUser = Users(userName: name.text, pwd: pwd.text, isCustomer: data);
                  if(currentUser.checkUser(users)){
                    Navigator.pushNamed(context, '/$user');
                  }
                  else {
                    openAnimatedDialog(context);
                  }
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith<double?>((Set<MaterialState> states) => 50.0),
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) => Colors.white.withRed(18).withGreen(56).withBlue(95).withOpacity(1))
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: pageHeight*0.01, horizontal: pageWidth*0.05),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserLabel extends StatelessWidget {
  final String user;
  const UserLabel({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Text(
      user,
      style: TextStyle(
          color: Colors.white.withRed(18).withGreen(56).withBlue(95).withOpacity(1),
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 2.0
      ),
    );
  }
}

class Users {
  String userName;
  String pwd;
  bool isCustomer;

  Users({required this.userName, required this.pwd, required this.isCustomer});

  factory Users.fromMap(Map<String, dynamic> map) {
    bool data = map['isCustomer'] == 1? true: false;
    return Users(userName: map['name'] as String, pwd: map['pwd'] as String, isCustomer: data);
  }

  bool checkUser(List<Users> users) {
    for(Users user in users) {
      if(user.userName == userName && user.pwd == pwd && user.isCustomer == isCustomer) {
        return true;
      }
      else{
        continue;
      }
    }
    return false;
  }
}