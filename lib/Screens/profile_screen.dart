import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/profile_screen_body.dart';
import 'package:food_delivery_app/core/widgets/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Profile"),
      body: ProfileScreenBody(),
    );
  }
}
