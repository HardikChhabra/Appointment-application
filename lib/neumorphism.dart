import 'package:flutter/material.dart';

class NeumorphicCard extends StatelessWidget {

  final Widget theChild;
  const NeumorphicCard({super.key, required this.theChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            offset: const Offset(5, 5),
            blurRadius: 10,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-5, -5),
            blurRadius: 10
          )
        ]
      ),
      child: theChild,
    );
  }
}
