// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/asset_image.dart';
import 'package:food_delivery_app/core/functions/app_size.dart';
import 'package:food_delivery_app/core/widgets/custom_list_tile.dart';

class CheckoutScreenBody extends StatefulWidget {
  const CheckoutScreenBody({super.key});

  @override
  State<CheckoutScreenBody> createState() => _CheckoutScreenBodyState();
}

class _CheckoutScreenBodyState extends State<CheckoutScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: DeviceWidthHeight.perentageOfHeight(5)),
        CustomlistTile(
          image: Myimages.burger,
          title: "Burger Palace",
          subtitle: "2 items",
          width: 70,
          height: 100,
          radius: 12,
          showActionButtons: false,
        ),

        CustomlistTile(
          image: Myimages.burger,
          subtitlecheck: true,
          title: "Classic Burger",
          subtitle2: "Burger Palace",
          subtitle: "Size :Large",
          width: 90,
          height: 120,
          radius: 15,
        ),
        CustomlistTile(
          image: Myimages.burger,
          title: "Chicken Burger",
          subtitlecheck: true,
          subtitle2: "Burger Palace",
          subtitle: "Size : Medium",
          width: 90,
          height: 120,
          radius: 15,
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
              SizedBox(height: DeviceWidthHeight.perentageOfHeight(22.9)),
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
