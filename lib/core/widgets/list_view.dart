// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/core/functions/app_size.dart';
import 'package:food_delivery_app/core/models/products_model.dart';
import 'package:provider/provider.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({
    super.key,
    required this.image,
    required this.text1,
    required this.text2,
    required this.id,
    required this.price,
  });

  final int id;
  final String image;
  final String text1;
  final String text2;
  final double price;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  bool isAdded = false;

  void _toggleCart() {
    final product = ProductsModel(
      id: widget.id,
      title: widget.text1,
      desc: widget.text2,
      image: widget.image,
      price: widget.price,
      quantity: 1,
      isAdded: isAdded,
    );

    final cart = Provider.of<CartController>(context, listen: false);

    if (isAdded) {
      cart.removeItemFromCart(product);
    } else {
      cart.addItemToCart(product);
    }

    setState(() {
      isAdded = !isAdded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: DeviceWidthHeight.perentageOfHeight(8),
      ),
      padding: EdgeInsets.all(DeviceWidthHeight.perentageOfWidth(8)),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(
          DeviceWidthHeight.perentageOfWidth(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image container
          Container(
            width: DeviceWidthHeight.perentageOfWidth(80),
            height: DeviceWidthHeight.perentageOfHeight(90),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                DeviceWidthHeight.perentageOfWidth(8),
              ),
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: DeviceWidthHeight.perentageOfWidth(10)),

          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text1,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: DeviceWidthHeight.perentageOfHeight(2)),
                Text(
                  widget.text2,
                  style: TextStyle(color: Colors.red.shade300, fontSize: 13),
                ),
              ],
            ),
          ),

          // Add/Remove button
          SizedBox(
            height: DeviceWidthHeight.perentageOfHeight(30),
            width: DeviceWidthHeight.perentageOfWidth(100),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor:
                    isAdded ? Colors.white70 : Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    DeviceWidthHeight.perentageOfWidth(8),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: DeviceWidthHeight.perentageOfWidth(12),
                ),
              ),
              onPressed: _toggleCart,
              child: Text(
                textAlign: TextAlign.center,
                isAdded ? "Remove from cart" : "Add to cart",
                style: TextStyle(
                  color: isAdded ? Colors.redAccent : Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/controller/cart_controller.dart';
// import 'package:food_delivery_app/core/functions/app_size.dart';
// import 'package:food_delivery_app/core/models/products_model.dart';
// import 'package:provider/provider.dart';

// class CustomListView extends StatefulWidget {
//   const CustomListView({
//     super.key,
//     required this.image,
//     required this.text1,
//     required this.text2,
//     required this.id, required this.price,
//   });
//   final int id;
//   final String image;
//   final String text1;
//   final String text2;
//   final double price;

//   @override
//   State<CustomListView> createState() => _CustomListViewState();
// }

// class _CustomListViewState extends State<CustomListView> {
//   bool isAdded = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(
//         vertical: DeviceWidthHeight.perentageOfHeight(8),
//       ),
//       padding: EdgeInsets.all(DeviceWidthHeight.perentageOfWidth(8)),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(
//           DeviceWidthHeight.perentageOfWidth(10),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.shade300,
//             blurRadius: 5,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Image container
//           Container(
//             width: DeviceWidthHeight.perentageOfWidth(80),
//             height: DeviceWidthHeight.perentageOfHeight(90),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(
//                 DeviceWidthHeight.perentageOfWidth(8),
//               ),
//               image: DecorationImage(
//                 image: AssetImage(widget.image),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SizedBox(width: DeviceWidthHeight.perentageOfWidth(10)),

//           // Texts and button
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   widget.text1,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 17,
//                   ),
//                 ),
//                 SizedBox(height: DeviceWidthHeight.perentageOfHeight(2)),
//                 Text(
//                   widget.text2,
//                   style: TextStyle(color: Colors.red.shade300, fontSize: 13),
//                 ),
//               ],
//             ),
//           ),

//           // Add to cart button
//           SizedBox(
//             height: DeviceWidthHeight.perentageOfHeight(30),
//             width: DeviceWidthHeight.perentageOfWidth(100),
//             child: TextButton(
//               style: TextButton.styleFrom(
//                 backgroundColor:
//                     isAdded == false ? Colors.grey.shade300 : Colors.white70,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(
//                     DeviceWidthHeight.perentageOfWidth(8),
//                   ),
//                 ),
//                 padding: EdgeInsets.symmetric(
//                   horizontal: DeviceWidthHeight.perentageOfWidth(12),
//                 ),
//               ),
//               onPressed: () {
//                 setState(() {
//                   isAdded = !isAdded;
//                 });

//                 Provider.of<CartController>(context, listen: false).addItemToCart(
//                   ProductsModel(
//                     price: widget.price ,
//                     isAdded: isAdded,
//                     desc: widget.text2,
//                     id: widget.id,
//                     image: widget.image,
//                     title: widget.text1,
//                     quantity: 1,
//                   ),
//                 );
//               },
//               child: Text(
//                 textAlign: TextAlign.center,
//                 isAdded == false ? "Add to cart" : "Remove from cart",
//                 style: TextStyle(
//                   color: isAdded == false ? Colors.black : Colors.redAccent,
//                   fontSize: 12,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
