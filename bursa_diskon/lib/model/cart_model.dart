import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // List of items on sale
  final List _shopItems = [
    // [itemName, itemPrice, imagePath, color]
    ["Handbag", "390.00", "lib/images/handbag.jpg", Colors.green],
    ["Heels", "500.00", "lib/images/heels.jpg", Colors.red],
    ["Makeup", "100.00", "lib/images/makeup.jpg", Colors.blue],
    ["Parfume", "275.00", "lib/images/parfume.jpg", Colors.brown],
  ];

  // List of cart items
  List _cartItems = [];

  // history of completed checkouts
  List _checkoutHistory = []; // menyimpan history co

  // Getter for shop items
  get shopItems => _shopItems;

  // Getter for cart items
  get cartItems => _cartItems;

  // Getter for history items
  get checkoutHistory => _checkoutHistory;

  // Add item to cart
  void addItemToCart(int index) {
    // Check if the item already exists in the cart
    bool itemExists = false;
    for (var item in _cartItems) {
      if (item['name'] == _shopItems[index][0]) {
        item['quantity'] += 1;
        itemExists = true;
        break;
      }
    }

    // If item doesn't exist, add new item to cart with quantity 1
    if (!itemExists) {
      _cartItems.add({
        'name': _shopItems[index][0],
        'price': _shopItems[index][1],
        'imagePath': _shopItems[index][2],
        'color': _shopItems[index][3],
        'quantity': 1,
      });
    }
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(int index) {
    // Check if the quantity is more than 1, just reduce it
    if (_cartItems[index]['quantity'] > 1) {
      _cartItems[index]['quantity'] -= 1;
    } else {
      // If quantity is 1, remove the item from the cart
      _cartItems.removeAt(index);
    }
    notifyListeners();
  }

  // increase quantity of item in cart
  void increaseQuantity(int index) {
    _cartItems[index] ['quantity'] += 1;
    notifyListeners();
  }

  // decrease quantity of item in cart
  void decreaseQuantity(int index) {
    if (_cartItems[index] ['quantity'] > 1 ) {
      _cartItems[index] ['quantity'] -= 1;
    } else {
      _cartItems.removeAt(index);
    }
    notifyListeners();
  }

  // Save Checkout history
  void saveCheckoutHistory() {
    _checkoutHistory.add({
      'items': List.from(_cartItems),
      'total': calculateTotal(),
      'date': DateTime.now().toString(), 
    });
  }

  // clear cart after co
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
  
  // Calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (var item in _cartItems) {
      totalPrice += double.parse(item['price']) * item['quantity'];
    }
    return totalPrice.toStringAsFixed(2);
  }
}
