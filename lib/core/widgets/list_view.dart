// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/functions/app_size.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
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
      margin: EdgeInsets.symmetric(
        vertical: DeviceWidthHeight.perentageOfHeight(8),
      ),
      padding: EdgeInsets.all(DeviceWidthHeight.perentageOfWidth(8)),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(
          DeviceWidthHeight.perentageOfWidth(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image container
          Container(
            width: DeviceWidthHeight.perentageOfWidth(80),
            height: DeviceWidthHeight.perentageOfHeight(90),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                DeviceWidthHeight.perentageOfWidth(8),
              ),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: DeviceWidthHeight.perentageOfWidth(10)),

          // Texts and button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: DeviceWidthHeight.perentageOfHeight(2)),
                Text(
                  text2,
                  style: TextStyle(color: Colors.red.shade300, fontSize: 13),
                ),
              ],
            ),
          ),

          // Add to cart button
          SizedBox(
            height: DeviceWidthHeight.perentageOfHeight(30),
            width: DeviceWidthHeight.perentageOfWidth(100),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    DeviceWidthHeight.perentageOfWidth(8),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: DeviceWidthHeight.perentageOfWidth(12),
                ),
              ),
              onPressed: () {
                print("Added to cart");
              },
              child: const Text(
                textAlign: TextAlign.center,
                "Add to cart",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
