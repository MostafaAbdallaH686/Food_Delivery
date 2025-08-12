import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/core/functions/app_size.dart';
import 'package:provider/provider.dart';

class CustomlistTile extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final int id;
  final int quantity;
  final bool showActionButtons;
  const CustomlistTile({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,

    this.showActionButtons = true,
    required this.id,
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
      height: DeviceWidthHeight.perentageOfHeight(
        DeviceWidthHeight.perentageOfHeight(150),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: DeviceWidthHeight.perentageOfWidth(
              DeviceWidthHeight.perentageOfWidth(100),
            ),
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                DeviceWidthHeight.perentageOfWidth(
                  DeviceWidthHeight.perentageOfWidth(15),
                ),
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
                cartController.decreaseQuantity(widget.id);
              }),
              Text("${widget.quantity}"),
              _actionButton(Icon(Icons.add), () {
                cartController.increaseQuantity(widget.id);
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
