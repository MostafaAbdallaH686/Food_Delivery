import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/checkout_screen_body.dart';
import 'package:food_delivery_app/core/widgets/custom_appbar.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Cart"),
      body: CheckoutScreenBody(),
    );
  }
}
