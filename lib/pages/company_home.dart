import 'package:appointment_app/neumorphism.dart';
import 'package:appointment_app/pages/service.dart';
import 'package:flutter/material.dart';

class CompanyHome extends StatefulWidget {
  const CompanyHome({super.key});

  @override
  State<CompanyHome> createState() => _CompanyHomeState();
}

class _CompanyHomeState extends State<CompanyHome> {

  Map? data = {};
  List<Appointment> availableAppointments = [];

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    data = data!.isNotEmpty ?data: ModalRoute.of(context)?.settings.arguments as Map;
    String companyID = data?['userID'];
    availableAppointments = appointmentRetrieve(companyID);

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            floating: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
            ),
            backgroundColor: Colors.white.withRed(18).withGreen(56).withBlue(95).withOpacity(1),
            expandedHeight: ((35*pageHeight)/100),
            collapsedHeight: ((10*pageHeight)/100),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Appointments',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2.0,
                  color: Colors.white,
                ),
              ),
              background: ColoredBox(
                color: Colors.white.withRed(18).withGreen(56).withBlue(95).withOpacity(1),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: availableAppointments.map<Widget>((e) {return Container(child: e.appointmentCard(
                      () => {
                        setState(
                            () {
                              availableAppointments.remove(e);
                              //add database logic to reject appointment in database
                            }
                        )
                      },
                      () => {
                        setState(
                            () {
                              availableAppointments.remove(e);
                              //add database code to accept appointment in database
                            }
                        )
                      },
                      () => {
                        setState(
                            () {
                              availableAppointments.remove(e);
                              //add database code to remove notification from database
                            }
                        )
                      },
                      pageWidth
              ),
              );}).toList(),
            ),
          ),
        ],
      ),
    );
  }
}


class Appointment {
  String service;
  String customerName;
  String customerLocation;
  bool isEnabled;
  Appointment({required this.service, required this.customerName, required this.customerLocation, required this.isEnabled});

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(service: map['service'], customerName: map['customer_name'], customerLocation: map['customer_location'], isEnabled: map['isValid']);
  }

  Widget appointmentCard(Function () rejectAppointment, Function () acceptAppointment, Function() removeDisabled, double pageWidth  ) {
    if(isEnabled) {
      return Padding(
        padding: EdgeInsets.all(pageWidth*0.02),
        child: NeumorphicCard(
          theChild: Padding(
            padding: EdgeInsets.all(pageWidth*0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(pageWidth*0.008),
                  child: Text(
                    '$service\nis requested by:',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(pageWidth*0.008),
                  child: Text(
                    '$customerName, located in\n$customerLocation',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //reject
                    IconButton(
                      onPressed: rejectAppointment,
                      icon: const Icon(Icons.cancel_outlined, color: Colors.black,),
                    ),
                    //accept
                    IconButton(
                      onPressed: acceptAppointment,
                      icon: const Icon(Icons.check_rounded, color: Colors.black,),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
    else {
      return Padding(
        padding: EdgeInsets.all(pageWidth*0.02),
        child: NeumorphicCard(
          theChild: Padding(
            padding: EdgeInsets.all(pageWidth*0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(pageWidth*0.008),
                  child: Text(
                    '$service\nwas requested by\nsomeone',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(pageWidth*0.008),
                  child: const Text(
                    'You did not accept on time',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(pageWidth*0.01),
                  child: IconButton(
                      onPressed: removeDisabled,
                      icon: const Icon(Icons.delete_forever_rounded, color: Colors.black,),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}