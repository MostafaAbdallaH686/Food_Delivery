import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/core/functions/app_size.dart';
import 'package:provider/provider.dart';

int _count = 1;

class CustomlistTile extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final double width;
  final double radius;
  final double height;
  final int index;
  final int quantity;

  final bool subtitlecheck;
  final bool showActionButtons;
  const CustomlistTile({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.width,
    required this.height,
    required this.radius,
    this.subtitlecheck = false,
    this.showActionButtons = true,
    required this.index,
    required this.quantity,
  });

  @override
  State<CustomlistTile> createState() => _CustomlistTileState();
}

class _CustomlistTileState extends State<CustomlistTile> {
  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context, listen: false);

    return Container(
      padding: EdgeInsets.all(DeviceWidthHeight.perentageOfWidth(8)),
      height: DeviceWidthHeight.perentageOfHeight(widget.height),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: DeviceWidthHeight.perentageOfWidth(widget.width),
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                DeviceWidthHeight.perentageOfWidth(widget.radius),
              ),
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: DeviceWidthHeight.perentageOfWidth(16)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                SizedBox(height: DeviceWidthHeight.perentageOfHeight(4)),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.red[300],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              _actionButton(Icon(Icons.remove), () {
                print("${widget.quantity}");
                cartController.decreaseQuantity(widget.index);
              }),

              Text("${cartController.cartItems[widget.index].id}"),
              _actionButton(Icon(Icons.add), () {
                cartController.increaseQuantity(widget.index);
              }),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _actionButton(Widget icon, Function()? ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      width: DeviceWidthHeight.perentageOfWidth(35),
      height: DeviceWidthHeight.perentageOfHeight(40),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 202, 206),
        borderRadius: BorderRadius.circular(
          DeviceWidthHeight.perentageOfWidth(15),
        ),
      ),
      child: Center(child: icon),
    ),
  );
}
