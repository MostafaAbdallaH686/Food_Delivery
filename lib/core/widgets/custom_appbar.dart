// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/functions/app_route.dart';
import 'package:food_delivery_app/core/functions/app_size.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          SizedBox(width: DeviceWidthHeight.perentageOfWidth(4)),
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => AppRoute.navigateBack(),
          ),
          SizedBox(width: DeviceWidthHeight.perentageOfWidth(95)),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
