import 'package:flutter/material.dart';

class Banktype extends StatelessWidget {
  const Banktype({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Banks(
                iconType: Icons.paypal,
                colorType: Colors.blue.shade900,
              ),
              Banks(
                iconType: Icons.sports_basketball_rounded,
                colorType: Colors.red,
              ),
              Banks(
                iconType: Icons.recycling,
                colorType: Colors.orange,
              ),
              Banks(
                iconType: Icons.bubble_chart_outlined,
                colorType: Colors.green,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Banks(
                iconType: Icons.bubble_chart_outlined,
                colorType: Colors.green,
              ),
              Banks(
                iconType: Icons.recycling,
                colorType: Colors.orange,
              ),
              Banks(
                iconType: Icons.lte_plus_mobiledata_outlined,
                colorType: Colors.blue.shade900,
              ),
              Banks(
                iconType: Icons.account_tree,
                colorType: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Banks extends StatelessWidget {
  final IconData iconType;
  final Color colorType;

  const Banks({super.key, required this.iconType, required this.colorType});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 80,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10)),
        child: Icon(
          iconType,
          color: colorType,
        ));
  }
}
