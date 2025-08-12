// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/core/functions/app_size.dart';
import 'package:food_delivery_app/core/models/products_model.dart';
import 'package:provider/provider.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    required this.id,
    required this.image,
    required this.text1,
    required this.text2,
    required this.price,
  });

  final int id;
  final String image;
  final String text1;
  final String text2;
  final double price;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartController>(context);
    final isAdded = cart.isInCart(id);

    return Container(
      height: DeviceWidthHeight.perentageOfHeight(250),
      width: DeviceWidthHeight.perentageOfWidth(140),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          DeviceWidthHeight.perentageOfWidth(15),
        ),
        color: Colors.grey.shade100,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            height: DeviceWidthHeight.perentageOfHeight(133),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                DeviceWidthHeight.perentageOfWidth(10),
              ),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: DeviceWidthHeight.perentageOfHeight(5)),

          // Title
          Text(
            text1,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),

          // Subtitle
          Text(
            text2,
            style: TextStyle(color: Colors.red.shade300, fontSize: 13),
          ),

          const Spacer(),

          // Add/Remove Button
          Container(
            width: double.infinity,
            height: DeviceWidthHeight.perentageOfHeight(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                DeviceWidthHeight.perentageOfWidth(10),
              ),
              color: isAdded ? Colors.white70 : Colors.grey.shade400,
            ),
            child: TextButton(
              onPressed: () {
                final product = ProductsModel(
                  isAdded: true,
                  id: id,
                  title: text1,
                  desc: text2,
                  image: image,
                  price: price,
                  quantity: 1,
                );

                if (isAdded) {
                  cart.removeItemFromCart(product);
                } else {
                  cart.addItemToCart(product);
                }
              },
              child: Text(
                isAdded ? "Remove from cart" : "Add to cart",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isAdded ? Colors.redAccent : Colors.black,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
