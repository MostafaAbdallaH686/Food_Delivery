// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/navigation_bar.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/core/functions/app_route.dart';
import 'package:food_delivery_app/core/functions/app_size.dart';
import 'package:food_delivery_app/core/widgets/custom_list_tile.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CheckoutScreenBody extends StatelessWidget {
  const CheckoutScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, cartController, child) {
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
                    quantity: cartItem.quantity,
                    id: cartItem.id,
                    image: cartItem.image,
                    title: cartItem.title,
                    subtitle: cartItem.desc,
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(DeviceWidthHeight.perentageOfWidth(8)),
              child: Column(
                spacing: DeviceWidthHeight.perentageOfHeight(20),
                children: [
                  _textpricess(
                    "SubTotal",
                    "\$${(cartController.subtotal).toStringAsFixed(2)}",
                  ),
                  _textpricess("Delivery fees", "\$20"),
                  _textpricess(
                    "Taxes",
                    "\$${(cartController.subtotal * .1).toStringAsFixed(2)}",
                  ),
                  _textpricess(
                    "Total",
                    "\$${(cartController.total).toStringAsFixed(2)}",
                  ),
                  SizedBox(height: DeviceWidthHeight.perentageOfHeight(10)),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) {
                            return Center(
                              child: Lottie.asset(
                                "assets/lottie/aW4ovttY1S.json",
                                width: DeviceWidthHeight.perentageOfWidth(300),
                                height: DeviceWidthHeight.perentageOfHeight(
                                  500,
                                ),
                                repeat: false,
                                onLoaded: (composition) {
                                  Future.delayed(composition.duration, () {
                                    cartController.resetCart();
                                    AppRoute.navigateToAndDeleteAllPathRoute(
                                      MainNavigation(index: 0),
                                    );
                                  });
                                },
                              ),
                            );
                          },
                        );
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
      },
    );
  }
}

Widget _textpricess(String txt1, String txt2) {
  return Row(children: [Text(txt1), Spacer(), Text(txt2)]);
}
