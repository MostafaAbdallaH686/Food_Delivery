import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/models/products_model.dart';

import 'package:flutter/foundation.dart';

class CartController extends ChangeNotifier {
  List<ProductsModel> cartItems = [];
  bool _isListSelected = true;
  bool get isListSelected => _isListSelected;

  void addItemToCart(ProductsModel item) {
    final index = cartItems.indexWhere((element) => element.id == item.id);

    if (index != -1) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(
        ProductsModel(
          isAdded: item.isAdded,
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

  bool isInCart(int id) {
    return cartItems.any((item) => item.id == id);
  }

  /// Remove item completely from cart
  void removeItemFromCart(ProductsModel item) {
    cartItems.removeWhere((element) => element.id == item.id);
    item.isAdded = false;
    notifyListeners();
  }

  /// Increase quantity
  void increaseQuantity(int productId) {
    final index = cartItems.indexWhere((element) => element.id == productId);
    if (index != -1) {
      cartItems[index].quantity++;

      notifyListeners();
    }
  }

  /// Decrease quantity (remove if reaches zero)
  void decreaseQuantity(int productId) {
    final index = cartItems.indexWhere((element) => element.id == productId);
    if (index != -1) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
      }

      notifyListeners();
    }
  }

  // change between listview&gridview
  void setListSelected(bool value) {
    _isListSelected = value;
    notifyListeners();
  }

  void toggleView(bool listSelected) {
    _isListSelected = listSelected;
    notifyListeners();
  }

  /// Calculate subtotal (sum of item quantity * price)
  double get subtotal {
    double total = 0;
    for (var item in cartItems) {
      total += ((item.quantity) * (item.price));
    }
    return total;
  }

  /// Calculate total with delivery & tax
  double get total {
    const double deliveryFee = 20.0;
    const double taxRate = 0.1; // 10%
    return (subtotal + deliveryFee + (subtotal * taxRate));
  }

  void resetCart() {
    cartItems.clear();
    notifyListeners();
  }
}
