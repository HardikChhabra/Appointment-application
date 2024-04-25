import 'package:appointment_app/neumorphism.dart';
import 'package:appointment_app/pages/service.dart';
import 'package:flutter/material.dart';

class NewCustomer extends StatefulWidget {
  const NewCustomer({super.key});

  @override
  State<NewCustomer> createState() => _NewCustomerState();
}

class _NewCustomerState extends State<NewCustomer> {
  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
    List<Service> services = serviceBuilder();

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
            actions: [
              IconButton(onPressed: () {Navigator.pushNamed(context, '/add_appointments');}, icon: const Icon(Icons.notifications, color: Colors.white,))
            ],
            leading: GestureDetector(
              child: const Icon(Icons.arrow_back_ios_new, color: Colors.white,),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            expandedHeight: ((35*pageHeight)/100),
            collapsedHeight: ((10*pageHeight)/100),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Domains',
                style: TextStyle(
                  fontSize: 40,
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
              children: services.map<Widget>((e) {return Container(child: e.serviceCard(context),);}).toList(),
            ),
          ),
        ],
      )
    );
  }
}


class Service {
  String serviceName;
  int avgRating;
  int avgPrice;

  Service({required this.serviceName, required this.avgRating, required this.avgPrice});

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(serviceName: map['service'] as String, avgRating: map['rating'], avgPrice: map['price']);
  }

  Widget serviceCard (context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      child: NeumorphicCard(
        theChild: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/add_appointments", arguments: {'serviceName' : serviceName});
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  serviceName,
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
                      avgRating.toString(),
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      avgPrice.toString(),
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
      ),
    );
  }
}