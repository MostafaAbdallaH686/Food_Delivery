import 'package:food_delivery_app/core/utils/asset_image.dart';

class ProductsModel {
  final int id;
  final String image;
  final String title;
  final String desc;
  int quantity;
  bool isAdded;
  final double price;

  ProductsModel({
    required this.price,
    required this.id,
    required this.image,
    required this.title,
    required this.desc,
    required this.quantity,
    this.isAdded = false,
  });

  /// Generates a dummy food
  static final List<ProductsModel> productsList = [
    for (int i = 0; i < 100; i++)
      ProductsModel(
        price: ((i + 1) * 10) / 2,
        id: i,
        image: _getFoodImage(i),
        title: _getFoodTitle(i),
        desc: _getFoodDescription(i),
        quantity: 0,
        isAdded: false,
      ),
  ];

  static String _getFoodTitle(int index) {
    final foodNames = ['Burger', 'Nescalop', 'Sandwitch'];
    return '${foodNames[index % foodNames.length]} ${(index ~/ foodNames.length) + 1}';
  }

  static String _getFoodImage(int index) {
    final foodImages = [Myimages.burger, Myimages.nescalop, Myimages.sandwitch];
    return foodImages[index % foodImages.length];
  }

  static String _getFoodDescription(int index) {
    final descriptions = [
      'delicious Burger take a bite',
      'some spicy food,Handle it',
      'you can not fit it all in',
    ];
    return descriptions[index % descriptions.length];
  }
}
