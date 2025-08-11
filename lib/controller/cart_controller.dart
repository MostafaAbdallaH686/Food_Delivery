import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/models/products_model.dart';

import 'package:flutter/foundation.dart';

class CartController extends ChangeNotifier {
  List<ProductsModel> cartItems = [];

  /// Add item to cart (or increase quantity if already exists)
  void addItemToCart(ProductsModel item) {
    final index = cartItems.indexWhere((element) => element.id == item.id);

    if (index != -1) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(
        ProductsModel(
          id: item.id,
          title: item.title,
          desc: item.desc,
          image: item.image,
          quantity: item.quantity,
          price: item.price,
        ),
      );
    }

    notifyListeners();
  }

  /// Remove item completely from cart
  void removeItemFromCart(ProductsModel item) {
    cartItems.removeWhere((element) => element.id == item.id);
    notifyListeners();
  }

  /// Increase quantity
  void increaseQuantity(ProductsModel item) {
    final index = cartItems.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      cartItems[index].quantity++;
      notifyListeners();
    }
  }

  /// Decrease quantity (remove if reaches zero)
  void decreaseQuantity(ProductsModel item) {
    final index = cartItems.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
      }
      notifyListeners();
    }
  }

  /// Calculate subtotal (sum of item quantity * price)
  double get subtotal {
    double total = 0;
    for (var item in cartItems) {
      // Assuming you have a `price` property in ProductsModel
      total += (item.quantity * (item.price));
    }
    return total;
  }

  /// Calculate total with delivery & tax
  double get total {
    const double deliveryFee = 20.0;
    const double taxRate = 0.1; // 10%
    return subtotal + deliveryFee + (subtotal * taxRate);
  }

  /// Reset cart (e.g., after checkout)
  void resetCart() {
    cartItems.clear();
    notifyListeners();
  }
}
