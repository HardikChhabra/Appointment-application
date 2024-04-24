import 'package:flutter/material.dart';

class CustomerHome extends StatefulWidget {
  const CustomerHome({super.key});

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {

  @override
  Widget build(BuildContext context) {
    Service s1 = Service(serviceName: "Application Development", avgRating: 3, avgPrice: 30000);
    Service s2 = Service(serviceName: "API", avgRating: 4, avgPrice: 20000);
    Service s3 = Service(serviceName: "Cloud Computing", avgRating: 3, avgPrice: 25000);
    Service s4 = Service(serviceName: "Networking", avgRating: 5, avgPrice: 25000);
    Service s5 = Service(serviceName: "Security", avgRating: 2, avgPrice: 10000);
    List<Service> services = [s1,s2,s3,s4,s5];
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                ),
              )
            ],//[]
          ),
          const SizedBox(height: 300,),
          ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, index) {
              return services[index].serviceCard();
            },
          )
        ],//[]
      ),
    );
  }
}


class Service {
  String serviceName;
  int avgRating;
  int avgPrice;

  Service({required this.serviceName, required this.avgRating, required this.avgPrice});
  Widget serviceCard () {
    return Card(
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
    );
  }
}