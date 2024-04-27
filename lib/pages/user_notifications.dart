import 'package:appointment_app/neumorphism.dart';
import 'package:flutter/material.dart';

class UserNotifications extends StatefulWidget {
  const UserNotifications({super.key});

  @override
  State<UserNotifications> createState() => _UserNotificationsState();
}

class _UserNotificationsState extends State<UserNotifications> {

  Map? data = {};
  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
    data = ModalRoute.of(context)?.settings.arguments as Map;
    List<Notify> notifications = data!['listNotifications'];
    if(notifications.isEmpty){
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
                  'Notifications',
                  style: TextStyle(
                    fontSize: 35,
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
            const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  "No notifications\nyet...",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2.0
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
    else{
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
                    'Notifications',
                    style: TextStyle(
                      fontSize: 25,
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
                  children: notifications.map<Widget>((e) {return Container(child: e.notificationCard(() {
                    setState(() {
                      notifications.remove(e);
                      //add logic to remove the notification from database

                    });
                  }),);}).toList(),
                ),
              ),
            ],
          )
      );
    }
  }
}


class Notify {
  String companyName;
  String service;
  Notify({required this.companyName, required this.service});

  factory Notify.fromMap(Map<String, dynamic> map) {
    return Notify(companyName: map['comp_name'], service: map['service']);
  }

  Widget notificationCard( Function() removeNotification ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      child: NeumorphicCard(
        theChild: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                companyName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2.0,
                ),
              ),
              const Text(
                "has accepted your offer for",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 2.0,
                ),
              ),
              Center(
                child: Text(
                  service,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              IconButton(
                onPressed: removeNotification,
                icon: const Icon(Icons.cancel, color: Colors.black,),
              )
            ],//[]
          ),
        ),
      ),
    );
  }
}