import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/functions/app_size.dart';

int _count = 1;

class CustomlistTile extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final double width;
  final double radius;
  final double height;

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
  });

  @override
  State<CustomlistTile> createState() => _CustomlistTileState();
}

class _CustomlistTileState extends State<CustomlistTile> {
  @override
  Widget build(BuildContext context) {
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
          if (widget.showActionButtons)
            Row(
              children: [
                _actionButton(Icon(Icons.remove), () {
                  setState(() {
                    _count = _count - 1;
                  });
                }),

                Text(" $_count "),
                _actionButton(Icon(Icons.add), () {
                  _count = _count + 1;
                  setState(() {});
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
