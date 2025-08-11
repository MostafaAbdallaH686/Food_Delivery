// ignore_for_file: deprecated_member_use
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/core/functions/app_size.dart';
import 'package:food_delivery_app/core/models/products_model.dart';
import 'package:food_delivery_app/core/utils/asset_image.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/widgets/grid_view.dart';
import 'package:food_delivery_app/core/widgets/list_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isListSelected = true;
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: DeviceWidthHeight.perentageOfWidth(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: DeviceWidthHeight.perentageOfHeight(40),

              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(
                  DeviceWidthHeight.perentageOfWidth(12),
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      DeviceWidthHeight.perentageOfWidth(12),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      DeviceWidthHeight.perentageOfWidth(12),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      DeviceWidthHeight.perentageOfWidth(12),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.1),
                      width: 1,
                    ),
                  ),

                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: DeviceWidthHeight.perentageOfWidth(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.red.shade300),
                        SizedBox(width: DeviceWidthHeight.perentageOfWidth(5)),
                        Text(
                          "Search for foods",
                          style: TextStyle(
                            color: Colors.red.shade300,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: DeviceWidthHeight.perentageOfWidth(15)),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: DeviceWidthHeight.perentageOfHeight(220),
                viewportFraction: 1,
              ),
              items:
                  items.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: DeviceWidthHeight.perentageOfHeight(150),
                              margin: EdgeInsets.symmetric(
                                horizontal: DeviceWidthHeight.perentageOfWidth(
                                  5,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  DeviceWidthHeight.perentageOfWidth(10),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(item['image']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: DeviceWidthHeight.perentageOfHeight(15),
                            ),

                            Text(
                              item['text']!,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
            ),
            Text(
              "Featured Items",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: DeviceWidthHeight.perentageOfHeight(15)),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomButton(
                  text: "List View",
                  isselected: isListSelected,
                  onTap: () {
                    setState(() {
                      isListSelected = true;
                    });
                  },
                ),
                SizedBox(width: DeviceWidthHeight.perentageOfWidth(5)),
                CustomButton(
                  text: "Grid View",
                  isselected: !isListSelected,
                  onTap: () {
                    setState(() {
                      isListSelected = false;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: DeviceWidthHeight.perentageOfHeight(10)),

            // View Switcher
            Expanded(
              child:
                  isListSelected
                      ? ListView.separated(
                        itemCount: ProductsModel.productsList.length,
                        separatorBuilder:
                            (context, index) => SizedBox(
                              height: DeviceWidthHeight.perentageOfHeight(1),
                            ),
                        itemBuilder: (context, index) {
                          final cartItem = ProductsModel.productsList[index];

                          return CustomListView(
                            id: index,
                            image: cartItem.image,
                            text1: cartItem.title,
                            text2: cartItem.desc,
                            price: index * 12.2,
                          );
                        },
                      )
                      : GridView.builder(
                        itemCount: ProductsModel.productsList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 2 / 3,
                            ),
                        itemBuilder: (context, index) {
                          final cartItem = ProductsModel.productsList[index];

                          return CustomGridView(
                            image: cartItem.image,
                            text1: cartItem.title,
                            text2: cartItem.desc,
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> items = [
  {'image': Myimages.burger, 'text': "burger"},
  {'image': Myimages.nescalop, 'text': "nescalop"},
  {'image': Myimages.sandwitch, 'text': "sandwitch"},
];
