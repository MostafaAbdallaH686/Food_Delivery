// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/core/functions/app_size.dart';
import 'package:food_delivery_app/core/widgets/custom_list_tile.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CheckoutScreenBody extends StatefulWidget {
  const CheckoutScreenBody({super.key});

  @override
  State<CheckoutScreenBody> createState() => _CheckoutScreenBodyState();
}

class _CheckoutScreenBodyState extends State<CheckoutScreenBody> {
  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context, listen: false);
    if (cartController.cartItems.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/empty.json', height: 200, width: 200),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'There is no Item in Cart, Please Discover and return here after add items',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }
    return Column(
      children: [
        SizedBox(height: DeviceWidthHeight.perentageOfHeight(5)),

        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.4,
          child: ListView.builder(
            itemCount: cartController.cartItems.length,
            itemBuilder: (context, index) {
              final cartItem = cartController.cartItems[index];
              return CustomlistTile(
                index: index,
                quantity: cartItem.quantity,
                image: cartItem.image,
                subtitlecheck: true,
                title: cartItem.title,
                subtitle: cartItem.desc,
                width: 90,
                height: 150,
                radius: 15,
              );
            },
          ),
        ),

        Padding(
          padding: EdgeInsets.all(DeviceWidthHeight.perentageOfWidth(8)),
          child: Column(
            spacing: DeviceWidthHeight.perentageOfHeight(20),
            children: [
              _textpricess("SubTotal", "\$25.0"),
              _textpricess("Delivery fees", "\$5.00"),
              _textpricess("Taxes", "\$2.50"),
              _textpricess("Total", "\$32.5"),
              SizedBox(height: DeviceWidthHeight.perentageOfHeight(10)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print(">>>>>>>Check OUT<<<<<<");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[600],
                  ),

                  child: Text(
                    "Check out",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _textpricess(String txt1, String txt2) {
  return Row(children: [Text(txt1), Spacer(), Text(txt2)]);
}
