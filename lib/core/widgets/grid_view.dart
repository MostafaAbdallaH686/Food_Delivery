// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/functions/app_size.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    required this.image,
    required this.text1,
    required this.text2,
  });

  final String image;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DeviceWidthHeight.perentageOfHeight(300),
      width: DeviceWidthHeight.perentageOfWidth(140),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          DeviceWidthHeight.perentageOfWidth(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: DeviceWidthHeight.perentageOfHeight(133),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                DeviceWidthHeight.perentageOfWidth(10),
              ),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            text1,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          Text(
            text2,
            style: TextStyle(color: Colors.red.shade300, fontSize: 13),
          ),
          SizedBox(height: DeviceWidthHeight.perentageOfHeight(4)),
          Container(
            width: double.infinity,
            height: DeviceWidthHeight.perentageOfHeight(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                DeviceWidthHeight.perentageOfWidth(10),
              ),
              color: Colors.grey.shade400,
            ),
            child: TextButton(
              onPressed: () {
                print("Added to cart");
              },
              child: const Text(
                textAlign: TextAlign.center,
                "Add to cart",
                style: TextStyle(color: Colors.black, fontSize: 11),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
