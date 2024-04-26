import 'package:appointment_app/neumorphism.dart';
import 'package:appointment_app/pages/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {

  void openAnimatedDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (context, a1, a2, widget) {
        return  AlertDialog(
          title: const Text(
            'Offer Made',
          ),
          content: const Text(
              'Please press back to make more offers'
          ),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        );
      },
    );
  }


  Map? data ={};
  List<AvailableCompanies> offers = [];
  @override
  Widget build(BuildContext context) {
    data = data!.isNotEmpty ?data: ModalRoute.of(context)?.settings.arguments as Map;
    String serviceInUse = data?['serviceName'];
    List<AvailableCompanies> companies = companyBuilder(serviceInUse);
    double pageHeight = MediaQuery.of(context).size.height;
    double pageWidth = MediaQuery.of(context).size.width;
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
                'Services',
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
              children: companies.map<Widget>((e) {return Container(child: e.companyCard(
                      (){
                    offers.add(e);
                    e.isEnabled = true;
                  },
                      () {
                    offers.remove(e);
                    e.isEnabled = false;
                  },
                  pageWidth
              ),);}).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openAnimatedDialog(context);
          //add logic to make offer in database
        },
        backgroundColor: Colors.white.withRed(18).withGreen(56).withBlue(95).withOpacity(1),
        child: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
      ),
    );
  }
}


class AvailableCompanies {
  String companyName;
  int rating;
  int price;
  int duration;
  bool isEnabled = false;

  AvailableCompanies({required this.companyName, required this.rating, required this.price, required this.duration });

  factory AvailableCompanies.fromMap(Map<String, dynamic> map) {
    return AvailableCompanies(companyName: map['name'] as String, rating: map['rating'], price: map['price'], duration: map['duration']);
  }

  Widget companyCard ( Function() addToList, Function() removeFromList, double pageWidth ) {
    return Padding(
      padding: EdgeInsets.all(pageWidth*0.02),
      child: NeumorphicCard(
        theChild: Padding(
          padding: EdgeInsets.all(pageWidth*0.01),
          child: GestureDetector(
            onTap: isEnabled?removeFromList:addToList,
            child: Column(
              children: [
                Text(
                  companyName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(pageWidth*0.002),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.star, color: Colors.black,),
                          Padding(
                            padding: EdgeInsets.all(pageWidth*0.002),
                            child: Text(
                              rating.toString(),
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.money, color: Colors.black,),
                          Padding(
                            padding: EdgeInsets.all(pageWidth*0.002),
                            child: Text(
                              price.toString(),
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.schedule, color: Colors.black,),
                          Padding(
                            padding: EdgeInsets.all(pageWidth*0.002),
                            child: Text(
                              duration.toString(),
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}