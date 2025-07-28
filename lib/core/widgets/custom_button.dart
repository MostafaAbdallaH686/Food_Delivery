import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/functions/app_size.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isselected;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.text,
    required this.isselected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color color = isselected ? Colors.redAccent.shade100 : Colors.red;
    Color textcolor = isselected ? Colors.black : Colors.white;

    return Container(
      height: DeviceWidthHeight.perentageOfHeight(40),
      width: DeviceWidthHeight.perentageOfWidth(169),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          DeviceWidthHeight.perentageOfWidth(30),
        ),
      ),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: textcolor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
