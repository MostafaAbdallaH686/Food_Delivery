// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/asset_image.dart';
import 'package:food_delivery_app/core/functions/app_size.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: DeviceWidthHeight.perentageOfHeight(30)),
          SizedBox(
            width: DeviceWidthHeight.perentageOfWidth(150),
            height: DeviceWidthHeight.perentageOfHeight(150),
            child: CircleAvatar(
              backgroundImage: AssetImage(Myimages.profile),
              radius: 20,
              backgroundColor: Colors.white,
            ),
          ),
          SizedBox(height: DeviceWidthHeight.perentageOfHeight(10)),
          Text(
            "Mostafa AbdallaH",
            style: TextStyle(fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: DeviceWidthHeight.perentageOfHeight(5)),
          Text(
            "mostafaabdallah686@gamil.com",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.red[300],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: DeviceWidthHeight.perentageOfHeight(30)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red[50]),
            onPressed: () {
              print(">>>>>>>i am out<<<<<<<<< ");
            },
            child: Text("Log out"),
          ),
        ],
      ),
    );
  }
}
